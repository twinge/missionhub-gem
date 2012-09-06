require File.expand_path(File.join(File.dirname(__FILE__), '/missionhub.rb'))
puts <<-TXT
Ruby lib for working with the Lighthouse API's XML interface.
The first thing you need to set is the account name.  This is the same
as the web address for your account.

  Lighthouse.account = 'activereload'

Then, you should set the authentication.  You can either use your login
credentials with HTTP Basic Authentication or with an API Tokens.  You can
find more info on tokens at http://lighthouseapp.com/help/using-beacons.

  # with basic authentication
  Lighthouse.authenticate('rick@techno-weenie.net', 'spacemonkey')

  # or, use a token
  Lighthouse.token = 'abcdefg'

If no token or authentication info is given, you'll only be granted public access.

This library is a small wrapper around the REST interface.  You should read the docs at
http://lighthouseapp.com/api.
TXT

MissionHub.config do |c|
  # :outline  - turn's original case/test outline mode [default]
  c.base_uri = 'https://www.missionhub.com/'
  c.client_id = 6
  c.client_secret = '5b1913aa85720d7ede99dac1ad35fbf40bbc4490d9da0df346877832469daeb2'
end
