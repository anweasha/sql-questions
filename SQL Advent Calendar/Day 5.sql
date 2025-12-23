SELECT e.elf_name, COALESCE(v.return_date, "Still resting") AS return_date
FROM elves AS e
LEFT JOIN vacations AS v ON e.elf_id = v.elf_id
