require_relative '../../spec_helper'

describe MissionHub::Person::Phone do

  let(:phone) { MissionHub::Person::Phone.new }

  it "must be able to set location" do
    phone.location = "mobile"
    phone.location.must_equal "mobile"
  end

  it "must be able to set number" do
    phone.number = "021021021"
    phone.number.must_equal "021021021"
  end

  it "must be able to set primary" do
    phone.primary = 0
    phone.primary.must_equal 0
  end

end
