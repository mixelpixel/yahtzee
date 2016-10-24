=begin
tests for a yahtzee game
=end

require "dice"
require "player"


RSpec.describe Die do

  context "Six sided" do
    it "should return a value from 1 to 6 when rolled" do
      10000.times do |i|
        default_value_test_roll = Die.new.roll
        expect(default_value_test_roll).to be_between(1, 6)
        # puts "Test roll = #{default_value_test_roll}"
      end
    end
  end
  
  context "Twenty sided die" do
    it "should return a value from 1 to 20 when rolled" do
      10000.times do |i|
        test20_roll = Die.new(sides:20).roll
        expect(test20_roll).to be_between(1, 20)
        # puts "Test20 roll = #{test20_roll}"
      end
    end
  end

  context "Twenty sided die starting from 10" do
    it "should return a value from 10 to 30 when rolled" do
      10000.times do |i|
        test1030_roll = Die.new(base:10, sides:20).roll
        expect(test1030_roll).to be_between(10, 30)
        # puts "Test20 roll = #{test1030_roll}"
      end
    end
  end

end

RSpec.describe Dice do

  context "The array containing the FIRST dice roll values" do
    it "should collect the values from rolling FIVE six-sided dice" do
      expect(Dice.new.roll_five_dice.count).equal?(5)
    end
  end

  context "each value in the array" do
    it "should be between ONE and SIX" do
      10000.times do |x|
        Dice.new.roll_five_dice.each do |i|
        expect(i).to be_between(1, 6)
        end
      end
    end
  end
  
end

RSpec.describe Player do

  context "Player chooses dice" do

    it "should roll five six-sided dice for the player" do
    end

    it "should send the values to the Player" do
    end
    
    it "should remove the dice the player selected" do
    end
    
  end
end