---new Version JOIN

SELECT *
FROM students AS std
JOIN books AS bk
    ON std.id = bk.student_id;

--- old Version JOIN

SELECT *
FROM students AS std, books AS bk
WHERE std.id = bk.student_id;


---INNER JOIN --->>>>
-- 1. INNER JOIN (only matching records from both tables)
SELECT 
    s.full_name,
    s.class,
    s.roll,
    b.book_name,
    b.author,
    b.borrow_date
FROM students s
INNER JOIN books b ON s.id = b.student_id;

---LEFT JOIN ----->>>>>
-- 2. LEFT JOIN (all students + books if they have any)
SELECT 
    s.full_name,
    s.class,
    s.roll,
    b.book_name,
    b.borrow_date,
    b.return_date
FROM students s
LEFT JOIN books b ON s.id = b.student_id;

--- RIGHT JOIN ----->>>>
-- 3. RIGHT JOIN (all books + student info if exists)
SELECT 
    s.full_name,
    b.book_name,
    b.author,
    b.borrow_date
FROM students s
RIGHT JOIN books b ON s.id = b.student_id;

-- 4. FULL OUTER JOIN simulation (MySQL doesn't have FULL JOIN)
-- Method 1: LEFT + RIGHT with UNION
SELECT s.full_name, b.book_name, 'from left' AS source
FROM students s
LEFT JOIN books b ON s.id = b.student_id

UNION

SELECT s.full_name, b.book_name, 'from right' AS source
FROM students s
RIGHT JOIN books b ON s.id = b.student_id;

-- 5. Show only students who have NOT borrowed any book
SELECT 
    s.full_name,
    s.class,
    s.roll
FROM students s
LEFT JOIN books b ON s.id = b.student_id
WHERE b.id IS NULL;

-- 6. Show only books that are NOT borrowed by anyone
SELECT 
    book_name,
    author,
    isbn
FROM books
WHERE student_id IS NULL;

-- 7. Count how many books each student has
SELECT 
    s.full_name,
    s.class,
    COUNT(b.id) AS total_books
FROM students s
LEFT JOIN books b ON s.id = b.student_id
GROUP BY s.id, s.full_name, s.class
ORDER BY total_books DESC;