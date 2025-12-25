SELECT INITCAP(item_name) AS item_name, INITCAP(color) AS color
FROM winter_clothing
WHERE LOWER(item_name) LIKE '%sweater%'
