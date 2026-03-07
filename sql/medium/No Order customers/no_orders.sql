-- Using LEFT JOIN + IS NULL
with cte1 as (
    select *
    from orders
    where order_date between '2019-02-01' and '2019-03-01'
)

select first_name
from customers as c left join cte1 as o
    on c.id = o.cust_id
where o.cust_id is null;

-- Using NOT EXISTS operator

select first_name
from customers cust
where not exists (
    select 1
    from orders o
    where o.cust_id = cust.id
    and o.order_date between '2019-02-01' and '2019-03-01'
);
