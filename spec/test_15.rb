require_relative 'spec_helper'
require_relative '../lib/seige_engine'

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  describe "#train_seige_engine" do

    it "costs 200 gold" do
      @barracks.train_seige_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 3 food" do
      @barracks.train_seige_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

      it "costs 60 lumber" do
      @barracks.train_seige_engine
      expect(@barracks.lumber).to eq(440) # starts at 500
    end

    it "produces a Seige Engine unit" do
      seige_engine = @barracks.train_seige_engine
      expect(seige_engine).to be_an_instance_of(Seige_engine)
    end
    describe "#can_seige_engine?" do
    it "returns true if there are enough resources to train a seige_engine" do
      expect(@barracks.can_train_seige_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      @barracks.should_receive(:food).and_return(1)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      @barracks.should_receive(:gold).and_return(134)
      expect(@barracks.can_train_seige_engine?).to be_falsey
    end
  end#describe

  describe "#train_seige_engine" do
    it "does not train a seige_engine if there aren't enough resources" do
      @barracks.should_receive(:can_train_seige_engine?).and_return(false)
      expect(@barracks.train_seige_engine).to be_nil
    end
    it "trains a seige_engine if there are enough resources" do
      @barracks.should_receive(:can_train_seige_engine?).and_return(true)
      expect(@barracks.train_seige_engine).to be_a(Seige_engine)
    end
  end
end

describe Seige_engine do
  before :each do
    @seige_engine = Seige_engine.new
    @seige2= Seige_engine.new
    @barracks = Barracks.new
    @footman = Footman.new
    @peasant= Peasant.new
  end
    it "should deal double AP (100) damage to a building unit" do
    expect(@barracks).to receive(:damage).with(100)
    @seige_engine.attack!(@barracks)
    end

    it "should attack other seige_engine 1x damage" do
    expect(@seige2).to receive(:damage).with(50)
    @seige_engine.attack!(@seige2)
    end

    it "cannot attack peasants" do
    expect(@peasant).to receive(:damage).with(0)
    @seige_engine.attack!(@peasant)
    end

    it "cannot attack footmen" do
    expect(@footman).to receive(:damage).with(0)
    @seige_engine.attack!(@footman)
    end
end
end