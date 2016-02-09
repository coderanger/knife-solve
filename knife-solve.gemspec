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

$:.unshift(File.dirname(__FILE__) + '/lib')
require 'knife-solve/version'

Gem::Specification.new do |spec|
  spec.name = 'knife-solve'
  spec.version = KnifeSolve::VERSION
  spec.authors = ['Noah Kantrowitz']
  spec.email = %w{noah@coderanger.net}
  spec.description = 'A knife plugin to display cookbook version solutions.'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/coderanger/knife-solve'
  spec.license = 'Apache 2.0'

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w{lib}

  spec.add_dependency 'chef', '>= 11.0'

  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rspec-its', '~> 1.2'
  spec.add_development_dependency 'chefspec', '~> 4.2'
  spec.add_development_dependency 'fuubar', '~> 2.0'
  spec.add_development_dependency 'simplecov', '~> 0.9'
end
