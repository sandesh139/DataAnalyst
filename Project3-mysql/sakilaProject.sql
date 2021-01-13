
USE sakila;


/* list of all actors, including the films in which they have performed, broken down by category.*/
select  actor.first_name, actor.last_name, film.title,cat.name as category
from film_actor as fa
join film as film
on film.film_id = fa.film_id
join actor as actor
on actor.actor_id = fa.actor_id
join film_category as film_cat
on film_cat.film_id = fa.film_id
join category as cat
on cat.category_id = film_cat.category_id;




/*a list of films with a list of actors for each film.*/
select fa.film_id, film.title, GROUP_CONCAT( actor.first_name, ' ', actor.last_name ) as "actors"
from film_actor as fa
join film as film
on film.film_id = fa.film_id
join actor as actor
on actor.actor_id = fa.actor_id
group by fa.film_id;







/* a list of customers, with first name and last name concatenated together and address information combined into a single view*/
create view customer_address as
select concat(first_name, ' ', last_name) as name, address
from address as ad
join customer as cs
on cs.address_id = ad.address_id;


/*a list of all staff members, including address and store information.*/
select st.store_id, first_name, last_name, ad.address
from address as ad
join store as st
on ad.address_id = st.address_id
join staff as staff
on staff.store_id = st.store_id;


/* a list of total sales, broken down by individual film category. */
create view total_sales_by_film_category as
select sum(pay.amount) as total_sales, cat.name as category
from payment as pay
join rental as rental
on pay.rental_id = rental.rental_id
join inventory as inventory
on inventory.inventory_id = rental.inventory_id
join film_category as film_cat
on inventory.film_id = film_cat.film_id
join category as cat
on film_cat.category_id = cat.category_id
group by cat.name;


 /* a list of total sales, broken down by store.*/
 select store.store_id, sum(amount) From payment
 Join staff on staff.staff_id = payment.staff_id
 Join store on store.store_id = staff.store_id
 Group by store_id;
 
