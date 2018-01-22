USE sakila; 

# Q 1.a.
SELECT 
    first_name, last_name
FROM
    actor; 

# Q 1. b. 
SELECT 
    UPPER(CONCAT(first_name, '   ', last_name)) AS 'Actor Name'
FROM
    actor; 

# Q2.a. 
SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    first_name LIKE '%Joe'; 

# Q 2.b
SELECT 
    first_name, last_name
FROM
    actor
WHERE
    last_name LIKE '%GEN%';

# Q2.c

SELECT 
    first_name, last_name
FROM
    actor
WHERE
    last_name LIKE '%LI%'
ORDER BY last_name;

# Q2.d.

SELECT 
    country_id, country
FROM
    country
WHERE
    country IN ('Afghanistan' , 'Bangladesh', 'China');

Q3.a.

Alter table actor add Middle_name char(30);
SELECT 
    *
FROM
    actor;

#Q3.b. .. 
Alter table actor add Middle_name char(30) 
Modify column Middle_name blob(30) ;

#Q3.c.
Alter table actor drop Middle_name;
SELECT 
    *
FROM
    actor;

# Q4.a

SELECT 
    last_name, COUNT(last_name)
FROM
    actor
GROUP BY last_name; 

# Q4.b

SELECT 
    last_name, COUNT(last_name)
FROM
    actor
GROUP BY last_name
HAVING COUNT(last_name) >= 2; 

# Q4.c.

 SELECT 
    *
FROM
    actor;
UPDATE actor 
SET 
    first_name = 'HARPO'
WHERE
    actor_id = 172; 

#Q4.d.
 SELECT 
    *
FROM
    actor;
UPDATE actor 
SET 
    first_name = 'GROUCHO'
WHERE
    actor_id = 172; 

Q5.a.

Use sekila

CREATE Table adress
( 
adress_id int primary key , 
adress CHAR(30), 
Adress2 CHAR(30), 
District CHART(30), 
.
.
postal_code int; 
)
DESC adress

Q6.a
 
SELECT 
    first_name, last_name, address
FROM
    staff s
        JOIN
    address a ON s.address_id = a.address_id;

Q6.b.

SELECT 
    s.first_name, s.last_name, SUM(p.amount) AS 'Total Amount'
FROM
    staff s
        JOIN
    payment p ON s.staff_id = p.staff_id
WHERE
    payment_date > '2005-08-1'
        AND payment_date < '2005-08-31'
GROUP BY s.first_name;

Q6.c.

SELECT 
    f.title, COUNT(fa.actor_id)
FROM
    film f
        JOIN
    film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title; 

# Q6.d.

SELECT 
    f.title, COUNT(i.inventory_id) AS '# of Copies'
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
WHERE
    f.title LIKE '%Hunchback Impossible%';

# Q6.e.

SELECT 
    c.first_name, c.last_name, SUM(p.amount) AS 'Total Paid'
FROM
    customer c
        JOIN
    payment p ON c.customer_id = p.customer_id
GROUP BY c.last_name;

# Q7.a
SELECT 
    title, language_id
FROM
    film
WHERE
    language_id IN (SELECT 
            language_id
        FROM
            language
        WHERE
            name = 'English')

# Q7. b. 

SELECT 
    first_name, last_name
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id IN (SELECT 
                    film_id
                FROM
                    film
                WHERE
                    title LIKE '%Alone Trip%'));

# Q7. c.

SELECT 
    c.first_name, c.last_name, c.email, co.country
FROM
    customer c
        JOIN
    address a ON c.address_id = a.address_id
        JOIN
    city ci ON a.city_id = ci.city_id
        JOIN
    country co ON co.country_id = ci.country_id
WHERE
    co.country = 'Canada';

#Q7. d. 

SELECT 
    f.title, ca.name
FROM
    film f
        JOIN
    film_category fc ON f.film_id = fc.film_id
        JOIN
    category ca ON fc.category_id = ca.category_id
WHERE
    ca.name = 'Family';  

#Q7.e.

SELECT 
    f.title, COUNT(re.rental_id) AS '# of rentals'
FROM
    film f
        JOIN
    Inventory i ON f.film_id = i.film_id
        JOIN
    rental re ON re.inventory_id = i.inventory_id
GROUP BY f.title; 

#Q7.f 

SELECT 
    i.store_id, SUM(p.amount) AS 'Total Amounts in $'
FROM
    inventory i
        JOIN
    rental re ON i.inventory_id = re.inventory_id
        JOIN
    payment p ON re.rental_id = p.rental_id
GROUP BY i.store_id;

# Q7.g.
	
SELECT 
    s.store_id, ci.city, c.country
FROM
    store s
        JOIN
    address a ON s.address_id = a.address_id
        JOIN
    city ci ON a.city_id = ci.city_id
        JOIN
    country c ON ci.country_id = c.country_id;
    
# Q7.h.
 
SELECT 
    ca.name, SUM(p.amount) AS 'Gross Revenue'
FROM
    category ca
        JOIN
    Film_category fc ON ca.category_id = fc.category_id
        JOIN
    inventory i ON fc.film_id = i.film_id
        JOIN
    rental re ON re.inventory_id = i.inventory_id
        JOIN
    payment p ON re.rental_id = p.rental_id
GROUP BY ca.name DESC; 
 
 # Q8.a.
 
CREATE VIEW Genre_View AS
SELECT 
    ca.name, SUM(p.amount) AS 'Gross Revenue'
FROM
    category ca
        JOIN
    Film_category fc ON ca.category_id = fc.category_id
        JOIN
    inventory i ON fc.film_id = i.film_id
        JOIN
    rental re ON re.inventory_id = i.inventory_id
        JOIN
    payment p ON re.rental_id = p.rental_id
GROUP BY ca.name DESC;

#Q8.b.
SELECT 
    *
FROM
    Genre_View;

#Q8.c . 

Drop View Genre_View; 

