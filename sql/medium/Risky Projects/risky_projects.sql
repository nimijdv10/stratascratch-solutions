with emp_salary as (
select 
    emp_id, 
    project_id,
    title,
    salary,
    budget,
    datediff(end_date,start_date) as duration
from linkedin_emp_projects ep
join linkedin_employees e
on ep.emp_id = e.id
join linkedin_projects p
on ep.project_id = p.id),
total_expense as(
select
    title,
    budget,
    ceiling(((sum(salary)/365)*duration)) as expense
from emp_salary
group by project_id)
select * 
from total_expense
where budget<expense;
