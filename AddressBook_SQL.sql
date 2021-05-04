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

mysql>