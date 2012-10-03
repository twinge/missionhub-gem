require 'yaml'
require 'httparty'

module MissionHub
  class API
    include HTTParty

    @access_token = ''
    @scope = Array[]

    def initialize
      self.class.base_uri MissionHub.base_uri
    end

    def auth
      options = {:body => { :grant_type => 'none', :client_id => MissionHub.client_id, :client_secret => MissionHub.client_secret } }
      response = self.class.post('/oauth/access_token', options)
      raise 'invalid client' if response.parsed_response['access_token'].nil?
      @access_token = response.parsed_response['access_token']
      raise 'invalid scope' if response.parsed_response['scope'].nil?
      @scope = response.parsed_response['scope'].split(',')
      true
    end

    def create_person(person)
      raise "Not Authenticated" if @access_token.empty?
      raise "Scope doesn't allow for contact creation" unless @scope.include?("contacts")
      raise "Peron must be a MissionHub::Person" unless person.kind_of? MissionHub::Person
      raise "First name must be set to create person" if person.first_name.nil?

      #hard_coded user_id (given by developer of API)
      person_hash = person.hash
      person_hash.delete("answers")
      options = {:body => { :person => person_hash, :answers => person.answers, :org_id => MissionHub.org_id, :user_id => 1615180, :access_token => @access_token} }
      response = self.class.post('/api/v2/contacts.json', options)
      if !response.parsed_response['error'].nil?
        raise response.parsed_response['error']
      else
        response.parsed_response['id'].to_i
      end
    end
  end
end
