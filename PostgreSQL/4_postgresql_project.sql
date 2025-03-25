/*
4. Книга, которую чаще всего дослушивают до конца
*/
SELECT ab.title, COUNT(l.user_id) AS completed_listens
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
WHERE l.position_to >= ab.duration * 0.9
GROUP BY ab.title
ORDER BY completed_listens DESC
LIMIT 1;