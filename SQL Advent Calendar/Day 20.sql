SELECT cl.break_id, ct.cocoa_name, l.location_name
FROM cocoa_logs AS cl
INNER JOIN break_schedule AS b ON cl.break_id = b.break_id
INNER JOIN cocoa_types AS ct ON cl.cocoa_id = ct.cocoa_id
INNER JOIN locations AS l ON b.location_id = l.location_id
