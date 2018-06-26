\! echo "Find out the number of documentaries with deleted scenes.";
SELECT Count(fl.category) AS number_of_documentaries_with_deleted_scenes
FROM   film_list fl
JOIN film f
ON f.film_id = fl.FID
WHERE  fl.category = 'Documentary' AND f.special_features = 'Deleted Scenes'; 
   

\! echo "Find out the number of sci-fi movies rented by the store managed by Jon Stephens.";
SELECT Count(fl.FID) AS
num_of_scifi_movies_rented_by_the_store_managed_by_Jon_Stephens
FROM   film_list fl
JOIN inventory i
ON fl.FID = i.film_id
JOIN rental r
ON i.inventory_id = r. inventory_id
JOIN staff s
ON r.staff_id = s.staff_id
WHERE  fl.category = "sci-fi"
AND s.first_name = "jon"
 AND s.last_name = "stephens";  


\! echo "Find out the total sales from Animation movies.";
SELECT total_sales AS sales_from_Animation_movies
FROM   sales_by_film_category
WHERE  category = 'Animation';  



\! echo "Find out the top 3 rented category of movies  by “PATRICIA JOHNSON”.";
SELECT   fl.category        AS category,
         Count(fl.category) AS top3rented_category_of_moviesbypatricia_johnson
FROM     film_list fl
JOIN     inventory i
ON       fl.FID = i.film_id
JOIN     rental r
ON       i.inventory_id = r.inventory_id
JOIN     customer cust
ON       r.customer_id = cust.customer_id
WHERE    cust.first_name = 'PATRICIA'
AND      cust.last_name = 'JOHNSON'
GROUP BY fl.category
ORDER BY count(fl.category) DESC limit 3; 


\! echo "Find out the number of R rated movies rented by “SUSAN WILSON”.";
SELECT COUNT(f.rating) AS Rrated_movies_rented_by_SUSAN_WILSON
 	FROM film f 
		JOIN inventory i 
			ON f.film_id = i.film_id 
		JOIN rental r 
			ON i.inventory_id = r.inventory_id 
		JOIN customer cust
			ON r.customer_id = cust.customer_id
WHERE f.rating = 'R' AND cust.first_name = 'SUSAN' AND cust.last_name = 'WILSON';

