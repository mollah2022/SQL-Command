SELECT *
FROM teachers
WHERE SALARY > (
    SELECT AVG(SALARY)
    FROM teachers
    );