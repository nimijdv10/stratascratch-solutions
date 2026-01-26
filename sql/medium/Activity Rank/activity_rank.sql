select from_user as user_id, 
count(id) as total_emails,
row_number() over(order by count(id) desc, from_user) as activity_rank
from google_gmail_emails
group by from_user;
