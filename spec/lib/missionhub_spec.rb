require_relative '../spec_helper'

describe MissionHub do

  it "must have the base url set to the MissionHub API" do
    MissionHub.base_uri.must_equal 'https://www.missionhub.com/'
  end

  it "must have a defined client id" do
    MissionHub.client_id.wont_be_nil
  end

  it "must have a defined client secret" do
    MissionHub.client_secret.wont_be_empty
  end

end
