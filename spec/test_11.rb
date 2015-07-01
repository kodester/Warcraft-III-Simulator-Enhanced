require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "has HP(health points) of 500" do
    expect(@barracks.health_points).to eq(500)
  end
  end

  describe Footman do

  before :each do
    @barracks = Barracks.new
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should do deal half the (AP) damage if it's a building (Barracks) unit" do
      @footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
  end
  end
end