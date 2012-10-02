require_relative '../../spec_helper'

describe MissionHub::Person::Address do

  let(:address) { MissionHub::Person::Address.new }

  it "must be able to set address1" do
    address.address1 = "71 Harrow Street"
    address.address1.must_equal "71 Harrow Street"
  end

  it "must be able to set address2" do
    address.address2 = "North Dunedin"
    address.address2.must_equal "North Dunedin"
  end

  it "must be able to set city" do
    address.city = "Dunedin"
    address.city.must_equal "Dunedin"
  end

  it "must be able to set country" do
    address.country = "NZ"
    address.country.must_equal "NZ"
  end

  it "must be able to set state" do
    address.state = "Otago"
    address.state.must_equal "Otago"
  end

  it "must be able to set zip" do
    address.zip = "9016"
    address.zip.must_equal "9016"
  end

end
