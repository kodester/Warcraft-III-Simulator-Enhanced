 require_relative 'spec_helper'

 describe Unit do

  before :each do
    @unit = Unit.new(100,5)
  end

  describe "#dead?" do
    it "unit is dead when HP >=0" do
      @unit.damage(12)
      expect(@unit.dead?).to eq(false)
    end

    describe "#dead?" do
    it "unit is dead when HP <=0" do
      @unit.damage(100)
      expect(@unit.dead?).to eq(true)
    end
  end

  end
end