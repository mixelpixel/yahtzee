=begin
Roll a six sided dice
http://stackoverflow.com/questions/40099433/manipulating-ruby-class-default-values
base/sides model
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

  def initialize(size: 5)
    @size      = size
  end
  
  def first_roll
    # five_dice = Array.new(5) do |i|; i = Die.new.roll; end
    Array.new(@size) { Die.new.roll }
  end

end