SELECT t1.driver_id, d.driver_name, ROUND(AVG(t1.distance_km/t1.fuel_consumed), 2) AS first_half_avg, 
ROUND(AVG(t2.distance_km/t2.fuel_consumed), 2) AS second_half_avg, 
ROUND(AVG(t2.distance_km/t2.fuel_consumed) - AVG(t1.distance_km/t1.fuel_consumed), 2) AS efficiency_improvement
FROM trips AS t1
JOIN trips AS t2 ON t1.driver_id = t2.driver_id AND MONTH(t1.trip_date) IN (1, 2, 3, 4, 5, 6) AND MONTH(t2.trip_date) IN (7, 8, 9, 10, 11, 12)
JOIN drivers AS d ON t1.driver_id = d.driver_id
GROUP BY t1.driver_id
HAVING efficiency_improvement > 0
ORDER BY efficiency_improvement DESC, d.driver_name
