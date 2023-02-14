use mavenmovies;

-- select
--       replacement_cost,
--       count(film_id) as number_of_films,
--       min(rental_rate) as cheapest_rental,
--       max(rental_rate) as most_expensive_rental,
--       avg(rental_rate) as avg_rental
-- from film
-- group by
-- replacement_cost

 

-- use mavenmovies;
-- select
--      customer_id,
--      count(rental_id) as total_rentals
-- from rental
-- group by
-- 	customer_id
-- having count(rental_id)=25



-- select
--      customer_id,
--      count(rental_id) as total_rentals
-- from rental
-- group by
-- 	customer_id
-- having count(rental_id)<15


-- select
--      customer_id,
--      rental_id,
--      amount,
--      payment_date
-- from payment
-- order by amount, customer_id desc


-- select
--      customer_id,
--      sum(amount) as total_payment_amount
-- from payment
-- group by
--      customer_id
-- order by
--      sum(amount) desc



-- select
--      title,
--      length,
--      rental_rate
-- from film
-- order by length desc 



-- select distinct
--      length,
--      case 
--          when length < 60 then 'under 1 hr'
--          when length between 60 and 90 then '1-1.5 hrs'
--          when length > 90 then 'over 1.5 hrs'
-- 	     else 'uh oh...check logic!'
-- 	end as length_bucket
-- from film


-- select distinct
--      length,
--      case 
--          when length < 60 then 'under 1 hr'
--          when length < 90 then '1-1.5 hrs'
--          when length > 120 then 'over 2 hrs'
-- 	     else 'uh oh...check logic!'
-- 	end as length_bucket
-- from film



-- select distinct
--      title,
--      case
--          when rental_duration <= 4 then 'rental_too_short'
--          when rental_rate >= 3.99 then 'too_expensive'
--          when rating in ('nc-17','r') then 'too_adult'
--          when length not between 60 and 90 then 'too_short_or_too_long'
--          when description like '%shark%' then 'nope_has_sharks'
--          else 'great_reco_for_my_niece'
--          end as fit_for_recommendation,
-- 	case
--          when description like '%shark%' then 'nope_has_sharks'
--          when length not between 60 and 90 then 'too_short_or_too_long'
--          when rating in ('nc-17','r') then 'too_adult'
--          when rental_duration<=4 then 'rental_too_short'
--          when rental_rate>=3.99 then 'too_expensive'
--          else 'great_reco_for_my_niece'
--          end as reordered_reco
-- from film



-- select distinct
--        first_name,
--        last_name,
--        case
--            when store_id=1 and active=1 then 'store 1 active'
--            when store_id=1 and active=0 then 'store 1 innactive'
--            when store_id=2 and active=1 then 'store 2 active'
--            when store_id=2 and active=0 then 'store 2 innactive'
--            else 'uh oh...check logic!'
-- 		end as store_and_status
-- from customer



-- select
--       film_id,
--       count(case when store_id=1 then inventory_id else null end) as store_1_copies,
--       count(case when store_id=2 then inventory_id else null end) as store_2_copies,
--       count(inventory_id) as total_copies
-- from inventory
-- group by
--      film_id
-- order by
--      film_id      


-- select 
--       film_id,
--       count(case when store_id=1 then inventory_id else null end) as count_of_store_1_inventory,
--       count(case when store_id=2 then inventory_id else null end) as count_of_store_2_inventory
-- from inventory

-- group by 
--      film_id
--      
-- order by
-- 	film_id



-- select 
--       store_id,
--       count(case when active=1 then customer_id else null end) as active,
--       count(case when active=0 then customer_id else null end) as innactive
-- from customer

-- group by 
--      store_id


-- 1.
-- select 
--       first_name,
--       last_name,
--       email,
--       store_id
-- from staff;


-- 2.
-- select 
--       store_id,
--       count(inventory_id) as inventory_items
-- from inventory
-- group by 
--       store_id;


-- 3.
-- select 
--       store_id,
--       count(customer_id) as active_customers
-- from customer
-- where active =1
-- group by 
--       store_id;


-- 4.
-- select
--       count(email) as emails
-- from customer;


-- 5.
-- select 
--       store_id,
--       count(distinct film_id) as unique_films
-- from inventory
-- group by 
--       store_id;
-- select 
--       count(distinct name) as unique_categories
-- from category


-- 6.
-- select
--       min(replacement_cost) as least_expensive,
--       max(replacement_cost) as most_expensive,
--       avg(replacement_cost) as average_replacement_cost
-- from film


-- 7.
-- select 
--       avg(amount) as average_payment,
--       max(amount) as max_payment
-- from payment


-- 8.
-- select
--       customer_id,
--       count(rental_id) as number_of_rentals
-- from rental
-- group by
--       customer_id
-- order by
--       count(rental_id) desc



-- select distinct
--       inventory.inventory_id
-- from inventory
--     inner join rental
--     on inventory.inventory_id=rental.inventory_id

-- limit 5000


-- select distinct
--       inventory_id,
--       store_id,
--       film.title,
--       film.description
--       
-- from inventory
--     inner join film
--       on inventory.film_id=film.film_id


-- select distinct
--       inventory.inventory_id,
--       rental.inventory_id
-- from inventory
--     left join rental
--     on inventory.inventory_id=rental.inventory_id

-- limit 5000


-- select distinct
--       film.title,
--       count(film_actor.actor_id) as count_of_actors
-- from film
--     left join film_actor
--     on film_actor.film_id=film.film_id
-- group by
--        film.title



-- select
--       film.film_id,
--       film.title,
--       category.name as category_name
-- from film
--       inner join film_category
--       on film.film_id=film_category.film_id
--       inner join category
--       on film_category.category_id=category.category_id



-- select
--       actor.first_name as actor_first_name,
--       actor.last_name as actor_last_name,
--       film.title as film_title
-- from actor
-- inner join film_actor
-- on film_actor.actor_id=actor.actor_id
-- inner join film
-- on film.film_id=film_actor.film_id



-- select
--       'advisor' as type,
--       first_name,
--       last_name
-- from advisor

-- union 

-- select
--       'investor' as type,
--       first_name,
--       last_name
-- from investor
      


-- select
--       'advisor' as type,
--       first_name,
--       last_name
-- from advisor

-- union 

-- select
--       'staff' as type,
--       first_name,
--       last_name
-- from staff







