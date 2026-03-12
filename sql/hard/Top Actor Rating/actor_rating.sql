WITH frequent_genre AS (
    SELECT
        actor_name,
        genre,
        COUNT(actor_name) AS total_movies,
        AVG(movie_rating) AS avg_rating
    FROM top_actors_rating
    GROUP BY 1, 2
    ORDER BY actor_name ASC, total_movies DESC
),

tied_genre AS (
    SELECT
        actor_name,
        genre,
        total_movies,
        avg_rating,
        DENSE_RANK() OVER (PARTITION BY actor_name ORDER BY total_movies DESC, avg_rating DESC) AS rnk
    FROM frequent_genre
),

top_3_ranks AS (
    SELECT
        *,
        DENSE_RANK() OVER (ORDER BY avg_rating DESC) AS actor_rank
    FROM tied_genre
    WHERE rnk = 1
)

SELECT
    actor_name,
    genre,
    avg_rating,
    actor_rank
FROM top_3_ranks
WHERE actor_rank <= 3;
