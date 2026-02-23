-----DATABASE NAME--------

CREATE DATABASE ecomerce_system;

-----Create Table USer------

CREATE TABLE users
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(225) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

----INSERT VALUE IN TABLE---------

INSERT INTO users(name,email,password,is_admin)
VALUES
("sajib",    "sajib@gmail.com",     "12345&^$@",     1),
("ramjan",   "ramjan@gmail.com",    "789654@#%^",    1),
("karim",    "karim123@gmail.com",  "Karim@2025!",   1),
("rahim",    "rahim.khan@gmail.com","rahim#4567",    1),
("faruk",    "faruk.bd@gmail.com",  "Faruk$890",     1),
("sumon",    "sumon456@gmail.com",  "Sumon@2026^",   1),
("naim",     "naimulislam@gmail.com","Naim!13579",   1);

--------Random Query in SQL-------

UPDATE users
SET is_admin = 0
WHERE id != 1;

--------========-----------

SELECT id,name
FROM users
ORDER BY name DESC;

---------===========------------
---------------Create Anothe Table in Orders -----------------

CREATE TABLE orders
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10,5) NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
    
------INSERT INTO VALUE IN THIS TABLE---------

INSERT INTO orders(user_id,product_name,amount)
VALUES
(1,"mango",128.36),
(3,"banana",289.987),
(5,"orange",458.25),
(2,"pineApple",756.65),
(1,"green-coconat",457.26);



-------ALL JOIN OPERATIONS-------

SELECT *
FROM users as u
INNER JOIN orders as o
ON u.id = o.user_id

--------==========------------------

SELECT u.name,u.id,o.product_name,o.amount
FROM orders as o 
LEFT JOIN users as u 
ON o.user_id = u.id;


------------------======================------------------------