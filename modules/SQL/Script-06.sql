-- 6.
-- Анализируя нашу базу данных, найдите в какой из стран за все время было наибольшее число DevOps сотрудников всех уровней
-- (Junior, Middle, Senior)? В ответе укажите страну и число сотрудников.

SELECT country, count(name) AS devops_count FROM employee e, office o
WHERE lower(job_title) like '%devops%'
  AND e.office_id = o.id
GROUP BY country
ORDER BY devops_count DESC

-- Добавить колонку с подсчётом должности Senior

SELECT 
    o.country, 
    COUNT(e.name) AS devops_count,
    COUNT(CASE WHEN e.job_title LIKE '%Senior%' AND LOWER(e.job_title) LIKE '%devops%' THEN 1 END) AS senior_count
FROM 
    employee e
JOIN 
    office o ON e.office_id = o.id
WHERE 
    LOWER(e.job_title) LIKE '%devops%'
GROUP BY 
    o.country
ORDER BY 
    devops_count DESC;
