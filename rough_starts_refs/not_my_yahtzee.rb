=begin
http://codereview.stackexchange.com/questions/28063/yahtzee-program
=end

require 'yaml'
require 'text-table'

class Yahtzee
  def initialize
    puts "Welcome to Yahtzee, please enter your name."
    @name = gets.chomp
    @turn = 0
    @scorecard = {"aces" => 0, "twos" => 0, "threes" => 0, "fours" => 0, "fives" => 0, "sixes" => 0, "3 of a kind" => 0, "4 of a kind" => 0, "full house" => 0, "sm. straight" => 0, "lg. straight" => 0, "chance" => 0, "yahtzee" => 0}
end

def roll
@roll_count = 1
    @roll = Array.new(5) {rand(6) + 1}
    p @roll
    puts "That was your first roll, you are allowed 2 more rolls."
    more_rolls?
end

def more_rolls?
    puts "Would you like to roll again? (y or n)"
    roll_again_choice = gets.chomp.downcase
    if roll_again_choice == "y"
        roll_again
    elsif roll_again_choice == "n"
        section(@roll)
    else
      more_rolls?
    end
end
#Refactor for error on input of anything besides 1-5 and commas
def roll_again
    puts "Which dice would you like to keep from this roll? (1, 2, 3, 4, 5)"
    dice_to_keep = gets.chomp.split(',').map {|x| (x.to_i) - 1}.map {|x| @roll[x]}
    new_roll = Array.new(5 - dice_to_keep.size) {rand(6) + 1}
    @roll = new_roll + dice_to_keep
    p @roll
    @roll_count += 1
    puts "That was roll number #{@roll_count}, you have #{3-@roll_count} remaining."
    if @roll_count < 3
        more_rolls?
    else
        section(@roll)
    end
end

def section(roll)
    view_scorecard
    puts "\nYou rolled a #{roll}. What section would you like to score?"
    section_choice = gets.chomp.downcase
    section_to_score(section_choice)
end

def section_to_score(section_choice)
    if @scorecard[section_choice] == 0
        case section_choice
            when "aces" then ones
            when "twos" then twos
            when "threes" then threes
            when "fours" then fours
            when "fives" then fives
            when "sixes" then sixes
            when "3 of a kind" then three_of_a_kind
            when "4 of a kind" then four_of_a_kind
            when "full house" then full_house
            when "sm. straight" then sm_straight
            when "lg. straight" then lg_straight
            when "yahtzee" then yahtzee
            when "chance" then @scorecard["chance"] = @roll.inject(:+)
            else
                puts "Please choose a section to score."
                section_choice = gets.chomp.downcase
                section_to_score[section_choice]
        end
    elsif @scorecard["yahtzee"] == 50
        yahtzee_plus
    else
        puts "You already scored that section, please choose another section."
        section_choice = gets.chomp
        @turn -= 1
        section_to_score(section_choice)
    end

    @turn += 1
    if @turn == 13
        @scorecard = @scorecard.each_key {|k| @scorecard[k] == "scratch" ? @scorecard[k] = 0 : @scorecard[k]}
        view_scorecard
        @top_total = @scorecard.values_at("aces", "twos", "threes", "fours", "fives", "sixes").inject(:+)
        @lower_total = @scorecard.values_at("3 of a kind", "4 of a kind", "full house", "sm. straight", "lg. straight", "chance", "yahtzee").inject(:+)
        bonus
        @grand_total = @top_total + @lower_total
        view_scorecard
        highscore
    else
        puts "\nYou have #{13 - @turn} turns left. Roll again."
        view_scorecard
    end
end

def ones
    if @roll.include?(1)
        @scorecard["aces"] = @roll.select {|x| x == 1}.inject(:+)
    else
        @scorecard["aces"] = "scratch"
    end
end

def twos
    if @roll.include?(2)
        @scorecard["twos"] = @roll.select {|x| x == 2}.inject(:+)
    else
        @scorecard["twos"] = "scratch"
    end
end

def threes
    if @roll.include?(3)
        @scorecard["threes"] = @roll.select {|x| x == 3}.inject(:+)
    else
        @scorecard["threes"] = "scratch"
    end
end

def fours
    if @roll.include?(4)
        @scorecard["fours"] = @roll.select {|x| x == 4}.inject(:+)
    else
        @scorecard["fours"] = "scratch"
    end
