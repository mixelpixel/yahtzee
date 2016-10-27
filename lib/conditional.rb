=begin
a conditional rendering of a basic yahtzee solitaire game
TO BE REFACTORED
per http://designisrefactoring.com/2015/03/09/refactoring-away-a-conditional/
=end

require_relative "dice"
require_relative "player"

$rolls = 3
$table_dice = []
$player_dice = []

# def ask_str message
  # print message
  # answer_string = gets.chomp.downcase
# end


puts "Want to play a game of yahtzee? (y/n): "
y_or_n = gets.chomp.downcase
if y_or_n == "y"
  $rolls -= 1
  $table_dice = Player.new.first_roll
else exit
end


puts "You rolled #{$table_dice}"
puts "Remaining rolls: #{$rolls}"

def keep_or_roll
  keepers = []
  puts "Want to (k)eep some dice, or (r)oll again? (k/r): "
  k_or_r = gets.chomp.downcase
  if k_or_r == "k"
    puts "Which dice to keep from #{$table_dice}? e.g. enter '3' or '3, 1, 6': "
    keepers = gets.chomp.split(',').map { |x| x.to_i }
  else
    $rolls -= 1
    $table_dice = Player.new.first_roll # WRONG NAME...
  end

  to_be_removed = []
  for k in keepers
    if $table_dice.include?(k)
      $player_dice << k
      to_be_removed << k
    end
  end
  
  # $table_dice -= keepers  #PROBLEM - removes all instances of each value
  # see: http://stackoverflow.com/questions/39283926/how-to-remove-only-a-single-instance-of-a-value-from-an-array-in-ruby
  # and: http://stackoverflow.com/questions/4595305/delete-first-instance-of-matching-element-from-array
  keepers.each do |k|
    j = $table_dice.index(k)
    $table_dice.delete_at j unless j.nil?
  end
  
  # puts "keepers: #{keepers}"
  puts "player keeping these dice: #{$player_dice}"
  # puts "to be removed from table_dice #{to_be_removed}"
  
  # puts "Keeping these dice: #{$player_dice}"

end

keep_or_roll


if $table_dice.count == 0
  puts "No dice are left."
else
  puts "Dice on the table #{$table_dice}"
end

puts "Remaining rolls: #{$rolls}"

if $table_dice.count == 0
  puts "want to add these dice #{$player_dice} to your score card? (y/n)"
elsif $table_dice.count == 1
  puts "want to roll this die #{$table_dice} again? (y/n)"
  roll_again = gets.chomp.downcase
  if roll_again == "y"
    $rolls -=1
    $table_dice = Array.new($table_dice.count) { rand(1..6) }
    puts "Dice on the table: #{$table_dice}"
    puts "Player dice: #{$player_dice}"
  else
    puts "Want to add your dice to score card?"
  end
elsif $table_dice.count > 1
  puts "Want to roll these dice #{$table_dice} again? (y/n)"
  roll_again = gets.chomp.downcase
  if roll_again == "y"
    $rolls -=1
    $table_dice = Array.new($table_dice.count) { rand(1..6) }
    puts "Dice on the table: #{$table_dice}"
    puts "Player dice: #{$player_dice}"
  else
    puts "Want to add your dice to score card?"
  end
end

