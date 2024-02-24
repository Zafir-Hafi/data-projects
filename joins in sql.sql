SELECT * FROM sakila.customer;
/*
-- studying joins
-- inner join
select customer.customer_id,sum(payment.amount) from customer
inner join payment
on customer.customer_id = payment.customer_id
group by customer.customer_id;
-- right join
select customer.customer_id,payment.amount from customer
right join payment
on customer.customer_id = payment.customer_id;
-- left join
select customer.customer_id,payment.amount from customer
left join payment
on customer.customer_id = payment.customer_id;
-- cross join
select * from customer cross join payment;
select customer.customer_id,payment.amount  from customer cross join payment
on customer.customer_id = payment.customer_id;
*/

/*
SELECT * FROM sakila.customer;
select  last_update,customer_id from customer
union all
select  last_update,customer_id from payment;

-- will not show corret output 
select  last_update,customer_id from customer
intersect
select  last_update,customer_id from payment;

select  last_update,customer_id from customer
where customer_id in (select customer_id from payment);

-- using "except" here
-- except probably will not work and not show output
select  last_update,customer_id from customer
except
select  last_update,customer_id from payment;

select  last_update,customer_id from customer
where customer_id not in (select customer_id from payment);

-- using subquery 
select customer_id from  sakila.customer
where customer.customer_id in (select payment.customer_id from sakila.payment);

select customer_id from  sakila.customer
where customer.customer_id not in (select payment.customer_id from sakila.payment);
*/

-- views is not a table but a virtual. it can create another separate virtual
-- table in 'view folder in the database' it is kind of a simulation of a table in another setting
SELECT * FROM sakila.customer;

create view count_of_customers as
SELECT * FROM sakila.customer;
-- one other benefit is u can later do analysis on the particular saved data 
-- no need to do everything from scratch on a dataset
create view new_data_for_view as 
select first_name, last_name,count(address_id) from sakila.customer
group by customer_id; 


SELECT * FROM sakila.customer;

select first_name, last_name, email, sum(address_id) 
FROM sakila.customer
group by first_name, last_name, email;
select first_name, last_name, email, sum(address_id) 
over(partition by first_name order by customer_id) FROM sakila.customer;
select *, row_number()
over (partition by customer.customer_id) from sakila.customer;

select *, rank()
over (partition by customer.customer_id order by customer.address_id) from sakila.customer;
-- we can use window function and partition to compare values, rank values, allot row numbers 
select first_name, last_name, email, dense_rank()
over (partition by customer.customer_id order by customer.address_id) from sakila.customer;

