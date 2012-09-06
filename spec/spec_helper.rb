#we need the actual library file
require_relative '../lib/missionhub'
#dependencies
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/debugger' if ENV['DEBUG']
require 'webmock/minitest'
require 'vcr'
require 'turn'

Turn.config do |c|
  # :outline  - turn's original case/test outline mode [default]
  c.format  = :outline
  # turn on invoke/execute tracing, enable full backtrace
  c.trace   = true
  # use humanized test names (works only with :outline format)
  c.natural = true
end

MissionHub.config do |c|
  # :outline  - turn's original case/test outline mode [default]
  c.base_uri = 'https://www.missionhub.com/'
  c.client_id = 6
  c.client_secret = '5b1913aa85720d7ede99dac1ad35fbf40bbc4490d9da0df346877832469daeb2'
end

#VCR config

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
end


