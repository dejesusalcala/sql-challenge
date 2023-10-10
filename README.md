# SQL Challenge

## Introduction

In this SQL challenge we go through the process of creating a database from a set of CSV files and then we query the database to answer some questions about the data. The database is created locally using *pgAdmin 4*, *PostgreSQL*, and the six CSV files that are in the *data* folder. We then analyze the database using *PostgreSQL*.

## Data Modeling

First, we start by creating an entity relationship diagram to help us identify the relationship between the tables that we have. We start by going through each of the CSV files to find which of the columns are primary keys and which columns are the foreign keys. For example, we noticed that the column `title_id` in the `titles` table is a primary key. This column `title_id` is referenced in the `employees` table as `emp_title_id` which would be the foreign key. This diagram was drawn out by hand and is in the *images* folder.

Next, we create the tables in *pgAdmin 4*. We start by naming each table and the columns of each table. Then, using our entity relationsip diagram we label the columns that are primary keys and foreign keys. After the tables are created we import each of the CSV files to the corresponding table. The code for the tables created is the file titled `table-schemata.sql` in the `code` folder.

## Data Analysis

The analysis performed on the database uses SQL queries. In particular, we use *inner joins*, *subqueries*, and *aggregation* to perform an analysis on the database.


