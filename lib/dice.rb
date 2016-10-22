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

