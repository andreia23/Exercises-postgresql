/*01*/

SELECT *
FROM film f left join inventory i
on i.film_id = f.film_id
WHERE i.film_id is null
ORDER BY f.title;



/*02*/

SELECT cu.customer_id, cu.first_name, sum(pa.amount) quant
FROM customer cu INNER join payment pa on
pa.customer_id = cu.customer_id
GROUP BY cu.customer_id
ORDER BY cu.customer_id ;


/*03*/

SELECT cu.customer_id, cu.first_name, sum(pa.amount) quant
FROM customer cu inner join payment pa on
pa.customer_id = cu.customer_id
GROUP BY cu.customer_id
HAVING sum(pa.amount) > 200
ORDER BY quant desc;

-- 4°


select s.staff_id id, count(*) transacoes
from staff s
join payment p
on s.staff_id = p.staff_id 
group by id

/*5*/
SELECT  so.store_id, count(cu.customer_id) "Quantidade de cliente"
FROM store so inner join customer cu on 
so.store_id = cu.store_id
group by so.store_id;


/*6*/
SELECT  so.store_id, count(cu.customer_id) "Quantidade de cliente"
FROM store so inner join customer cu on 
so.store_id = cu.store_id
group by so.store_id
HAVING count(cu.customer_id) > 300;

-- 7
select film_id, title, rental_rate
from film
where rental_rate > (select avg(rental_rate) from film)

-- 8°

SELECT I.FILM_ID,R.RENTAL_DATE
FROM INVENTORY I 
JOIN RENTAL R ON R.INVENTORY_ID=I.INVENTORY_ID
WHERE R.RENTAL_DATE BETWEEN DATE '2005/05/29' AND DATE '2005/05/30';

-- 9°
SELECT I.FILM_ID,F.TITLE
FROM INVENTORY I 
JOIN RENTAL R ON R.INVENTORY_ID=I.INVENTORY_ID JOIN FILM F ON F.FILM_ID=I.FILM_ID
WHERE R.RENTAL_DATE BETWEEN DATE '2005/05/29' AND DATE '2005/05/30';




/*10*/

SELECT customer_id, first_name from customer cu
where exists(select * from payment pa);

--11°

select c.name, count(*) quantidade
from category c
join film_category f
on c.category_id = f.category_id
group by c.name
order by quantidade desc
limit 5


-- 12°

select fi.film_id, fi.title, i.inventory_id
from film fi inner join inventory i
on i.film_id = fi.film_id

-- 13°

select first_name from customer where email is null

-- 15°
select lan.name--, --count(f.film_id)
from language lan inner join film f on f.language_id
= lan.language_id
group by lan.name

-- 16°
select date_part('month',payment_date),sum(amount)
from payment
where date_part('year',payment_date) = 2007
group by date_part
having sum(amount) = (select max(tot) from (select date_part('month',payment_date), sum(amount) tot from payment
group by date_part) pay)

OU

select date_part('month',payment_date),sum(amount) Faturamento
from payment
where date_part('year',payment_date) = 2007
group by date_part
order by Faturamento desc
limit 1;

-- 17°



-- 18°

select first_name,quant
from (select ac.actor_id,ac.first_name,count(film_id) quant from actor ac inner join film_actor f on ac.actor_id = 
f.actor_id group by ac.first_name,ac.actor_id ) jun
order by quant,first_name
limit 5;



-- 19°
select s.first_name,st.manager_staff_id,s.staff_id
from staff s inner join store st on st.manager_staff_id = s.staff_id

-- 20°

select rental_id,staff_id  from rental

-- 21°
select title,avg(rental_duration) from film
group by title

select* from film



-- 22°



-- 23°
select f.title, fc.category_id
from film f inner join  film_category fc on fc.film_id = f.film_id
where fc.category_id in (select category_id FROM category where name in ('Drama','Action'))
order by f.title

select f.title, fc.category_id
from film f inner join  film_category fc on fc.film_id = f.film_id
where fc.category_id in (1,7)
order by f.title
select * from category


















