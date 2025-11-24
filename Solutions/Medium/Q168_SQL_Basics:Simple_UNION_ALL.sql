SELECT * FROM (
SELECT 'EU' AS location, *
FROM eusales

UNION ALL

SELECT 'US' AS location, * 
FROM ussales
)
WHERE price > 50.00
ORDER BY location DESC, id
