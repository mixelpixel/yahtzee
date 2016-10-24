=begin
Dice for a yahtzee game.
The default values roll a six sided die five times.
http://stackoverflow.com/questions/40099433/manipulating-ruby-class-default-values
Die uses a base/sides model instead of max/min.
=end


class Die

  def initialize(base: 1, sides: 6)
    @base      = base
    @sides     = sides
  end

  def roll
    rand(@base..(@base + (@sides - 1)))
  end
end


class Dice < Die

  def initialize(num_of_die: 5)
    @num_of_die = num_of_die
  end
  
  def roll_five_dice
    # five_dice = Array.new(@num_of_die) do |i|; i = Die.new.roll; end
    Array.new(@num_of_die) { Die.new.roll }
  end

end

