/*
2. Количество пользователей, сумма прослушивания (в часах) по ОС и названию книги (исключая тестовые прослушивания)
*/

SELECT l.os_name, ab.title, 
	COUNT(DISTINCT l.user_id) AS user_count, 
	ROUND(SUM((l.position_to - l.position_from) / 3600.0), 2) AS total_hours
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
WHERE l.is_test = 0
GROUP BY l.os_name, ab.title
ORDER BY total_hours DESC;