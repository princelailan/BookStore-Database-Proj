BookStore Database Project

Overview

Welcome to our BookStore Database Project! This project is part of our coursework for Database Design & Programming with SQL. It showcases the collaborative effort of our team in designing and implementing a fully normalized and secure MySQL database system to manage a bookstore’s operations efficiently.

The database handles essential components such as books, authors, publishers, customers, orders, shipping logistics, and user roles. Despite some challenges—including limited access to regular computer resources—we remained committed to producing a well-structured, functional, and secure system.

Team Members

Joseph Onyango – jesuspromisesmedia@gmail.com

Christine Kabuga – kabugachristine4@gmail.com

Ednah Ochuoga – nyamusiednah9@gmail.com


Submission Date

13/04/2025


Project Contents

bookstore.sql:
This SQL script contains all the commands needed to create the BookStore database, including table definitions, constraints, and user roles. It covers every step from initializing the database to configuring secure access and relationships.

README.md:
A detailed guide explaining the purpose and structure of the project. It includes insights into the database schema and instructions for setting up and testing the database environment.


For more information: Project Documentation

Database Structure

Reference Tables

book_language – Languages available for books.

publisher – Details of publishers.

author – Information on authors.

address_status – Status indicators for addresses (e.g., current, previous).

country – Country data for addresses.

shipping_method – Options for shipping orders.

order_status – Status stages for orders (e.g., pending, shipped, delivered).


Core Tables

book – Detailed book records.

book_author – Many-to-many link between books and authors.


Customer and Address Management

customer – Customer contact information.

address – Address records.

customer_address – Mapping between customers and their addresses, including status.


Order-Related Tables

cust_order – Customer order records.

order_line – Books included in each order.

order_history – Log of order status changes.


Security & User Management

We also set up role-based access control with two user roles:

bookstore_read – Read-only user with restricted data access.

bookstore_admin – Full administrative access for database management.


Setup Instructions

1. Clone the Repository:

git clone <your-repository-url>
cd <repository-folder>


2. Run the SQL Script:
Use MySQL Workbench or the MySQL CLI to execute bookstore.sql.


3. Review the README.md:
Follow the step-by-step setup and testing instructions provided in the README file.
