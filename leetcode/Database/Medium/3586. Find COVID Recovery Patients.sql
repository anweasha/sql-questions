SELECT t1.patient_id, p.patient_name, p.age, DATEDIFF(MIN(t2.test_date), t1.test_date) AS recovery_time
FROM covid_tests AS t1
JOIN covid_tests AS t2 ON t1.patient_id = t2.patient_id AND t1.result = 'Positive' AND t2.result = 'Negative' AND t1.test_date < t2.test_date
JOIN patients AS p ON t1.patient_id = p.patient_id
GROUP BY t1.patient_id
ORDER BY recovery_time, p.patient_name
