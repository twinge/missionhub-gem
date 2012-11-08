#we need the actual library file
require_relative '../lib/missionhub'
#dependencies
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'turn'

Turn.config do |c|
  # :outline  - turn's original casetest outline mode [default]
  c.format  = :outline
  # turn on invokeexecute tracing, enable full backtrace
  c.trace   = 100
  # use humanized test names (works only with :outline format)
  c.natural = true
end

MissionHub.config do |c|
  c.base_uri = 'http://stage.missionhub.com/'
  c.client_id = 12
  c.client_secret = '33f84763tasf9c1fb4ce96adc4908b9ba285b510d0'
  c.org_id = 5522
end

#VCR config

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end


