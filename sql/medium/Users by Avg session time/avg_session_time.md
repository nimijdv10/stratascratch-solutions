## Problem Summary

To calculate the average session time per user. Assuming that each user has one session in a day, the session is calculated by 
the difference between the latest page_load and earliest page_exit of the day. A session is valid when the page_load occurs before
the page_exit.

We are given the below table:

1. facebook_web_log
  - user_id
  - timestamp
  - action (where a action can be page_load, scroll_down, scroll_up, page_exit)

## Analytical Approach

1. Create a CTE named 'page_load' to find the latest page_load per user for a day. Use MAX() function to find the latest timestamp and GROUP BY user_id and day.
2. Create another CTE named 'page_exit' to find the earliest page_exit per user for a day. Use MIN() function to find the earliest timestamp and GROUP BY user_id and day.
3. Join the temporaray tables using the user_id and day and filtering the data in WHERE clause by page_load<exit_time.
4. In the SELECT clause use the TIMESTAMPDIFF(second, page_load, page_exit) to caluclate the time difference in seconds and then use AVG() to find the average session time.

Concepts Used: CTE, Aggregate Functions, GROUP BY, Inner Join
