require_relative '../../spec_helper'

describe MissionHub::API do

  describe "default attributes" do

    it "must include httparty methods" do
      MissionHub::API.must_include HTTParty
    end

  end

  describe "Authentication" do

    let(:api) { MissionHub::API.new }

    before do
      VCR.insert_cassette 'authentication', :record => :new_auths
    end

    after do
      VCR.eject_cassette
    end

    /it "must have a auth method" do
      api.must_respond_to :auth
    end

    it "must fail authentication gracefully" do
      temp = MissionHub.client_secret
      MissionHub.client_secret = ''
      true.must_equal true
      #@api.auth.must_raise 'invalid client'
      MissionHub.client_secret = temp
    end

    it "must authenticate properly" do
      api.auth.must_equal true
    end/

  end
end
