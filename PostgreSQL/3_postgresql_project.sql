/*
3. Книга, которую слушает больше всего людей
*/
SELECT ab.title, COUNT(DISTINCT l.user_id) AS listeners_count
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
GROUP BY ab.title
ORDER BY listeners_count DESC
LIMIT 1;