import pandas as pd

grouped_data = google_gmail_emails.groupby('from_user')['id'].count().reset_index().rename(columns={'from_user':'user_id','id':'total_emails'}).sort_values(by=['total_emails','user_id'], ascending=[False,True])
grouped_data['activity_rank'] = grouped_data['total_emails'].rank(method='first', ascending=False)
grouped_data
