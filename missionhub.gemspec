# -*- encoding: utf-8 -*-
require File.expand_path('../lib/missionhub/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tataihono Nikora"]
  gem.email         = ["tataihono.nikora@gmail.com"]
  gem.description   = %q{Consume the MissionHub API easily with this Ruby Gem}
  gem.summary       = %q{MissionHub API for Ruby}
  gem.homepage      = ""

  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_dependency "httparty", "~> 0.8.3"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "missionhub"
  gem.require_paths = ["lib"]
  gem.version       = Missionhub::VERSION
end