end

def fives
    if @roll.include?(5)
        @scorecard["fives"] = @roll.select {|x| x == 5}.inject(:+)
    else
        @scorecard["fives"] = "scratch"
    end
end

def sixes
    if @roll.include?(6)
        @scorecard["sixes"] = @roll.select {|x| x == 6}.inject(:+)
    else
        @scorecard["sixes"] = "scratch"
    end
end

def three_of_a_kind
    if @roll.map {|x| @roll.count(x)}.any? {|y| y >= 3}
        @scorecard["3 of a kind"] = @roll.inject(:+)
    else
        puts "Your roll is not a 3 of a kind! Please select another section or type 'scratch' to score 0 for this section."
        scratch = gets.chomp
        if scratch == "scratch"
            @scorecard["3 of a kind"] = "scratch"
        elsif @scorecard.has_key?(scratch)
            @turn -= 1
            section_to_score(scratch)
        else
            three_of_a_kind
        end
    end
end

def four_of_a_kind
    if @roll.map {|x| @roll.count(x)}.any? {|y| y >= 4}
        @scorecard["4 of a kind"] = @roll.inject(:+)
    else
        puts "Your roll is not a 4 of a kind! Please select another section or type scratch to score 0 for this section."
        scratch = gets.chomp
        if scratch == "scratch"
            @scorecard["4 of a kind"] = "scratch"
        elsif @scorecard.has_key?(scratch)
            @turn -= 1
            section_to_score(scratch)
        else
            four_of_a_kind
        end
    end
end

def full_house
    if @roll.map {|x| @roll.count(x)}.any? {|y| y == 2} && @roll.map {|z| @roll.count(z)}.any? {|i| i == 3}
        @scorecard["full house"] = 25
    else
        puts "Your roll is not a Full House! Please select another section or type scratch to score 0 for this section."
        scratch = gets.chomp
        if scratch == "scratch"
            @scorecard["full house"] = "scratch"
        elsif @scorecard.has_key?(scratch)
            @turn -= 1
            section_to_score(scratch)
        else
            full_house
        end
    end
end

def has_straight?(need)
num = 1
@roll = @roll.sort.uniq

@roll.each_with_index do |e, i|
    if i < @roll.length-1 then
    if (@roll[i+1] - @roll[i]) > 1 then
        break if num >= need
        num = 1
    end

    num += 1
    end
end

num >= need
end

def sm_straight
    if has_straight?(4)
        @scorecard["sm. straight"] = 30
    else
        puts "Your roll is not a sm. straight! Please select another section or type scratch to score 0 for this section."
        scratch = gets.chomp
        if scratch == "scratch"
            @scorecard["sm. straight"] = "scratch"
        elsif @scorecard.has_key?(scratch)
            @turn -= 1
            section_to_score(scratch)
        else
            sm_straight
        end
    end
end

def lg_straight
    if has_straight?(5)
        @scorecard["lg. straight"] = 40
    else
        puts "Your roll is not a lg. straight! Please select another section or type scratch to score 0 for this section."
        scratch = gets.chomp
        if scratch == "scratch"
            @scorecard["lg. straight"] = "scratch"
        elsif @scorecard.has_key?(scratch)
            @turn -= 1
            section_to_score(scratch)
        else
            lg_straight
        end
    end
end

def yahtzee
    if @roll.uniq.size == 1
        @scorecard["yahtzee"] = 50
    else
        puts "Your roll is not a Yahtzee! Please select another section or type scratch to score 0 for this section."
        scratch = gets.chomp
        if scratch == "scratch"
            @scorecard["yahtzee"] = "scratch"
        elsif @scorecard.has_key?(scratch)
            @turn -= 1
            section_to_score(scratch)
        else
            yahtzee
        end
    end
end

def yahtzee_plus
    if @roll.uniq.size == 1
        puts "You scored another Yahtzee! Please choose what section you want to score your 100 points!"
        yahtzee_placement = gets.chomp
        @scorecard[yahtzee_placement] = 100
    else
        "Your roll is not a Yahtzee! Please select another section."
        section_choice = gets.chomp
        @turn -= 1
        section_to_score(section_choice)
    end
end

