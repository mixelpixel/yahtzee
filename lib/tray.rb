=begin
collect the value of rolling five six-sided dice
Note: Die class defaults to a six sided die
=end

require "dice"

class Tray
  # five_dice = Array.new(5) do |i|; i = Die.new.roll; end
  five_dice = Array.new(5) { Die.new.roll }
end

