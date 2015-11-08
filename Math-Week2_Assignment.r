1. (a) What is the probability of rolling a pair of dice and obtaining a total score of 9 or more?
(b) What is the probability of rolling a pair of dice and obtaining a total score of 7?

#a
Sum of 9 or more requires dice rolls of:
6 3/4/5/6
5 4/5/6
4 5/6
3 6

#alternate 1
(1/6)*(1/6) + (1/6)*(2/6) + (1/6)*(3/6) + (1/6)*(4/6)
#sum=.2778

#alternate 2
(4+3+2+1)/36

#alternate 3
#create vector of 6 sides
dice <- c(1:6)
#create a sample of 2 dicerolls with a large sample size of rolls
diceroll <- sample(x = dice, size = 10000000, replace=TRUE) + sample(x = dice, size = 10000000, replace=TRUE)
#number of times the dice rolled greater than 8 ( = 9 or greater)
sum(diceroll > 8)/length(diceroll)


#b.
Sum of 7 requires dice rolls of:
6 1
5 2
4 3
3 4
2 5
1 6
P(x AND x) = (1/6)*(1/6)

#alternate 1
(1/6)*(1/6)*6

#alternate 2
#create vector of 6 sides
dice <- c(1:6)
#create a sample of 2 dicerolls with a large sample size of rolls
diceroll <- sample(x = dice, size = 10000000, replace=TRUE) + sample(x = dice, size = 10000000, replace=TRUE)
#number of times the dice rolled = 7
sum(diceroll == 7)/length(diceroll)




2. A box contains four black pieces of cloth, two striped pieces, and six dotted pieces.
A piece is selected randomly and then placed back in the box. A second piece is selected randomly.
What is the probability that:
a. both peices are dotted?
b. the first piece is black and the second piece is dotted?
c. one piece is black and one piece is striped?
#values
black <- 4
striped <- 2
dotted <- 6
sum <- black + striped + dotted

#a
(dotted/total)^2
(dotted/total)*(dotted/total)

#b
(black/total)*(dotted/total)

#c
(black/total)*(striped/total)




3. A card is drawn at random from a deck. (a) What is the probability that it is an ace or king?
(b) What is the probability that it is either a red card or a black card?

#a
(4*2)/52

#b
52/52




4. The probability that you will win a game is 0.45. (a) If you play the game 80 times, what is the most likely number of wins?
(b) What are the mean and variance of a binomial distribution with p = 0.45 and N = 80?
win <- 0.45
lose <- 1-win
ngames = 80

#a
win*ngames

#b
games <- dbinom(0:ngames, size = ngames, p = win)
#mean
mean(games)
#variance
win * lose


5. A fair coin is flipped 9 times. What is the probability of getting exactly 6 heads?
#alterate 1
factorial(9)/(factorial(9-6)*factorial(6))*((1/2)^9)

#alternate 2
(1/2)^9 * choose(9,6)

#alternate 3
dbimon(6, size = 9, p = .5)




6. When Susan and Jessica play a card game, Susan wins 60% of the time.
If they play 9 games, what is the probability that Jessica will have won more games than Susan?

pbinom(4, size = 9, p = .4)




7. You flip a coin three times. (a) What is the probability of getting heads on only one of your flips?
(b) What is the probability of getting heads on at least one flip?

#a
choose(3,1)/(2^3)

#b
1 - (1/2)^3




8. A test correctly identifies a disease in 95% of people who have it.
It correctly identifies no disease in 94% of people who do not have it.
In the population, 3% of the population have the disease.
What is the probabilty that you have the disease if you tested positive?
#3% have it, with probabilty of accruacy of 95%
.03 * .95




9. A jar contains 10 blue marbles, 5 red marbles, 4 green marbles, and 1 yellow marble.
Two marbles are chosen (without replacement). (a) What is the probability that one will be green and the other red?
(b) What is the probabilty that one will be blue and the other yellow?

blue <- 10
red <- 5
green <- 4
yellow <- 1
sum <- blue + red + green + yellow

#a
(green/sum)*(red/(sum-1))

#b
(blue/sum)*(yellow/(sum-1))




10. You roll a fair die five times, and you get a 6 each time.
What is the probability that you get a 6 on the next roll?

1/6




11. You win a game if you roll a die and get a 2 or a 5. You play this game 60 times.
(a) What is the probability that you win between 5 and 10 times (inclusive)?
(b) What is the probability that you win the game at least 15 times?
(c) What is the probabilty that you will win the game at least 40 times?
(d) What is the most likely number of wins?
(e) What is the probabilty of obtaining the number of wins in d?

winrate <- 2/6

#a
x <- 10
y <- 4
tenwins <- pbinom(x, size = 60, p = winrate)
fourwins <- pbinom(y, size = 60, p = winrate)
tenwins - fourwins

#b
z <- 14
fourteenwins <- pbinom(z, size = 60, p = winrate)
1 - fourteenwins

#c
w <- 14
thirtyninewins <- pbinom(w, size = 60, p = winrate)
1 - thirtyninewins

#d
60 * (2/6)

#e
dbinom(20, size = 60, p = winrate)




12. In a baseball game, Tommy gets a hit 30% of the time when facing this pitcher.
Joey gets a hit 25% of the time. They are both coming pu to bat this inning.
(a) What is the probability that Joey or Tommy will get a hit?
(b) What is the probabilty that neither player gets a hit?
(c) What is the probability that they both get a hit?

#a
P(T OR J)=P(T)+P(J)-P(TJ)
.3+.25-(.25*.3)

#b
1-a
1 - (.3 + .25 - (.25 * .3))
#OR
(1 - .3) * (1 - .25)

#c
.3 * .25




13. An unfair coin has a probaility of coming up heads 0.65.
The coin is flipped 50 times. What is the probabilty that it will come up heads 25 times or fewer?

heads <- .65
pbinom(25, size = 50, p = heads)



14. You draw two cards from a deck, what is the probability that:
(a) Both of them are face cards (king, queen, or jack)?
(b) You draw two cards from a deck and both of them are hearts?

#a
(4*3)/52 * (4*3-1)/51

#b
(13/52) * (12/51)



15. True/False: You are more likely to get a pattern of HTHHHTHTTH than HHHHHHHHTT when you flip a coin 10 times?
False, both equally likely, though long-term distribution is still expected to be 50% heads