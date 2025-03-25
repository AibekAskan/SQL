# Задание №2

DROP DATABASE mini_project;
CREATE DATABASE mini_project;
USE mini_project;

# 1 таблица
CREATE TABLE T_TAB1 (
	ID INT UNIQUE,
	GOODS_TYPE VARCHAR(255),
	QUANTITY INT,
	AMOUNT INT,
	SELLER_NAME VARCHAR(255)
);

INSERT INTO T_TAB1 VALUES
(1, 'MOBILE PHONE', 2, 400000, 'MIKE'),
(2, 'KEYBOARD', 1, 10000, 'MIKE'),
(3, 'MOBILE PHONE', 1, 50000, 'JANE'),
(4, 'MONITOR', 1, 110000, 'JOE'),
(5, 'MONITOR', 2, 80000, 'JANE'),
(6, 'MOBILE PHONE', 1, 130000, 'JOE'),
(7, 'MOBILE PHONE', 1, 60000, 'ANNA'),
(8, 'PRINTER', 1, 90000, 'ANNA'),
(9, 'KEYBOARD', 2, 10000, 'ANNA'),
(10, 'PRINTER', 1, 80000, 'MIKE');

SELECT * FROM T_TAB1;

# 2 таблица
CREATE TABLE T_TAB2 (
	ID INT UNIQUE,
	NAME VARCHAR(255),
	SALARY INT,
	AGE INT
);

INSERT INTO T_TAB2 VALUES
(1, 'ANNA', 110000, 27),
(2, 'JANE', 80000, 25),
(3, 'MIKE', 120000, 25),
(4, 'JOE', 70000, 24),
(5, 'RITA', 120000, 29);

SELECT * FROM T_TAB2;


# 1. Напишите запрос, который вернёт список уникальных категорий товаров (GOODS_TYPE). 
# Какое количество уникальных категорий товаров вернёт запрос? (4)

SELECT COUNT(DISTINCT GOODS_TYPE) AS unique_goods_type_count
FROM T_TAB1;

# 2. Напишите запрос, который вернет суммарное количество и суммарную стоимость проданных мобильных телефонов. 
# Какое суммарное количество и суммарную стоимость вернул запрос? (5, 640000)

SELECT SUM(QUANTITY) AS total_quantity, SUM(AMOUNT) AS total_amount
FROM T_TAB1
WHERE GOODS_TYPE = 'MOBILE PHONE';

# 3. Напишите запрос, который вернёт список сотрудников с заработной платой > 100000. 
# Какое кол-во сотрудников вернул запрос? (3)

SELECT * FROM T_TAB2
WHERE SALARY > 100000;

# 4. Напишите запрос, который вернёт минимальный и максимальный возраст сотрудников, 
# а также минимальную и максимальную заработную плату.

SELECT MIN(AGE) AS min_age, MAX(AGE) AS max_age, MIN(SALARY) AS min_salary, MAX(SALARY) AS max_salary
FROM T_TAB2;

# 5. Напишите запрос, который вернёт среднее количество проданных клавиатур и принтеров.

SELECT GOODS_TYPE, AVG(QUANTITY) AS avg_quantity
FROM T_TAB1
WHERE GOODS_TYPE IN ('KEYBOARD', 'PRINTER')
GROUP BY GOODS_TYPE;

# 6. Напишите запрос, который вернёт имя сотрудника и суммарную стоимость проданных им товаров.

SELECT SELLER_NAME, SUM(AMOUNT) AS total_sales
FROM T_TAB1
GROUP BY SELLER_NAME;

# 7. Напишите запрос, который вернёт имя сотрудника, тип товара, кол-во товара, стоимость товара, заработную плату и возраст сотрудника MIKE.

SELECT t1.SELLER_NAME, t1.GOODS_TYPE, t1.QUANTITY, t1.AMOUNT, t2.SALARY, t2.AGE
FROM T_TAB1 t1
JOIN T_TAB2 t2 ON t1.SELLER_NAME = t2.NAME
WHERE t1.SELLER_NAME = 'MIKE';

# 8. Напишите запрос, который вернёт имя и возраст сотрудника, который ничего не продал. 
# Сколько таких сотрудников? (1)

SELECT NAME, AGE 
FROM T_TAB2
WHERE NAME NOT IN (SELECT SELLER_NAME FROM T_TAB1);

# 9. Напишите запрос, который вернёт имя сотрудника и его заработную плату с возрастом меньше 26 лет? (JANE, MIKE, JOE)
# Какое количество строк вернул запрос? (3)

SELECT NAME, SALARY
FROM T_TAB2
WHERE AGE < 26;

# 10. Сколько строк вернёт следующий запрос: (0)

SELECT * 
FROM T_TAB1 t
JOIN T_TAB2 t2 ON t2.name = t.seller_name
WHERE t2.name = 'RITA';









