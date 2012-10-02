require_relative '../spec_helper'

describe MissionHub do

  it "must have the base url set to the MissionHub API" do
    MissionHub.base_uri.must_equal 'http://www.missionhub.com/'
  end

  it "must have a defined client id" do
    MissionHub.client_id.wont_be_nil
  end

  it "must have a defined client secret" do
    MissionHub.client_secret.wont_be_empty
  end

  it "must have a defined organization id" do
    MissionHub.org_id.wont_be_nil
  end

end
