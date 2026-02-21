CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE products (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE orders (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO users (name, email, password, is_admin) VALUES
('Sajib Ahmed', 'sajib1@gmail.com', '$2a$10$hash1', TRUE),
('Ria Khan', 'ria2@gmail.com', '$2a$10$hash2', FALSE),
('Tanvir Hasan', 'tanvir3@gmail.com', '$2a$10$hash3', FALSE),
('Nusrat Jahan', 'nusrat4@gmail.com', '$2a$10$hash4', FALSE),
('Rahim Uddin', 'rahim5@gmail.com', '$2a$10$hash5', FALSE),
('Karim Ali', 'karim6@gmail.com', '$2a$10$hash6', FALSE),
('Mitu Akter', 'mitu7@gmail.com', '$2a$10$hash7', FALSE);


INSERT INTO products (name, description, price, stock) VALUES
('Laptop', 'Gaming Laptop', 75000.00, 10),
('Smartphone', 'Android Phone', 25000.00, 20),
('Headphone', 'Wireless Headphone', 3000.00, 50),
('Keyboard', 'Mechanical Keyboard', 4500.00, 30),
('Mouse', 'Gaming Mouse', 1500.00, 40),
('Monitor', '24 inch LED Monitor', 18000.00, 15),
('Power Bank', '20000mAh Power Bank', 2000.00, 60);

INSERT INTO orders (user_id, total_amount, status) VALUES
(1, 75000.00, 'completed'),
(2, 25000.00, 'pending'),
(3, 3000.00, 'completed'),
(4, 4500.00, 'shipped'),
(5, 1500.00, 'pending'),
(6, 18000.00, 'completed'),
(7, 2000.00, 'shipped');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 75000.00),
(2, 2, 1, 25000.00),
(3, 3, 1, 3000.00),
(4, 4, 1, 4500.00),
(5, 5, 1, 1500.00),
(6, 6, 1, 18000.00),
(7, 7, 1, 2000.00);

--- ----------===========--------------
--- ----------===========--------------
--- ----------===========--------------

কোন user কত order করেছে
SELECT users.name, COUNT(orders.id) AS total_orders
FROM users
LEFT JOIN orders ON users.id = orders.user_id
GROUP BY users.name;

--- ----------===========--------------
--- ----------===========--------------
--- ----------===========--------------

Full Order Details (Professional Query)
SELECT 
    orders.id AS order_id,
    users.name AS customer,
    products.name AS product,
    order_items.quantity,
    order_items.price
FROM order_items
JOIN orders ON order_items.order_id = orders.id
JOIN users ON orders.user_id = users.id
JOIN products ON order_items.product_id = products.id;

--- ----------===========--------------
--- ----------===========--------------
--- ----------===========--------------

যে user সবচেয়ে বেশি খরচ করেছে
SELECT users.name, SUM(orders.total_amount) AS total_spent
FROM users
JOIN orders ON users.id = orders.user_id
GROUP BY users.name
ORDER BY total_spent DESC
LIMIT 1;