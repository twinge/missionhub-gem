require 'yaml'
require 'httparty'

module MissionHub
  class API
    include HTTParty

    @access_token = ''
    @scope

    def initialize
      self.class.base_uri MissionHub.base_uri
    end

    def auth
      options = {:body => { :grant_type => 'none', :client_id => MissionHub.client_id, :client_secret => MissionHub.client_secret } }
      response = self.class.post('/oauth/access_token', options)
      if response.parsed_response['access_token'].nil?
        false
      else
        @access_token = response.parsed_response['access_token']
        @scope = response.parsed_response['scope'].split(',')
        true
      end
    end

    def create(person)
      @scope.include?("contacts")
    end
  end
end
