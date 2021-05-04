Enter password: *****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 5.7.19-log MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

//UC1 - Ability to create a Address Book Service DB

mysql> CREATE DATABASE address_book_service;
Query OK, 1 row affected (0.03 sec)

mysql> SHOW DATABASES;
+----------------------+
| Database             |
+----------------------+
| information_schema   |
| address_book_service |
| employee             |
| employee1            |
| mysql                |
| payroll_service      |
| performance_schema   |
| sakila               |
| sys                  |
| user                 |
| users                |
| world                |
+----------------------+
12 rows in set (0.00 sec)

//UC-2 Create Table

mysql> use address_book_service
Database changed
mysql> CREATE TABLE address_book_table (
    -> firstName varchar(20) NOT NULL,
    -> lastName varchar(20) NOT NULL,
    -> address varchar(100) NOT NULL,
    -> city varchar(20) NOT NULL,
    -> state varchar(20) NOT NULL,
    -> zip int NOT NULL,
    -> phoneNumber int NOT NULL,
    -> email varchar(50) NOT NULL PRIMARY KEY
    -> );
Query OK, 0 rows affected (0.36 sec)

mysql> DESCRIBE address_book_table;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(20)  | NO   |     | NULL    |       |
| lastName    | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(20)  | NO   |     | NULL    |       |
| state       | varchar(20)  | NO   |     | NULL    |       |
| zip         | int(11)      | NO   |     | NULL    |       |
| phoneNumber | int(11)      | NO   |     | NULL    |       |
| email       | varchar(50)  | NO   | PRI | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

//UC-3 Insert Values

mysql> ALTER TABLE address_book_table
    -> MODIFY COLUMN phoneNumber varchar(12) NOT NULL;
