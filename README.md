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
