SELECT t.color_name || ' - ' || l.color_name AS pairings
FROM tinsel_colors AS t
CROSS JOIN light_colors AS l
