SELECT DISTINCT ticker, 
FIRST_VALUE(TO_CHAR(date, 'Mon-yyyy')) OVER (PARTITION BY ticker ORDER BY open DESC) AS highest_mth,
MAX(open) OVER (PARTITION BY ticker) AS highest_open,
FIRST_VALUE(TO_CHAR(date, 'Mon-yyyy')) OVER (PARTITION BY ticker ORDER BY open) AS lowest_mth,
MIN(open) OVER (PARTITION BY ticker) AS lowest_open
FROM stock_prices
ORDER BY ticker