def view_scorecard
    table = Text::Table.new :rows => [["YAHTZEE",{:value => "Scorecard", :align => :center},"NAME:#{@name}"],:separator,
    ['Upper Section', 'How to Score', 'Score'],
    :separator,
    ['Aces', 'Count & Add Only Aces', {:value => "#{@scorecard["aces"]}", :align => :right}], 
    ['Twos', 'Count & Add Only Twos', {:value => "#{@scorecard["twos"]}", :align => :right}],
    ['Threes', 'Count & Add Only Threes', {:value => "#{@scorecard["threes"]}", :align => :right}], 
    ['Fours', 'Count & Add Only Fours', {:value => "#{@scorecard["fours"]}", :align => :right}], 
    ['Fives', 'Count & Add Only Fives', {:value => "#{@scorecard["fives"]}", :align => :right}], 
    ['Sixes', 'Count & Add Only Sixes', {:value => "#{@scorecard["sixes"]}", :align => :right}],
    :separator,
    ['Bonus', 'Score 35', {:value => "#{@bonus}", :align => :right}], 
    :separator,
    ['Upper Total', '--------------------->', {:value => "#{@top_total}", :align => :right}], 
    :separator,
    ['Lower Section', 'How to Score', 'Score'], 
    :separator,
    ['3 of a Kind', 'Add Total of All Dice', {:value => "#{@scorecard["3 of a kind"]}", :align => :right}],
    ['4 of a Kind', 'Add Total of All Dice', {:value => "#{@scorecard["4 of a kind"]}", :align => :right}],
    ['Full House', 'Score 25', {:value => "#{@scorecard["full house"]}", :align => :right}],
    ['Sm. Straight', 'Score 30', {:value => "#{@scorecard["sm. straight"]}", :align => :right}],
    ['Lg. Straight', 'Score 40', {:value => "#{@scorecard["lg. straight"]}", :align => :right}],
    ['Yahtzee', 'Score 50', {:value => "#{@scorecard["yahtzee"]}", :align => :right}],
    ['Chance', 'Add Total of All Dice', {:value => "#{@scorecard["chance"]}", :align => :right}],
    :separator,
    ['Lower Total', '--------------------->', {:value => "#{@lower_total}", :align => :right}],
    :separator,
    ['Upper Total', '--------------------->', {:value => "#{@top_total}", :align => :right}],
    :separator,
    ['Grand Total', '--------------------->', {:value => "#{@grand_total}", :align => :right}]]

    puts table
end

def bonus
    if @top_total >= 63
        @top_total += 35
        @bonus = 35
        p "You received a 35 point bonus for having at least 63 points in the top section!"  
    else
        @top_total
        @bonus = 0
    end
end

def highscore
if File.exists?('highscore.txt')
    hs = YAML.load_file("highscore.txt")
else
    hs = {
        1 =>  { player: '', score: 0, date: '' },
        2 =>  { player: '', score: 0, date: '' },
        3 =>  { player: '', score: 0, date: '' },
        4 =>  { player: '', score: 0, date: '' },
        5 =>  { player: '', score: 0, date: '' },
        6 =>  { player: '', score: 0, date: '' },
        7 =>  { player: '', score: 0, date: '' },
        8 =>  { player: '', score: 0, date: '' },
        9 =>  { player: '', score: 0, date: '' },
        10 => { player: '', score: 0, date: '' },
        }
end

(1..10).each do |rank|
  t = Time.now
  if @grand_total > hs[rank][:score]
    hs[rank][:score] = @grand_total
    hs[rank][:date] = "#{t.month}/#{t.day}/#{t.year}"
    hs[rank][:player] = @name
    puts "Congratulations you set a new HIGH SCORE!"
    break
  end
end

puts "Thanks for playing!"

File.write('highscore.txt', hs.to_yaml)
hs_table = YAML.load_file('highscore.txt')

hs_table_rank = ["1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th"]

hs_table_players = (1..10).map do |rank|
hs_table[rank][:player]
end

hs_table_scores = (1..10).map do |rank|
hs_table[rank][:score]
end

hs_table_dates = (1..10).map do |rank|
hs_table[rank][:date]
end

hs_table = hs_table_rank, hs_table_players, hs_table_scores, hs_table_dates
hs_table = hs_table.transpose

hs_table.unshift(["RANK", "PLAYER", "SCORE", "DATE"])
puts hs_table.to_table(:first_row_is_head => true)
end

end

