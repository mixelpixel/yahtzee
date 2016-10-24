require_relative "dice"

class Player

  def initialize(player_dice:[])
    @player_dice = player_dice
  end

  def first_roll
    Dice.new.roll_five_dice.each do |i|
    @player_dice << i
    end
  end

  def dice_keep
  end
  
  def second_roll
  end

  def dice_release
  end

  def third_roll
  end
  
  def score
  end

end