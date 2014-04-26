#
# Copyright 2014, Noah Kantrowitz
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

$:.unshift(File.dirname(__FILE__) + '/lib')
require 'knife-solve/version'

Gem::Specification.new do |s|
  s.name = 'knife-solve'
  s.version = KnifeSolve::VERSION
  s.license = 'Apache 2.0'
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ['LICENSE']
  s.summary = 'Universal knife verbs that work with your Chef repository'
  s.description = s.summary
  s.author = 'Noah Kantrowitz'
  s.email = 'noah@coderanger.net'
  s.homepage = 'https://github.com/coderanger/knife-solve'

  s.add_dependency 'chef'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'

  s.require_path = 'lib'
  s.files = %w{LICENSE README.md Rakefile} + Dir.glob('{lib,spec}/**/*')
end

