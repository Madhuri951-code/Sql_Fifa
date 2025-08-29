# 1.How many players are there in the dataset?
Sql>select count(*) as total_players from fifa;

#2.How many nationalities do these players belong to?
select count(distinct Nationality) from fifa;

#3.What is the total wage given to all players?
#What's the average and standard deviation?
Select sum(wage) as total_wage,
avg(wage) as avg_wages, 
stddev(wage) as stddev_wages from fifa;

#4.Which nationality has the highest number of players,
#what are the top 3 nationalities by # of players
Select nationality, count(*) as player_count
from fifa group by nationality order by count(nationality) 
desc limit 3;

#5.Which player has the highest wage? Who has the lowest?
select name, wage from fifa where
wage=(select min(wage) from fifa) or wage=(select max(wage)
 from fifa);

#6.The Player having the best overall rating? Worst overall rating?
    #Worst rating:
Select * from fifa order by Overall asc limit 1;
  #best rating:
Select *from fifa order by Overall desc limit 1;

#7.Club having the highest total of overall rating?
# Highest Average of overall rating?
Select club, sum(overall) as total_rating,
avg(overall) as avg_rating from fifa
group by club order by avg(overall) desc limit 1;

#8.What are the top 5 clubs based on the average ratings
#of their players and their corresponding averages?
Select club, avg(overall) as average_rating from fifa 
group by club order by average_rating desc limit 5;

#9.What is the distribution of players whose preferred foot 
#is left vs right?
Select Preferred_Foot, count(*) as cnt from fifa
group by Prefened_Foot;

#10.Which jersey number is the luckiest?
#a)Jersey number with highest total player value
Select jersey_number, sum(value) as total_value from
fifa group by jersey_number order by total_value desc limit 1;

#b)Jersey number with highest average player rating
Select jersey_number, avg(overall) as avg_rating From fifa
 group by jersey_number order by avg_rating desc limit 1;

#c)Most common jersey number
Select jersey_number, count(*) as count from fifa
group by jersey_number order by count desc limit 1;

#11.What is the frequency distribution of nationalities 
#among players whose club name starts with M?
SELECT Nationality, club, COUNT(*) AS cnt FROM fifa
WHERE club LIKE 'm%'
GROUP BY club, Nationality ORDER BY COUNT(*) DESC;

#12.How many players have joined their respective clubs 
#in the date range 20 May 2018 to 10 April 2019 (both inclusive)? Sql select count(*) as player joined
Select count(*) as player_joined from fifa
where joined between '2018-05-20' and '2019-04-10'; 

#13.How many players have joined their respective clubs 
#date wise
select count(*) as player_cnt, club joined from fifa
group by joined, Clubs;

#14.How many players have joined their respective clubs yearly?
select count(*) as player_count,club, 
year(joined) from fifa_data group by club, year(joined);





