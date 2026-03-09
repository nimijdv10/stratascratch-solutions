## Problem Summary

To analyze the popularity of apple devices across different language. To do this, count the number of disticnt users uisng Apple devices - 
macbook pro, iphone 5s and ipad air and compare it with the total number of users per language. 
The output should print the language, total number of Apple users and total users for each language.

The below tables are given:
1) playbook_events
   - device
   - event_name
   - event_type
   - location
   - occured_at
   - user_id (PK)
2) playbook_users
   - activated_at
   - compnay_id
   - created_at
   - language
   - state
   - user_id (FK -> user_id:playbook_events)

## Analytical Approach

First Approach :

- Create the first CTE to calculate the total number of users for each language. (Join + Aggregation)
- Create second CTE to calculate the total number of Apple users per language. (Join + Aggregation)
- In the main query, join both the tables to find desired output. Use COALESCE() function to handle the null values.

Optimizng the approach:

- Join the tables playbook_events and playbook_users and group by languages column.
- In the select statement, use **conditional aggregation**.

This approach is much faster and simpler than the previous approach, as the first approach uses two separate aggregations and then joins them,
it uses more CPU and memory.
