-- bookstore.sql
-- BookStore Database Project
-- Author: Joseph Onyango
-- Email: jesuspromisesmedia@gmail.com
-- Submission Date: 13/04/2025
-- Course: Database Design & Programming with SQL
--
-- This SQL script creates a MySQL database for a bookstore.
-- It sets up all required tables with primary keys, foreign key constraints,
-- and user management to demonstrate proper access control.
-- The project emphasizes real-world application of database design
-- and normalization, reflecting a comprehensive approach to handling large, complex data.

-- ====================================================
-- Step 1: Create the Database and Select It
-- ====================================================
CREATE DATABASE IF NOT EXISTS BookStore;
USE BookStore;

-- ====================================================
-- Step 2: Create Reference Tables
-- These tables hold essential data to be referenced by the main tables.
-- ====================================================

-- Table: book_language
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(100) NOT NULL
);

-- Table: publisher
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    publisher_address VARCHAR(255)
);

-- Table: author
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Table: address_status
CREATE TABLE address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_description VARCHAR(50) NOT NULL
);

-- Table: country
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- Table: shipping_method
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL,
    cost DECIMAL(10,2)
);

-- Table: order_status
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- ====================================================
-- Step 3: Create Core Domain Tables
-- ====================================================

-- Table: book
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher_id INT,
    language_id INT,
    publication_date DATE,
    price DECIMAL(10,2),
    CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    CONSTRAINT fk_book_language FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Table: book_author
-- This table implements the many-to-many relationship between books and authors.
CREATE TABLE book_author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    CONSTRAINT fk_ba_book FOREIGN KEY (book_id) REFERENCES book(book_id),
    CONSTRAINT fk_ba_author FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- ====================================================
-- Step 4: Create Customer and Address Tables
-- ====================================================

-- Table: customer
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(50)
);

-- Table: address
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    CONSTRAINT fk_address_country FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Table: customer_address
-- This table links customers to addresses and holds a status flag.
CREATE TABLE customer_address (
    customer_address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    address_status_id INT NOT NULL,
    CONSTRAINT fk_custaddr_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_custaddr_address FOREIGN KEY (address_id) REFERENCES address(address_id),
    CONSTRAINT fk_custaddr_status FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

-- ====================================================
-- Step 5: Create Order-Related Tables
-- ====================================================

-- Table: cust_order
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    shipping_method_id INT,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    order_status_id INT,
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_order_shipping FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    CONSTRAINT fk_order_status FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Table: order_line
-- This table lists books (items) within each order.
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2),
    CONSTRAINT fk_orderline_order FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    CONSTRAINT fk_orderline_book FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Table: order_history
-- Tracks the changes in order status over time.
CREATE TABLE order_history (
    order_history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    order_status_id INT NOT NULL,
    change_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    remark VARCHAR(255),
    CONSTRAINT fk_history_order FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    CONSTRAINT fk_history_status FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- ====================================================
-- Step 6: Set Up User Management (Security Example)
-- ====================================================

-- Create a read-only user for secure database access.
CREATE USER 'bookstore_read'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON BookStore.* TO 'bookstore_read'@'localhost';

-- Create an admin user with full privileges for management.
CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT ALL PRIVILEGES ON BookStore.* TO 'bookstore_admin'@'localhost';

-- Reload privileges to apply changes.
FLUSH PRIVILEGES;

-- End of bookstore.sql
