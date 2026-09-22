-- Create the practice database using utf8mb4 (supports emojis and all languages)
CREATE DATABASE IF NOT EXISTS cafe_db2
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE cafe_db2;

-- customers: people who place orders
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    city VARCHAR(100) NOT NULL,
    joined_on DATE NOT NULL
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- products: items the cafe sells
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(6,2) NOT NULL
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- orders: links a customer to a product they bought
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    ordered_on DATE NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(id),
    CONSTRAINT fk_orders_product FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 12 customers across 4+ cities
INSERT INTO customers (name, email, city, joined_on) VALUES
('Aisha Khan', 'aisha.khan@example.com', 'Berlin', '2025-01-15'),
('Marco Rossi', 'marco.rossi@example.com', 'Milan', '2025-02-03'),
('Sophie Lefevre', 'sophie.lefevre@example.com', 'Paris', '2025-02-20'),
('Liam OConnor', 'liam.oconnor@example.com', 'Dublin', '2025-03-05'),
('Hana Suzuki', 'hana.suzuki@example.com', 'Berlin', '2025-03-18'),
('Carlos Mendez', 'carlos.mendez@example.com', 'Milan', '2025-04-01'),
('Emma Dubois', 'emma.dubois@example.com', 'Paris', '2025-04-10'),
('Noah Fitzgerald', 'noah.fitzgerald@example.com', 'Dublin', '2025-04-22'),
('Priya Sharma', 'priya.sharma@example.com', 'Berlin', '2025-05-02'),
('Luca Bianchi', 'luca.bianchi@example.com', 'Milan', '2025-05-14'),
('Chloe Martin', 'chloe.martin@example.com', 'Paris', '2025-06-01'),
('Sean Murphy', 'sean.murphy@example.com', 'Dublin', '2025-06-19');

-- 10 products across 3+ categories with varied prices
INSERT INTO products (name, category, price) VALUES
('Espresso', 'Coffee', 2.50),
('Cappuccino', 'Coffee', 3.20),
('Latte', 'Coffee', 3.50),
('Green Tea', 'Tea', 2.80),
('Chai Latte', 'Tea', 3.10),
('Croissant', 'Bakery', 2.20),
('Blueberry Muffin', 'Bakery', 2.60),
('Chocolate Cookie', 'Bakery', 1.80),
('Cheese Sandwich', 'Food', 4.50),
('Avocado Toast', 'Food', 5.90);

-- 40 orders spread across the last 6 months with varied quantities
INSERT INTO orders (customer_id, product_id, quantity, ordered_on) VALUES
(1, 1, 2, '2025-03-25'),
(2, 3, 1, '2025-03-28'),
(3, 6, 3, '2025-04-02'),
(4, 9, 1, '2025-04-05'),
(5, 2, 2, '2025-04-08'),
(6, 10, 1, '2025-04-11'),
(7, 4, 2, '2025-04-14'),
(8, 7, 1, '2025-04-17'),
(9, 1, 1, '2025-04-20'),
(10, 8, 4, '2025-04-23'),
(11, 5, 2, '2025-04-26'),
(12, 3, 1, '2025-04-29'),
(1, 6, 2, '2025-05-02'),
(2, 9, 1, '2025-05-05'),
(3, 2, 3, '2025-05-08'),
(4, 10, 1, '2025-05-11'),
(5, 7, 2, '2025-05-14'),
(6, 1, 1, '2025-05-17'),
(7, 8, 2, '2025-05-20'),
(8, 4, 1, '2025-05-23'),
(9, 5, 3, '2025-05-26'),
(10, 3, 1, '2025-05-29'),
(11, 6, 2, '2025-06-01'),
(12, 9, 1, '2025-06-04'),
(1, 2, 1, '2025-06-07'),
(2, 10, 2, '2025-06-10'),
(3, 7, 1, '2025-06-13'),
(4, 1, 3, '2025-06-16'),
(5, 8, 1, '2025-06-19'),
(6, 4, 2, '2025-06-22'),
(7, 5, 1, '2025-06-25'),
(8, 3, 2, '2025-06-28'),
(9, 6, 1, '2025-07-01'),
(10, 9, 2, '2025-07-04'),
(11, 2, 1, '2025-07-07'),
(12, 10, 3, '2025-07-10'),
(1, 7, 1, '2025-07-13'),
(2, 4, 2, '2025-07-16'),
(3, 8, 1, '2025-07-19'),
(4, 5, 2, '2025-07-22');
