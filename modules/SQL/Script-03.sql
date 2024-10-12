-- 3.
-- Анализируя нашу базу данных, найдите самое популярное имя среди сотрудников компании GoGoogle.

SELECT name FROM employee
WHERE company_id IN (SELECT id FROM company WHERE name = 'GoGoogle')
GROUP BY name
ORDER BY count(name) DESC
LIMIT 1;