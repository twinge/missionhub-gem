require File.expand_path(File.join(File.dirname(__FILE__), '/missionhub.rb'))
puts <<-TXT
Ruby lib for working with the MissionHub API's JSON interface.
The first thing you need to set is the Base URI for communicating
with your MissionHub Instance.

  MissionHub.base_uri = 'http://www.missionhub.com/'

Then, you should set the authentication. You can find more info
on API Authentication at http://wiki.uscm.org/display/NCO/Authentication.

  #OAuth Two Legged Authentication
  MissionHub.client_id = 1
  MissionHub.client_secret = '32jk248bkjf0875sdasjloy'

This library is a small wrapper around the REST interface.

TXT

MissionHub.config do |c|
  # :outline  - turn's original case/test outline mode [default]
  c.base_uri = 'http://www.missionhub.com/'
  c.client_id = 6
  c.client_secret = '5b1913aa85720d7ede99dac1ad35fbf40bbc4490d9da0df346877832469daeb2'
end
