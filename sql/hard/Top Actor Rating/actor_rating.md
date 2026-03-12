## Problem Summary

Find the top actors based on their average movie rating within the genre the appear in most frequently. But their were multiple conditions:
- For each actor, find the genre they appeared more frequently.
- If there is a tie in the genre count, chose the genre with the highest average rating.
- If there is still a tie, then include all the tied genres.
- Then, rank the resulting actors based on their average rating and print top 3. Do not skip the ranks.

Given table:
1. top_actors_rating
   - actor_name
   - genre
   - movie_rating
   - movie_title
   - production_company
   - release_date

## Analytcial Approach

1. Create first CTE to perform group aggregation to compute the performance metrics for total movies per genre and average rating.
   COUNT(*) -> total number of movies an actor appreared within each genre
   AVG(movie_rating) -> average rating of those movies
2. To identify the most frequent genre per actor, use DENSE_RANK() window function partitioned by actor_name and order by total_movies
   (to prioritize frequent movie genre) and avg_rating (acts as tie breaker when counts are equal). Rank=1 is assigned to each dominant actors.
3. Apply another DENSE_RANK() function across all the selected actor-genre pair and order by avg_rating to rank them based on the
   average rating based on the most frequent genre.
4. To filter the top 3 ranks, select rows where actor_rank <=3.

Concepts used: Aggregation, CTEs, Window Functions, Tie Handling, Multi-level sorting
