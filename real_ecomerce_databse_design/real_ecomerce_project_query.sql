----- USER Table -------------

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

----- USER TABLE VALUS-------

INSERT INTO users (name,email,password) VALUES
('Sajib','sajib@gmail.com','1234'),
('Rahim','rahim@gmail.com','1234'),
('Karim','karim@gmail.com','1234');

----------------------   CATEGORIES TABLE -----------------------

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100),
    parent_id INT DEFAULT NULL,
    FOREIGN KEY (parent_id) REFERENCES categories(id)
);

INSERT INTO categories (category_name,parent_id) VALUES
('Electronics',NULL),
('Mobiles',1),
('Laptops',1),
('Clothing',NULL),
('Men',4),
('Women',4);

------------- Products Table -------------------------------

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    price DECIMAL(10,2),
    stock INT,
    category_id INT,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO products (name,price,stock,category_id,description) VALUES
('iPhone 14',120000,20,2,'Latest Apple iPhone'),
('Dell Laptop',80000,15,3,'Powerful laptop'),
('Men T-Shirt',1200,50,5,'Cotton t-shirt');


-----------------------ADDRESS TABLE ----------------------

CREATE TABLE addresses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    address TEXT,
    city VARCHAR(100),
    country VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO addresses (user_id,address,city,country) VALUES
(1,'House 12, Road 5','Dhaka','Bangladesh'),
(2,'Street 23, Block B','Chittagong','Bangladesh');


------------------- ORDER TABLE ---------------------

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    address_id INT,
    total_price DECIMAL(10,2),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

INSERT INTO orders (user_id,address_id,total_price,status) VALUES
(1,1,121200,'completed'),
(2,2,80000,'pending');

----------------- ORDER-ITEMS  -------------------------------

CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO order_items (order_id,product_id,quantity,price) VALUES
(1,1,1,120000),
(1,3,1,1200),
(2,2,1,80000);

----------------- PAYMENTS TABLE------------------------------

CREATE TABLE payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

INSERT INTO payments (order_id,payment_method,payment_status) VALUES
(1,'Bkash','paid'),
(2,'Cash','pending');



-------------------------- REVIEWS TABLE ---------------------------------------

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    rating INT,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO reviews (user_id,product_id,rating,comment) VALUES
(1,1,5,'Excellent Phone'),
(2,2,4,'Good Laptop');

------------------------ CARTS TABLE -------------------------------------------

CREATE TABLE carts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO carts (user_id) VALUES (1);

-----------------------cart-items table ---------------------------------

CREATE TABLE cart_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cart_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (cart_id) REFERENCES carts(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO cart_items (cart_id,product_id,quantity) VALUES
(1,2,1);

----------------------------wishlists Table --------------------------------------------

CREATE TABLE wishlists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO wishlists (user_id,product_id) VALUES
(1,1),
(1,3);

------------------------------- Shipping Table-------------------------------------------

CREATE TABLE shipping (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    shipping_address TEXT,
    status VARCHAR(50),
    shipped_date TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

INSERT INTO shipping (order_id,shipping_address,status) VALUES
(1,'House 12, Road 5, Dhaka','delivered'),
(2,'Street 23, Block B, Chittagong','pending');

------------------------------coupons table----------------------------------------------------

CREATE TABLE coupons (
    id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50),
    discount DECIMAL(5,2)
);

INSERT INTO coupons (code,discount) VALUES
('WELCOME10',10.00),
('SALE20',20.00);

-------------------------product image table------------------------------------------------------

CREATE TABLE product_images (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO product_images (product_id,image_url) VALUES
(1,'iphone14.png'),
(2,'dell_laptop.png'),
(3,'men_tshirt.png');


---------------------------invebtory table and value -------------------

CREATE TABLE inventory (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    stock INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO inventory (product_id,stock) VALUES
(1,20),
(2,15),
(3,50);


