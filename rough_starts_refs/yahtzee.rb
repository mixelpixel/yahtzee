=begin
solitaire yahtzee
Help along the way:
http://stackoverflow.com/questions/39283926/how-to-remove-only-a-single-instance-of-a-value-from-an-array-in-ruby/39283981#39283981
=end

roll_1 = Array.new(5) {rand(1..6)}
p roll_1

def ask message
  # prompting questions for a STRING response
  print message
  answer = gets.chomp
  return answer
end

def ask_num message
  # prompting questions for an INTEGER response
  print message
  answer = gets.to_i
  return answer
end

again = ask "would you like to keep any of these dice? ('y' or 'n'): "
p again
p again.class


# THIS IS A HOT MESS...
hold = []
while again == "y"
  keep = ask_num "Enter a number you'd like to keep: "
  p keep
  p keep.class

  if roll_1.include?(keep)
    roll_1.delete_at(roll_1.find_index(keep))
    hold.push(keep)
    puts "You are holding onto #{hold}."
    puts "You have #{roll_1} to choose from."
  elsif not roll_1.include?(keep)
    again = ask "That's not an option. #{roll_1} ...want to keep any of these? ('y' or 'n'): "
    p again, again.class
  else
    again = ask "Want to keep any of these dice? ('y' or 'n'): "
    p again, again.class
  end
end

