# Задание №1

DROP DATABASE users_adverts;
CREATE DATABASE users_adverts;
USE users_adverts;

CREATE TABLE users (
    date DATE,
    user_id VARCHAR(36),
    view_adverts INT
);

SELECT * FROM users;


# 1. Напишите запрос SQL, выводящий одним числом количество уникальных пользователей в этой таблице в период с 2023-11-07 по 2023-11-15.

SELECT COUNT(DISTINCT user_id) AS unique_users 
FROM users
WHERE date BETWEEN '2023-11-07' AND '2023-11-15';

# 2. Определите пользователя, который за весь период посмотрел наибольшее количество объявлений. 

SELECT user_id, 
	COUNT(DISTINCT view_adverts) AS views_count
FROM users
GROUP BY user_id
ORDER BY views_count DESC
LIMIT 1;

# 3. Определите день с наибольшим средним количеством просмотренных рекламных объявлений на пользователя, 
# но учитывайте только дни с более чем 500 уникальными пользователями.

SELECT date, 
	SUM(view_adverts) / COUNT(DISTINCT user_id) AS avg_views_user
FROM users
GROUP BY date
HAVING COUNT(DISTINCT user_id) > 500
ORDER BY avg_views_user DESC
LIMIT 1;

# 4. Напишите запрос возвращающий LT (продолжительность присутствия пользователя на сайте) по каждому пользователю. Отсортировать LT по убыванию.

SELECT user_id,
	SUM(view_adverts) AS LT
FROM users
GROUP BY user_id
ORDER BY LT DESC;

# 5. Для каждого пользователя подсчитайте среднее количество просмотренной рекламы за день, а затем выясните, 
# у кого самый высокий средний показатель среди тех, кто был активен как минимум в 5 разных дней.

SELECT user_id,
	SUM(view_adverts) / COUNT(DISTINCT date) AS avg_views_day
FROM users
GROUP BY user_id
HAVING COUNT(DISTINCT date) >= 5
ORDER BY avg_views_day DESC
LIMIT 1;














