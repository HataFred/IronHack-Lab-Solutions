# lab 1 on SQL joints

SELECT c.category_id,c.name,count(f.film_id) as count FROM sakila.category as c
left join sakila.film_category as f on c.category_id=f.category_id
group by category_id;

SELECT c.category_id,c.name,count(f.film_id) as count FROM sakila.category as c
left join sakila.film_category as f on c.category_id=f.category_id
group by category_id;

select s.first_name, sum(p.amount)as MoneyMoney 
from sakila.staff as s 
left join sakila.payment as p 
on s.staff_id=p.staff_id 
group by s.first_name;

SELECT fa.film_id, f.title, count(fa.actor_id) as count 
FROM sakila.film_actor as fa 
left join sakila.film as f 
on fa.film_id=f.film_id 
group by f.title 
order by count desc;

SELECT c.first_name, c.last_name, sum(p.amount) as amount 
FROM sakila.customer as c 
left join sakila.payment as p 
on c.customer_id = p.customer_id 
group by c.customer_id 
order by c.last_name asc;

# lab 2 on SQL joints


