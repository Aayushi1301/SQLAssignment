
\! echo "Find out the PG-13 rated comedy movies. DO NOT use the film_list table."
SELECT f.title AS PG13_rated_comedy_movies
	FROM film f
		JOIN film_category fc 
			ON f.film_id = fc.film_id
		JOIN category c 
			ON fc.category_id = c.category_id
	WHERE c.name = 'Comedy' AND f.rating = 'PG-13';



\! echo "Top 3 rented Horror movies."
SELECT fl.title AS top_3_rented_horror_movies , fl.FID 
FROM film_list fl 
JOIN  inventory i  
ON fl.FID = i.film_id  
JOIN rental r  
ON i.inventory_id = r. inventory_id  
WHERE fl.category = 'Horror'  
GROUP BY fl.FID  
ORDER BY COUNT(fl.FID) DESC  LIMIT 3;

	

\! echo "List of customers from India who have rented sports movies."
SELECT DISTINCT cl.name AS customer_from_India_renting_sports_movies
FROM customer_list cl 
JOIN rental r 
ON r.customer_id = cl.ID
JOIN inventory i 
ON i.inventory_id = r. inventory_id 
JOIN film_category fc 
ON fc.film_id = i.film_id
JOIN category c 
ON fc.category_id = c.category_id
WHERE cl.country = 'India' AND c.name = 'Sports';



\! echo "List of customers from Canada who have rented NICK WAHLBERG movies.";
SELECT DISTINCT cl.name AS customers_from_Canada_who_have_rented_NICK_WAHLBERG_movies
	FROM film f 
		JOIN film_actor fa 
			ON f.film_id = fa.film_id
		JOIN actor a
			ON  fa.actor_id = a.actor_id
		JOIN inventory i 
			ON f.film_id = i.film_id 
		JOIN rental r 
			ON i.inventory_id = r. inventory_id 
		JOIN customer_list cl
			ON r.customer_id = cl.ID
	WHERE cl.country = 'Canada' AND a.first_name = 'NICK' AND a.last_name = 'WAHLBERG';



\! echo "Number of movies in which SEAN WILLIAMS has acted."
SELECT Count(fa.actor_id) AS number_of_movies_in_which_“SEAN_WILLIAMS”_acted
	FROM film f 
		JOIN film_actor fa 
			ON f.film_id = fa.film_id
		JOIN actor a
			ON  fa.actor_id = a.actor_id
WHERE a.first_name = 'SEAN' AND a.last_name = 'WILLIAMS';
