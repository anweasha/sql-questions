SELECT p.toy_id, p.toy_name
FROM toy_production AS p
INNER JOIN toy_delivery AS d ON p.toy_id = d.toy_id
