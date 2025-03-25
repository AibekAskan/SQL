/*
1. Количество пользователей, добавивших книгу “Coraline”, и пользователей, прослушавших более 10%
*/
SELECT (SELECT COUNT(DISTINCT user_id) 
FROM audio_cards ac
JOIN audiobooks ab ON ac.audiobook_uuid = ab.uuid
WHERE ab.title = 'Coraline') AS users_added_coraline,
    
(SELECT COUNT(DISTINCT l.user_id) 
FROM listenings l
JOIN audiobooks ab ON l.audiobook_uuid = ab.uuid
WHERE ab.title = 'Coraline' 
AND l.position_to > ab.duration * 0.1) AS users_listened_coraline;