=begin
game logic
=end

require_relative "dice"
require_relative "player"

class Game

  def initialize(roll_dice: [], player_dice: [], score_dice: [])
    @roll_dice   = roll_dice
    @player_dice = player_dice
    @score_dice  = score_dice
  end

  def ask_str message
    print message
    answer_string = gets.chomp.downcase
    # answer_string
  end

  def ask_num message
    print message
    answer_integer = gets.to_i
    # answer_integer
  end

  def play?
    y_or_n = ask_str "Want to play a game of yahtzee? (y/n): "
    if y_or_n == "y"
      round_one_roll
    else goodbye
    end
  end

  def goodbye
    exit
  end

  def round_one_roll
    @roll_dice = Player.new.first_roll
  end


end

