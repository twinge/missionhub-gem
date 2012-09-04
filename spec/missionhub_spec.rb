require 'missionhub'
describe Missionhub::API do
  it "broccoli is gross" do
    Missionhub::API.portray("Broccoli").should eql("Gross!")
  end

  it "anything else is delicious" do
    Missionhub::API.portray("Not Broccoli").should eql("Delicious!")
  end
end
