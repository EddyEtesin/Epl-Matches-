SELECT * FROM dbms2.epl_final
limit 5;

##1. How many matches are recorded in the dataset?
SELECT count(*) as Number_of_Matches FROM dbms2.epl_final;

##2. List all unique teams that played at home.
select Distinct(HomeTeam) as HomeTeams FROM dbms2.epl_final
order by HomeTeams asc;

##3. What is the average number of goals scored by home teams?
select HomeTeam, avg(FullTimeHomeGoals) as HomeTeamGoals FROM dbms2.epl_final
group by HomeTeam
order by HomeTeam asc;

##4. Which team has the most home wins?
select HomeTeam, count(*) as Homewins FROM dbms2.epl_final
where FullTimeResult = 'H' 
group by HomeTeam
order by Homewins desc;

##5. What is the most common full-time results (`FullTimeResult`)?
select FullTimeResult, count(*) as Count FROM dbms2.epl_final
group by FullTimeResult
order by count desc
limit 1;

##6. Which team has the highest total goals scored at home?
select HomeTeam, sum(FullTimeHomeGoals) as Homegoalcount FROM dbms2.epl_final
group by HomeTeam
order by Homegoalcount desc;

##7. Which team has conceded the most goals away?
select AwayTeam, sum(FullTimeHomeGoals) as GoalsConceded  FROM dbms2.epl_final
group by AwayTeam
order by GoalsConceded desc
limit 1;

##8. How many matches ended in a draw each season?
Select Season, count(*) as DrawMatchcount FROM dbms2.epl_final
where FullTimeResult = 'D'
group by Season;

##9. What is the total number of red cards issued each season?
select season, sum(HomeRedCards + AwayRedCards) as RedCards FROM dbms2.epl_final
group by season;

##10. Find the average number of shots on target per team (home + away combined).
Select HomeTeam as Teams, avg(HomeshotsOnTarget + AwayShotsOnTarget) as ShotOnTarget FROM dbms2.epl_final 
group by HomeTeam
order by ShotOnTarget desc;

##11. Which season had the highest average number of goals per match?
select Season, Avg(FullTimeHomeGoals + FullTimeAwayGoals) as AvgGoalPerMatch FROM dbms2.epl_final 
group by Season 
order by AvgGoalPerMatch
limit 1;

##12. Which match had the largest goal difference?
select Matchdate, HomeTeam, AwayTeam, FullTimeHomeGoals, FullTimeAwayGoals, abs(FullTimeHomeGoals - FullTimeAwayGoals) as GoalDifference 
FROM dbms2.epl_final 
order by GoalDifference desc
limit 1;

##13. What is the correlation between shots on target and goals scored (home vs. away)?
Select 
round(( 
		count(*) * sum(HomeShotsOnTarget * FullTimeAwayGoals) - sum(HomeShotsOnTarget) * sum(FullTimeAwayGoals))/
        sqrt(
			(count(*) * sum(power(HomeShotsOnTarget,2)) - power(sum(HomeShotsOnTarget),2)) *
            (count(*) * sum(power(FullTimeAwayGoals,2)) - power(sum(FullTimeAwayGoals),2))
        ), 3 ) as Pearson_correlation 
from dbms2.epl_final;


##14. Which team had the highest average yellow cards per game?
Select HomeTeam, avg(HomeYellowCards + AwayYellowCards) as YellowCardPerGame FROM dbms2.epl_final
group by HomeTeam
order by YellowCardPerGame desc;

##15. Identify teams with more fouls but fewer goals, indicating aggressive but less productive play.
SELECT 
  Team, sum(GoalsScored) as TotalGoals, sum(FoulsCommitted) as TotalFouls
from (
  -- Home team contributions
  select 
    HomeTeam as Team,
    FullTimeHomeGoals as GoalsScored,
    HomeFouls as FoulsCommitted
  from dbms2.epl_final

  union all
  -- Away team contributions
select 
    AwayTeam as Team,
    FullTimeAwayGoals as GoalsScored,
    AwayFouls as FoulsCommitted
  from dbms2.epl_final
) as combined_stats
group by  Team
order by  TotalFouls desc, TotalGoals asc;