Query OK, 0 rows affected (0.47 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE address_book_table;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| firstName   | varchar(20)  | NO   |     | NULL    |       |
| lastName    | varchar(20)  | NO   |     | NULL    |       |
| address     | varchar(100) | NO   |     | NULL    |       |
| city        | varchar(20)  | NO   |     | NULL    |       |
| state       | varchar(20)  | NO   |     | NULL    |       |
| zip         | int(11)      | NO   |     | NULL    |       |
| phoneNumber | varchar(12)  | NO   |     | NULL    |       |
| email       | varchar(50)  | NO   | PRI | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> INSERT INTO address_book_table VALUES
    -> ('Mohit','Shah','MB 116','Burhanpur','Madhya Pradesh',450445,9944556611,'mohitshah@gmail.com'),
    -> ('Tanay','Agrawal','Adarsh Colony','Pune','Maharashtra',411048,7878569123,'tanayagrawal@gmail.com'),
    -> ('Darshan','Patil','Andheri East','Mumbai','Maharashtra',400047,7512367456,'darshanpatil@gmail.com');
Query OK, 3 rows affected (0.08 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book_table;
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
| firstName | lastName | address       | city      | state          | zip    | phoneNumber | email                  |
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
| Darshan   | Patil    | Andheri East  | Mumbai    | Maharashtra    | 400047 | 7512367456  | darshanpatil@gmail.com |
| Mohit     | Shah     | MB 116        | Burhanpur | Madhya Pradesh | 450445 | 9944556611  | mohitshah@gmail.com    |
| Tanay     | Agrawal  | Adarsh Colony | Pune      | Maharashtra    | 411048 | 7878569123  | tanayagrawal@gmail.com |
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
3 rows in set (0.00 sec)

//UC-4 Update/Edit details using name

mysql> SELECT * FROM address_book_table;
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
| firstName | lastName | address       | city      | state          | zip    | phoneNumber | email                  |
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
| Darshan   | Patil    | Andheri East  | Mumbai    | Maharashtra    | 400047 | 7512367456  | darshanpatil@gmail.com |
| Mohit     | Shah     | MB 116        | Burhanpur | Madhya Pradesh | 450445 | 9944556611  | mohitshah@gmail.com    |
| Tanay     | Agrawal  | Adarsh Colony | Pune      | Maharashtra    | 411048 | 7878569123  | tanayagrawal@gmail.com |
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
3 rows in set (0.00 sec)

mysql> UPDATE address_book_table
    -> SET address = 'Hinjewadi', city = 'Pune', zip = 411004
    -> WHERE firstName = 'Darshan';
Query OK, 1 row affected (0.09 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM address_book_table;
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
| firstName | lastName | address       | city      | state          | zip    | phoneNumber | email                  |
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
| Darshan   | Patil    | Hinjewadi     | Pune      | Maharashtra    | 411004 | 7512367456  | darshanpatil@gmail.com |
| Mohit     | Shah     | MB 116        | Burhanpur | Madhya Pradesh | 450445 | 9944556611  | mohitshah@gmail.com    |
| Tanay     | Agrawal  | Adarsh Colony | Pune      | Maharashtra    | 411048 | 7878569123  | tanayagrawal@gmail.com |
+-----------+----------+---------------+-----------+----------------+--------+-------------+------------------------+
3 rows in set (0.00 sec)

//UC-5 Delete using name

mysql> DELETE FROM address_book_table WHERE firstName = 'Tanay' && lastName = 'Agrawal';
Query OK, 1 row affected (0.14 sec)

mysql> SELECT * FROM address_book_table;
+-----------+----------+-----------+-----------+----------------+--------+-------------+------------------------+
| firstName | lastName | address   | city      | state          | zip    | phoneNumber | email                  |
+-----------+----------+-----------+-----------+----------------+--------+-------------+------------------------+
| Darshan   | Patil    | Hinjewadi | Pune      | Maharashtra    | 411004 | 7512367456  | darshanpatil@gmail.com |
| Mohit     | Shah     | MB 116    | Burhanpur | Madhya Pradesh | 450445 | 9944556611  | mohitshah@gmail.com    |
+-----------+----------+-----------+-----------+----------------+--------+-------------+------------------------+
2 rows in set (0.00 sec)

//UC-6 Ability to Retrieve Person belonging to a City or State from the Address Book

mysql> SELECT * FROM address_book_table WHERE city = 'Burhanpur';
+-----------+----------+---------+-----------+----------------+--------+-------------+---------------------+
| firstName | lastName | address | city      | state          | zip    | phoneNumber | email               |
+-----------+----------+---------+-----------+----------------+--------+-------------+---------------------+
| Mohit     | Shah     | MB 116  | Burhanpur | Madhya Pradesh | 450445 | 9944556611  | mohitshah@gmail.com |
+-----------+----------+---------+-----------+----------------+--------+-------------+---------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM address_book_table WHERE state = 'Maharashtra';
+-----------+----------+-----------+------+-------------+--------+-------------+------------------------+
| firstName | lastName | address   | city | state       | zip    | phoneNumber | email                  |
+-----------+----------+-----------+------+-------------+--------+-------------+------------------------+
| Darshan   | Patil    | Hinjewadi | Pune | Maharashtra | 411004 | 7512367456  | darshanpatil@gmail.com |
+-----------+----------+-----------+------+-------------+--------+-------------+------------------------+
1 row in set (0.00 sec)

//UC-7 Ability to understand the size of address book by City and State

mysql> SELECT COUNT(firstName) FROM address_book_table WHERE city = 'Burhanpur';
+------------------+
| COUNT(firstName) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)

mysql> INSERT INTO address_book_table VALUES
    -> ('Ankit','Yadav','Rajpura','Burhanpur','Madhya Pradesh',450445,9564542151,'ankityadav@gmail.com'),
    -> ('Krishna','Patel','Station Road','Burhanpur','Madhya Pradesh',450445,7565452535,'krishnapatel@gmail.com');
Query OK, 2 rows affected (0.06 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM address_book_table;
+-----------+----------+--------------+-----------+----------------+--------+-------------+------------------------+
| firstName | lastName | address      | city      | state          | zip    | phoneNumber | email                  |
+-----------+----------+--------------+-----------+----------------+--------+-------------+------------------------+
| Ankit     | Yadav    | Rajpura      | Burhanpur | Madhya Pradesh | 450445 | 9564542151  | ankityadav@gmail.com   |
| Darshan   | Patil    | Hinjewadi    | Pune      | Maharashtra    | 411004 | 7512367456  | darshanpatil@gmail.com |
| Krishna   | Patel    | Station Road | Burhanpur | Madhya Pradesh | 450445 | 7565452535  | krishnapatel@gmail.com |
| Mohit     | Shah     | MB 116       | Burhanpur | Madhya Pradesh | 450445 | 9944556611  | mohitshah@gmail.com    |
+-----------+----------+--------------+-----------+----------------+--------+-------------+------------------------+
4 rows in set (0.00 sec)

mysql> SELECT COUNT(firstName) FROM address_book_table WHERE city = 'Burhanpur';
+------------------+
| COUNT(firstName) |
+------------------+
|                3 |
+------------------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(firstName) FROM address_book_table WHERE state = 'Maharashtra';
+------------------+
| COUNT(firstName) |
+------------------+
|                1 |
+------------------+
1 row in set (0.00 sec)

mysql>