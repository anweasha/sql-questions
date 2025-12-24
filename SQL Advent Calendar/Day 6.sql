SELECT resort_name, ROUND(SUM(snowfall_inches), 2) AS total_annual_snowfall,
NTILE(4) OVER (ORDER BY SUM(snowfall_inches)) AS snowfall_quartile
FROM resort_monthly_snowfall
GROUP BY resort_name
