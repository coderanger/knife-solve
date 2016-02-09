#
# Copyright 2016, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'spec_helper'
require 'chef/knife/solve'

describe Chef::Knife::Solve do
  ROLES = {'web' => %w{httpd python}, 'db' => %w{}}

  let(:argv) { [] }
  let(:rest) { double('Chef::ServerApi') }
  subject { described_class.new(argv) }
  before do
    allow(subject).to receive(:rest).and_return(rest)
    allow(subject).to receive(:msg)
    allow(subject).to receive(:ui).and_return(double(info: nil))
    allow(Chef::RunList::RunListExpansionFromAPI).to receive(:new) do |_envirionment, run_list, _rest|
      recipes = run_list.map do |item|
        case item.type
        when :role
          ROLES[item.name] || begin
            raise "unknown role #{item.name}"
          end
        when :recipe
          item.name
        else
          raise "unknown run list item #{item}"
        end
      end.flatten
      double('RunListExpansionFromAPI', expand: nil, recipes: recipes)
    end
  end
  def expect_post(cookbooks, environment)
    expect(rest).to receive(:post_rest).with("/environments/#{environment}/cookbook_versions", 'run_list' => cookbooks).and_return([])
    subject.run
  end

  context 'with a single argument' do
    let(:argv) { %w{foo} }
    it { expect_post(%w{foo}, '_default') }
  end # /context with a single argument

  context 'with a two arguments' do
    let(:argv) { %w{foo bar} }
    it { expect_post(%w{foo bar}, '_default') }
  end # /context with a two arguments

  context 'with a recipe' do
    let(:argv) { %w{recipe[foo]} }
    it { expect_post(%w{foo}, '_default') }
  end # /context with a recipe

  context 'with a role' do
    let(:argv) { %w{role[web]} }
    it { expect_post(%w{httpd python}, '_default') }
  end # /context with a role

  context 'with comma-separated arguments' do
    let(:argv) { %w{foo,bar} }
    it { expect_post(%w{foo bar}, '_default') }
  end # /context with comma-separated arguments

  context 'with a role and a recipe' do
    let(:argv) { %w{role[web] recipe[other]} }
    it { expect_post(%w{httpd python other}, '_default') }
  end # /context with a role and a recipe

  context 'with a single comma-separated argument' do
    let(:argv) { ['foo, bar'] }
    it { expect_post(%w{foo bar}, '_default') }
  end # /context with a single comma-separated argument'
end
