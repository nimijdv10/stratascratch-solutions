## Problem Summary

We need to identify the customers who didn't place any orders between 2019-02-01 and 2019-03-01. These include customers who placed any
orders outside the specified date and customers who didn't place any orders.

We are given the tables:
1) customers
   - address
   - city
   - first_name
   - id (PK)
   - last_name
   - phone_number
2) orders
   - cust_id (FK -> id:customers)
   - id (PK)
   - order_date
   - order_details
   - total_order_cost

## Analytical Approach

1) Using Anti-Join concept (LEFT JOIN + IS NULL)

- Create a temporary table that filters the order placed between Feb 1 and Mar 1, 2019.
- Use left join to show all the customers and attach the matching customers from the temporary table.
- Filter out the customers with no matching cust_id. These are the customers having no orders inside the provided date range.

2) Using NOT EXISTS operator

- NOT EXISTS operator is used with a correlated subquery.
- Write a subquery to find the orders placed between Feb 1 and Mar 1, 2019.
- In the main query, we want to output the customers so, we will use the customers table.
- Wrap the subquery in NOT EXISTS. If the result is true, discard the row and if the result is false, keep the row.
