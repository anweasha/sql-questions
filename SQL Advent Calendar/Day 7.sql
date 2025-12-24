SELECT COUNT(DISTINCT flake_type) AS unique_snowflake_types
FROM snowfall_log
WHERE DATE(fall_time) = '2025-12-24'
