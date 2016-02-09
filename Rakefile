#
# Copyright 2014-2016, Noah Kantrowitz
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

require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec, :tag) do |t, args|
  t.rspec_opts = [].tap do |a|
    a << '--color'
    a << "--format #{ENV['CI'] ? 'documentation' : 'Fuubar'}"
    a << '--backtrace' if ENV['DEBUG']
    a << "--seed #{ENV['SEED']}" if ENV['SEED']
    a << "--tag #{args[:tag]}" if args[:tag]
  end.join(' ')
end

desc 'Run all tests'
task :test => [:spec]

task :default => [:test]
