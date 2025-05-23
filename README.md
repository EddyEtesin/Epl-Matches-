# English Premier League (EPL) Match Analysis - SQL Queries

## Overview
This repository contains SQL queries analyzing English Premier League match data, examining team performance, goal statistics, disciplinary records, and seasonal trends.

## Dataset Description
The dataset `epl_final` contains the following match information:

- **Match Identification**:
  - MatchDate
  - Season
  - HomeTeam
  - AwayTeam

- **Match Results**:
  - FullTimeResult (H=Home Win, D=Draw, A=Away Win)
  - FullTimeHomeGoals
  - FullTimeAwayGoals

- **Team Performance Metrics**:
  - HomeShotsOnTarget
  - AwayShotsOnTarget
  - HomeFouls
  - AwayFouls

- **Disciplinary Records**:
  - HomeYellowCards
  - AwayYellowCards
  - HomeRedCards
  - AwayRedCards

## SQL Queries
The repository includes 15 analytical queries that examine:

1. Basic match statistics
2. Team performance (goals, wins, shots)
3. Seasonal trends
4. Disciplinary analysis
5. Correlations between performance metrics

## Key Analysis Areas

### Basic Statistics
1. Total matches recorded (#1)
2. Unique home teams (#2)
3. Average home team goals (#3)

### Team Performance
4. Teams with most home wins (#4)
6. Teams with highest home goals (#6)
7. Teams conceding most away goals (#7)
10. Average shots on target (#10)
12. Matches with largest goal difference (#12)

### Result Analysis
5. Most common match results (#5)
8. Draws by season (#8)

### Disciplinary Analysis
9. Red cards by season (#9)
14. Yellow cards per team (#14)
15. Aggressive but less productive teams (#15)

### Seasonal Trends
11. Season with highest average goals (#11)

### Statistical Analysis
13. Correlation between shots on target and goals (#13)

## How to Use
1. Import the dataset into your MySQL database under schema `dbms2`
2. Run the SQL queries individually to reproduce the analysis
3. Modify queries as needed for your specific database environment

## Requirements
- MySQL or compatible database system
- Basic SQL knowledge to adapt queries if needed

## File Structure
- `Epl final.sql` - Contains all 15 analytical queries
- Dataset should be imported as `dbms2.epl_final`

## Example Insights
- Identify which teams perform best at home
- Analyze seasonal trends in goals and disciplinary actions
- Discover correlations between shots on target and actual goals scored
- Find teams that play aggressively (high fouls) but aren't productive (low goals)

Note: The dataset is included in this repository (please ensure it's properly imported before running the queries). The queries can be executed individually to analyze different aspects of EPL match data.
