require_relative '../../spec_helper'

describe MissionHub, "Version" do

  it "must have version set" do
    MissionHub::VERSION.wont_be_nil
  end

end
