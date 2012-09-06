require_relative '../../spec_helper'

describe MissionHub::API do

  describe "default attributes" do

    it "must include httparty methods" do
      MissionHub::API.must_include HTTParty
    end

  end

  describe "Authentication" do

    let(:api) { MissionHub::API.new }

    it "must have a auth method" do
      api.must_respond_to :auth
    end

    it "must fail authentication gracefully" do
      VCR.insert_cassette 'auth_fail', :record => :new_episodes
      temp = MissionHub.client_secret
      MissionHub.client_secret = ''
      api.auth.must_equal false
      MissionHub.client_secret = temp
      VCR.eject_cassette
    end

    it "must authenticate properly" do
      VCR.insert_cassette 'auth_success', :record => :new_episodes
      api.auth.must_equal true
      VCR.eject_cassette
    end

  end
end
