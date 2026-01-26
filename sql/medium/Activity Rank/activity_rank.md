## Problem Summary

To calculate the activity rank by the total number of emails sent by the users. The user having the highest emails sent are ranked 1 and so 
on. The task requires to output the results in ordering by the total emails sent in descending order and then by the alphabetical order of
 user name. Each user should be assigned an unique rank even though they have the same number of sent total email.

 We are given the below table:

 1. google_gmail_emails
    - id
    - from_user
    - to_user
    - day

## Analytical Approach

1. To count the total emails sent by each user, we will use the count() function and aggregate the emails per user.
2. Then rank the users using window function row_number() which will assign a unique integer and we will use order by inside over()
   to define how the numbers are assigned.
3. First we will sort by total emails sent in descending order followed by the alphabetical order
   of user name.

Concepts used: Aggregate functions, window functions, sorting, group by
