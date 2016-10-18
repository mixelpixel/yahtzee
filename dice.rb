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

# http://stackoverflow.com/questions/40099433/manipulating-ruby-class-default-values

