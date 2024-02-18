DROP DATABASE IF EXISTS lbm;
CREATE DATABASE IF NOT EXISTS lbm;
DROP TABLE IF EXISTS user_login;
USE lbm;
CREATE TABLE IF NOT EXISTS user_login
(
user_id INT PRIMARY KEY,
user_password VARCHAR(100),
first_name VARCHAR(100),
last_name  VARCHAR(100),
sign_up_on DATE,
email_id VARCHAR(100)
);
DROP TABLE IF EXISTS publisher;
CREATE TABLE IF NOT EXISTS publisher(
publisher_id INT PRIMARY KEY,
distributor CHAR
);
DROP TABLE IF EXISTS author;
CREATE TABLE IF NOT EXISTS author(
author_id INT PRIMARY KEY,
first_name VARCHAR(100),
last_name  VARCHAR(100),
publication_count int
);
DROP TABLE IF EXISTS books;
CREATE TABLE IF NOT EXISTS books(
book_id INT PRIMARY KEY,
book_code INT,
book_name VARCHAR(100),
author_id INT REFERENCES author(author_id),
publisher_id INT REFERENCES publisher(publisher_id),
book_version CHAR,
release_date DATE,
available_from DATE,
is_available BOOLEAN
);
DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS staff(
staff_id INT PRIMARY KEY,
first_name VARCHAR(100),
last_name  VARCHAR(100),
staff_role VARCHAR(100),
start_date DATE,
last_date DATE,
is_active BOOLEAN,
work_shift_start TIME,
work_shift_end TIME
);
DROP TABLE IF EXISTS readers;
CREATE TABLE IF NOT EXISTS readers(
reader_id INT PRIMARY KEY,
first_name VARCHAR(100),
last_name  VARCHAR(100),
registered_on DATE,
books_issued_total INT,
books_issued_current INT,
books_renewed INT,
is_issued BOOLEAN,
last_issued_date DATE,
total_fine FLOAT,
current_fine FLOAT
);
DROP TABLE IF EXISTS books_issue;
CREATE TABLE IF NOT EXISTS books_issue(
issue_id INT PRIMARY KEY,
book_id INT REFERENCES books (book_id),
issued_to CHAR REFERENCES readers (reader_id),
issue_on DATE,
return_on DATE,
current_fine FLOAT,
fine_paid BOOLEAN,
payment_transaction_id VARCHAR(100)
);
DROP TABLE IF EXISTS setting;
CREATE TABLE IF NOT EXISTS setting(
book_issue_count_per_reader INT,
fine_per_day FLOAT,
book_return_in_days INT
);
ñ