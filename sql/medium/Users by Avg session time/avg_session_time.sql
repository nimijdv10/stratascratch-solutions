with page_load as (SELECT
    user_id,
    DATE(timestamp) AS day,
    MAX(timestamp) AS load_time
  FROM facebook_web_log
  WHERE action = 'page_load'
  GROUP BY user_id, DATE(timestamp)),
page_exit as(SELECT 
    user_id,
    DATE(timestamp) AS day,
    MIN(timestamp) AS exit_time
  FROM facebook_web_log
  WHERE action = 'page_exit'
  GROUP BY user_id, DATE(timestamp)
)
select 
    pl.user_id,
    avg(timestampdiff(second,load_time,exit_time)) as avg_session_duration
from page_load pl
inner join page_exit pe
on pl.user_id = pe.user_id and pl.day = pe.day
where load_time<exit_time
group by pl.user_id;
