## Problem Summary

To determine projects which are overbudget by comparing the budget assigned to the project and the total prorated salaries of employees on that project. The salaries of the 
employee is calculated by the number of the days the employee has worked on it each project. Assume that all the years have 365 days. 

A project is overbudget if: total prorated employee salary > assigned project budget

We are given three tables:
1) linkedin_emp_projects
   - emp_id (FK -> id:linkedin_employees)
   - project_id (FK -> id:linkedin_projects)
2) linkedin_projects - contains information about the project
   - id (PK)
   - title
   - budget
   - start_date
   - end_date
3) linkedin_employees - contains information about the employees
   - id (PK)
   - first_name
   - last_name
   - salary

## Analytical Approach
1. Join the linkedin_emp_projects to linkedin_projects and linkedin_employees to associate the salaries, budget and calculate the duration of the project.
2. Calculate the salary of each employees based on the duration worked on the project: prorated salary = (salary/365)*duration
3. Aggregate the total prorated salary per project using SUM(prorated salary) and GROUP BY project_id.
4. Round the total expense to the nearest dollar using CEILING().
5. Filter the projects where total expense exceed the project budget.

Concepts used: CTE, Aggregate Functions, Joins

