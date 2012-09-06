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
  # :outline  - turn's original case/test outline mode [default]
  c.base_uri = 'http://www.missionhub.com/'
  c.client_id = 6
  c.client_secret = '5b1913aa85720d7ede99dac1ad35fbf40bbc4490d9da0df346877832469daeb2'
end

#VCR config

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end


