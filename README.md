# BookStore Database Project

## Overview

Welcome to my BookStore Database Project! This project is part of my coursework for Database Design & Programming with SQL. It demonstrates the design and implementation of a MySQL database that manages a bookstore’s data efficiently. The database covers essential information such as books, authors, publishers, customers, orders, shipping, and more.

Despite facing some challenges due to limited access to my usual computer setup, I ensured that the database is well-organized, fully normalized, and includes appropriate security measures with detailed user management.

## Personal Details

- **Name:** Joseph Onyango
- **Email:** jesuspromisesmedia@gmail.com
- **Submission Date:** 13/04/2025

## Project Contents

- **bookstore.sql:**  
  This SQL script contains all the commands required to create the BookStore database along with its tables, constraints, and user roles. It covers every aspect of the project—from creating a new database to setting up a secure and functional environment.

- **README.md:**  
  This file provides an explanation of the project, details about the database schema, and step-by-step instructions on how to set up and test the database.


## Database Structure

### Reference Tables

- **book_language:** Contains the list of languages that books can be in.
- **publisher:** Stores information about the book publishers.
- **author:** Contains details about the authors.
- **address_status:** Lists various statuses for customer addresses (e.g., current, old).
- **country:** Contains the names of countries for addresses.
- **shipping_method:** Lists available methods for shipping orders.
- **order_status:** Enumerates possible order statuses (e.g., pending, shipped, delivered).

### Core Tables

- **book:** Stores detailed information about each book.
- **book_author:** Implements the many-to-many relationship between books and authors.

### Customer and Address Management

- **customer:** Contains customer contact details.
- **address:** Stores customer address information.
- **customer_address:** Links customers to their addresses, along with a status indicator.

### Order-Related Tables

- **cust_order:** Records details about customer orders.
- **order_line:** Lists the books included in each order.
- **order_history:** Tracks the historical changes of order statuses.

### Security & User Management

The SQL script also sets up two user roles:
- **bookstore_read:** A read-only user for secure data access.
- **bookstore_admin:** An administrative user with full privileges to manage the database.

## Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone <your-repository-url>
   cd <repository-folder>
