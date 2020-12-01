# Question 1
SELECT distinct(r.customer_id),first_name,last_name,email 
FROM sakila.rental as r 
join sakila.customer as c 
on (r.customer_id=c.customer_id);

# Question 2
select c.customer_id, concat(first_name,' ',last_name), avg(amount)
from sakila.customer as c
join sakila.payment as p 
on (p.customer_id=c.customer_id)
group by c.customer_id;

# Question 3
SELECT distinct(r.customer_id), first_name, last_name, email, ct.name
FROM sakila.rental as r 
join sakila.customer as c on (r.customer_id=c.customer_id)
join sakila.inventory as i on (r.inventory_id=i.inventory_id)
join sakila.film_category as fc on (i.film_id=fc.film_id)
join sakila.category as ct on (fc.category_id=ct.category_id)
where ct.name='Action';

SELECT distinct(customer_id), first_name, last_name, email from customer where customer_id in
(select customer_id from rental where inventory_id in
(select inventory_id from inventory where film_id in
(select film_id from film_category where category_id =
(select category_id from category where name = 'Action'))));

#Question 4
CREATE VIEW transactions_value
AS
SELECT *,
       CASE 
        WHEN amount between 0 and 2 THEN 'low'
        WHEN amount between 2 and 4 THEN 'medium'
        WHEN amount > 4 THEN 'high'
        ELSE 'Invalid'
       END
FROM payment;