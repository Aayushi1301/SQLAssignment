
\! echo "Find out the PG-13 rated comedy movies. DO NOT use the film_list table."
SELECT f.title AS PG13_rated_comedy_movies
	FROM film f
		JOIN film_category fc 
			ON f.film_id = fc.film_id
		JOIN category c 
			ON fc.category_id = c.category_id
	WHERE c.name = 'Comedy' AND f.rating = 'PG-13';



\! echo "Top 3 rented Horror movies."
SELECT f.title AS top_3_rented_horror_movies , f.film_id
	FROM film f 
		JOIN film_category fc 
			ON f.film_id = fc.film_id 
		JOIN category c 
			ON fc.category_id = c.category_id 
		JOIN inventory i 
			ON f.film_id = i.film_id 
		JOIN rental r 
			ON i.inventory_id = r. inventory_id 
	WHERE c.name = 'Horror' 
	GROUP BY f.film_id 
	ORDER BY COUNT(f.film_id) DESC 
	LIMIT 3;

\! echo "List of customers from India who have rented sports movies."
SELECT DISTINCT Concat(cust.first_name, ' ', cust.last_name) AS customer_from_India_renting_sports_movies
	FROM film_category fc 
		JOIN category c 
			ON fc.category_id = c.category_id 
		JOIN inventory i 
			ON fc.film_id = i.film_id 
		JOIN rental r 
			ON i.inventory_id = r. inventory_id 
		JOIN customer cust
			ON r.customer_id = cust.customer_id
		JOIN address a
			ON cust.address_id = a.address_id
		JOIN city 
			ON a.city_id = city.city_id
		JOIN country cnty
			ON city.country_id = cnty.country_id
	WHERE cnty.country = 'India' AND c.name = 'Sports';

\! echo "List of customers from Canada who have rented NICK WAHLBERG movies.";
SELECT DISTINCT Concat(cust.first_name, ' ', cust.last_name) AS customers_from_Canada_who_have_rented_NICK_WAHLBERG_movies
	FROM film f 
		JOIN film_actor fa 
			ON f.film_id = fa.film_id
		JOIN actor a
			ON  fa.actor_id = a.actor_id
		JOIN inventory i 
			ON f.film_id = i.film_id 
		JOIN rental r 
			ON i.inventory_id = r. inventory_id 
		JOIN customer cust
			ON r.customer_id = cust.customer_id
		JOIN address ad
			ON cust.address_id = ad.address_id
		JOIN city 
			ON ad.city_id = city.city_id
		JOIN country cnty
			ON city.country_id = cnty.country_id
	WHERE cnty.country = 'Canada' AND a.first_name = 'NICK' AND a.last_name = 'WAHLBERG';

\! echo "Number of movies in which SEAN WILLIAMS has acted."
SELECT Count(fa.actor_id) AS number_of_movies_in_which_“SEAN_WILLIAMS”_acted
	FROM film f 
		JOIN film_actor fa 
			ON f.film_id = fa.film_id
		JOIN actor a
			ON  fa.actor_id = a.actor_id
WHERE a.first_name = 'SEAN' AND a.last_name = 'WILLIAMS';
