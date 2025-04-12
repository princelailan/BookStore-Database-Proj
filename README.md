# BookStore Database Project

## Overview

Welcome to our **BookStore Database Project**!  
This project was developed as part of our coursework for *Database Design & Programming with SQL*. It showcases the design and implementation of a well-structured MySQL database system tailored to manage a bookstore’s data effectively and securely.

Despite limited access to full computing resources during development, we ensured the database remains fully normalized, secure, and easy to maintain.

## Team Members

- **Joseph Onyango** – [jesuspromisesmedia@gmail.com](mailto:jesuspromisesmedia@gmail.com)  
- **Christine Kabuga** – [kabugachristine4@gmail.com](mailto:kabugachristine4@gmail.com)  
- **Ednah Ochuoga** – [nyamusiednah9@gmail.com](mailto:nyamusiednah9@gmail.com)

## Submission Date

**13/04/2025**

## Project Contents

- **`bookstore.sql`**  
  Contains all SQL commands required to create the BookStore database, including:
  - Table definitions
  - Primary and foreign keys
  - Constraints
  - User roles
  - Security features

- **`README.md`**  
  This file. It explains the database design, its structure, and how to set it up and test it.

> Full project documentation:  
> [View on Google Docs](https://docs.google.com/document/d/1LrHW89zM8ebFLjzjkA41BQ5H5ognUlRw/edit?usp=drivesdk&ouid=109682943670040539169&rtpof=true&sd=true)

## Database Structure

### Reference Tables

- **`book_language`** – Languages in which books are available  
- **`publisher`** – Publisher information  
- **`author`** – Author details  
- **`address_status`** – Address status (e.g., current, old)  
- **`country`** – Country data for addresses  
- **`shipping_method`** – Methods of shipping  
- **`order_status`** – Stages in the order process

### Core Tables

- **`book`** – Detailed book information  
- **`book_author`** – Many-to-many relationship between books and authors

### Customer & Address Management

- **`customer`** – Customer contact details  
- **`address`** – Address details  
- **`customer_address`** – Mapping of customers to addresses with status

### Order-Related Tables

- **`cust_order`** – Customer orders  
- **`order_line`** – Items within an order  
- **`order_history`** – Tracks changes in order status over time

### Security & User Management

We implemented two user roles for access control:

- **`bookstore_read`** – Read-only user for viewing data  
- **`bookstore_admin`** – Admin user with full privileges

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone <your-repository-url>
   cd <repository-folder>
