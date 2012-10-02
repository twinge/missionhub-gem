# -*- encoding: utf-8 -*-
require File.expand_path('../lib/missionhub/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tataihono Nikora"]
  gem.email         = ["tataihono.nikora@gmail.com"]
  gem.description   = %q{Consume the MissionHub API easily with this Ruby Gem}
  gem.summary       = %q{MissionHub API for Ruby}
  gem.homepage      = "https://github.com/Godmedia/missionhub-gem"

  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'turn'
  gem.add_development_dependency 'rake'

  gem.add_dependency "httparty", "~> 0.9.0"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "MissionHub"
  gem.require_paths = ["lib"]
  gem.version       = MissionHub::VERSION
end
