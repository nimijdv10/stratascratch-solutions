-- First Approach

WITH cte1 AS (
    SELECT
        language,
        COUNT(DISTINCT pe.user_id) AS n_total_users
    FROM playbook_events AS pe INNER JOIN playbook_users AS pu
        ON pe.user_id = pu.user_id
    GROUP BY language
),

cte2 AS (
    SELECT
        language,
        COUNT(DISTINCT pu.user_id) AS n_apple_user
    FROM playbook_events AS pe INNER JOIN playbook_users AS pu
        ON pe.user_id = pu.user_id
    WHERE device = 'iphone 5s' OR device = 'macbook pro' OR device = 'ipad air'
    GROUP BY language
)

SELECT
    cte1.language,
    n_total_users,
    COALESCE(cte2.n_apple_user, 0) AS n_apple_user
FROM cte1 LEFT JOIN cte2
    ON cte1.language = cte2.language
ORDER BY n_total_users DESC;

-- Optimized Approach

SELECT
    language,
    COUNT(
        DISTINCT
        CASE
            WHEN pe.device IN ('macbook pro', 'iphone 5s', 'ipad air') THEN pe.user_id
        END
    ) AS n_apple_user,
    COUNT(DISTINCT pe.user_id) AS n_total_users
FROM playbook_events AS pe
INNER JOIN playbook_users AS pu ON pe.user_id = pu.user_id
GROUP BY pu.language
ORDER BY n_total_users DESC
