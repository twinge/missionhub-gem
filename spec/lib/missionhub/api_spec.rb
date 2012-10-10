require_relative '../../spec_helper'

describe MissionHub::API do

  describe "Defaults" do

    it "must include httparty methods" do
      MissionHub::API.must_include HTTParty
    end

  end

  describe "Authentication" do

    let(:api) { MissionHub::API.new }

    before do
      VCR.insert_cassette 'auth', :record => :new_episodes, :match_requests_on => [:body]
    end

    after do
      VCR.eject_cassette
    end

    it "must have a auth method" do
      api.must_respond_to :auth
    end

    it "must throw exception when auth is incorrect" do
      temp = MissionHub.client_secret
      MissionHub.client_secret = ''

      auth_error = lambda { api.auth }
      auth_error.must_raise RuntimeError

      MissionHub.client_secret = temp
    end

    it "must authenticate properly" do
      api.auth.must_equal true
    end
  end

  describe "Person" do

    let(:api) { MissionHub::API.new }

    before do
      VCR.insert_cassette 'auth', :record => :new_episodes, :match_requests_on => [:body]
      api.auth
    end

    after do
      VCR.eject_cassette
    end

    it "must throw exception when person is wrong type" do
      person_set_error = lambda { api.create_person('') }
      person_set_error.must_raise RuntimeError
    end

    it "must throw exception when person has no name" do
      person_set_error = lambda { api.create_person(MissionHub::Person.new) }
      person_set_error.must_raise RuntimeError
    end

    it "must be able to create person" do
      person = MissionHub::Person.new
      person.first_name = "Test"
      person.last_name = "User"
      address = MissionHub::Person::Address.new
      address.address1 = "123 Somewhere St"
      address.address2 = "Dept 2500"
      address.city = "Orlando"
      address.country = "US"
      address.state = "FL"
      address.zip = "32832"
      person.address = address
      person.email_address = "mail@google.com"
      person.gender = "female"
      person.set_answer(4952, "Hello World")
      person.set_answer(4953, "R2")
      person.set_answer(4955, "D2")
      hash_answer = {"2" => "C3", "3" => "C4"}
      person.set_answer(4954, hash_answer)
      array_answer = ["","C3","C4"]
      person.set_answer(4954, array_answer)
      person.phone = "021021021"
      response = api.create_person(person)
      response.must_be_instance_of Hash
    end
  end
end
