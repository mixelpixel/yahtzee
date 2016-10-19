=begin
Roll a six sided dice
=end

class Die

  def initialize(min=1, max=6)
    @min       = min
    @max       = max
  end

  def roll
    rand(@min..@max)
  end

end

x = Die.new
p x

y = x.roll
puts y

puts x.roll
puts x.roll
puts x.roll
puts x.roll

f = Array.new(5) do |i|; i = rand(1..6); end
p f

g = Array.new(5) do |i|; i = Die.new.roll; end
p g

d = Die.new
h = Array.new(5) do |i|; i = d.roll; end
p h

p Die.new(min=1, max=20).roll

p Die.new(max=20)
p Die.new(max=20).roll

puts

class Die2

  def initialize(max=6, min=1)
    @max       = max
    @min       = min
  end

  def roll
    rand(@min..@max)
  end

end

p Die2.new(20)
p Die2.new(20).roll
puts

# http://stackoverflow.com/questions/40099433/manipulating-ruby-class-default-values
# base/sides model

class Die3

  def initialize(base: 1, sides: 6)
    @base      = base
    @sides     = sides
  end

  def roll
    rand(@base..(@base + (@sides - 1)))
  end
end

p Die3.new.roll
p Die3.new(sides: 20).roll

# puts

# class Die4

  # def initialize(base: 1, sides: 6)
    # @base      = base
    # @sides     = sides
  # end

  # def roll
    # @base + rand(@sides)     # NOTE THAT rand(n) starts at 0 and EXCLUDES n per https://ruby-doc.org/core-2.2.0/Random.html
  # end
# end

# p Die4.new.roll
# p Die4.new(sides: 20).roll

# puts
# class Die5 # NOTE THAT THIS MAKES THE RANGE TOO LONG BY ONE

  # def initialize(base: 1, sides: 6)
    # @base      = base
    # @sides     = sides
  # end
  
  # def roll
    # rand(@base..@base+@sides)
  # end
# end

# p Die5.new.roll
# p Die5.new(base: 10, sides: 6).roll


# puts
# class Die6

  # def initialize(base: 1, sides: 6)
    # @base      = base
    # @sides     = sides
  # end
  
  # def roll
    # rand(@base...@base+@sides)       # NOTE HOW THE EXCLUSIVE triple ... WORKS
  # end
# end

# p Die6.new.roll
# p Die6.new(base: 10, sides: 6).roll
# puts
# p Die6.new(:base=>20, :sides=>50).roll         # alternate syntax
# p Die6.new(:sides=>50, :base=>20).roll         # trivial note, order is unimportant


puts
class Die7

  def initialize(sides: [*1..6])
    @sides     = sides
  end

  def roll
    @sides.sample
  end
end

p Die7.new.roll
p Die7.new(sides: [*1..20]).roll


puts
class Die8

  def initialize(*sides)
    @sides     = sides
  end

  def roll
    @sides.sample
  end
end

d6 = Die8.new(1, 2, 3, 4, 5, 6)
p d6.roll
p Die8.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20).roll

puts
class Die9

  def initialize(*sides)
    @sides     = sides
  end

  def roll
    @sides.sample
  end
end

die6 = Die9.new(*1..6)
p die6.roll
p Die9.new(*1..20).roll


puts
class SuperDie
  def initialize(*sides)
    @sides     = sides
  end
  
  def roll
    @sides.sample
  end
end


class SixSidedDie < SuperDie
  def initialize
    super(*1..6)
  end
end

d6 = SixSidedDie.new
p d6.roll

class TwentySidedDie < SuperDie
  def initialize
    super(*1..20)
  end
end

d20 = TwentySidedDie.new
p d20.roll


puts
class SuperDie1

  attr_accessor :sides                 # allows for sides to be written without the @
  
  def initialize(*sides)
    @sides     = sides                 # once it is set here
  end
  
  def roll
    # @ sides.sample
    sides.sample                       # I no longer need the @
  end
end


class SixSidedDie1 < SuperDie1
  def initialize
    super(*1..6)
  end
end

d6 = SixSidedDie1.new
p d6.roll

class TwentySidedDie1 < SuperDie1
  def initialize
    super(*1..20)
  end
end

d20 = TwentySidedDie1.new
p d20.roll

of note: 

# attr_accessor :sides creates two helper methods, something like
# def sides
  # @sides
# end

# def sides=(value)
  # @sides = value
# end

