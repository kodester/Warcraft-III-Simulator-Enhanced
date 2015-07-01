 require_relative 'spec_helper'

 describe Unit do
  before :each do
    @unit1 = Unit.new
    @unit2=Unit.new

    describe "Unit" do
    it "dead/alive unit cannot attack another unit" do
      @unit1.health_points=0
      @unit1.attack! @unit2
      expect(unit1.damage).to eq(0)
    end
  end
  end
end