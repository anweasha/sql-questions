SELECT card_name, issued_amount
FROM (
SELECT *,
ROW_NUMBER() OVER (PARTITION BY card_name ORDER BY issue_year, issue_month) AS rn
FROM monthly_cards_issued
) AS X
WHERE rn = 1
ORDER BY issued_amount DESC
