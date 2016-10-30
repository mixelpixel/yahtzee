# yahtzee
  
This is my plan:

Start with a basic solitaire "good faith" version - mostly just a dice roller that holds dice and handles three rolls per turn. Something that could be used in place of actual dice and in conjunction with a pencil and paper.

Next, tracking and displaying the scorecard. Then, suggesting possible scores (e.g. if a set has 1, 1, 2, 3, 4 the logic should suggest either ones (if they have not already been chosen) or a short run). Not sure how to deal with "jokers" but I think it is worth pursuing. I am hoping that working out the logic to handle the possible cases will lead me towards ultimately designing a computer-player that makes reasonable choices.

References:  
https://en.wikipedia.org/wiki/Yahtzee  
https://en.wikipedia.org/wiki/Generala  
https://cardgames.io/yahtzee/ - note: playing this, the dice roles feel weighted towards not so random values
http://www.classicwebgames.com/board/yahtzee/

I'd like to also use Rspec for Test/Behavioral Driven Development  
http://rspec.info/
...and will be setting it up in a win7 environment.

per Hoyle's rules for Yacht:  
5 dice  
2 - 10 players  
12 rounds  
each player has 1 turn in each each round  
a turn consists of 3 rolls of the dice; at any time the player may stand or pickup and reroll any dice (for three rolls)  
at the end of each turn, the player designates a score from the dice.  
the scoree goes to one of 12 categories  
  
Yahtzee - 5 of a kind  
big straight - 5 in a row  
little straight - 4 in a row  
four of a kind  
(three of a kind?)  
Full House  - 2 of a kind and three of a kind  
Choice (Chance) - sum of all dice  
  
(The following all sum the particular dice)  
Sixes  
Fives  
Fours  
Threes  
Deuces (Twos)  
Aces (Ones)  
  
If the player has no qualifying dice, they must enter a zero in one of the categories.  
Each category can only be scored once per game.

high score wins!  
