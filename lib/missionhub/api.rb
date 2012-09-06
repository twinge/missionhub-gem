require 'yaml'
require 'httparty'

module MissionHub
  class API
    include HTTParty

    @access_token = ''

    def initialize
      self.class.base_uri MissionHub.base_uri
    end

    def auth
      options = {:body => { :grant_type => 'none', :client_id => MissionHub.client_id, :client_secret => MissionHub.client_secret } }
      response = self.class.post('/oauth/access_token', options)
      raise 'invalid client' if response.parsed_response['access_token'].nil?
      true
    end
  end
end
