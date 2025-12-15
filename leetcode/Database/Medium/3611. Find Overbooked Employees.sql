WITH Temp AS (
  SELECT m.employee_id, e.employee_name, e.department,
  WEEK(meeting_date, 1) AS wk, SUM(m.duration_hours) AS total_meeting_hours
  FROM meetings AS m
  JOIN employees AS e ON m.employee_id = e.employee_id
  GROUP BY m.employee_id, wk
  HAVING total_meeting_hours > 20
)

SELECT employee_id, employee_name, department, COUNT(*) AS meeting_heavy_weeks
FROM Temp
GROUP BY employee_id
HAVING meeting_heavy_weeks >= 2
ORDER BY meeting_heavy_weeks DESC, employee_name
