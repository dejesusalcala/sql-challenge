-- Database: sql-challenge

-- Here we create the tables for our database

-- 1.) Create departments table

create table departments (
	dept_no varchar(50) primary key,
	dept_name varchar(50)
);

-- 2.) Create titles table

create table titles (
	title_id varchar(50) primary key,
	title varchar(50)
);

-- 3.) Create employees table

create table employees (
	emp_no varchar(50) primary key,
	emp_title_id varchar(50),
	birth_date date,
	first_name varchar(50),
	last_name varchar(50),
	sex varchar(50),
	hire_date date,
	foreign key (emp_title_id) references titles(title_id)
);

-- 4.) Create dept_emp table

create table dept_emp (
	emp_no varchar(50),
	dept_no varchar(50),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

-- 5.) Create dept_manager table

create table dept_manager (
	dept_no varchar(50),
	emp_no varchar(50),
	foreign key (dept_no) references departments(dept_no),
	foreign key	(emp_no) references employees(emp_no)
);

-- 6.) Create salaries table

create table salaries (
	emp_no varchar(50),
	salary real,
	foreign key (emp_no) references employees(emp_no)
);