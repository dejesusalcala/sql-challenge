-- Database: sql-challenge

-- Below are some queries for our database

-- Q1.) List the employee number, last name, first name, sex, and salary of each employee.

select a.emp_no,a.last_name, a.first_name, a.sex, b.salary
	from employees as a 
	inner join salaries as B
	on (a.emp_no = b.emp_no) 

-- Q2.) List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, last_name, hire_date 
  from employees 
  where hire_date >= '1986-01-01' 
       and hire_date < '1987-01-01';

-- Q3.) List the manager of each department along with their department number, department name, employee number, last name, and first name.

select a.dept_no, b.dept_name,c.emp_no,c.last_name,c.first_name 
	from dept_manager as a
	inner join departments as b
	on (a.dept_no = b. dept_no)
	inner join employees as c
	on (a.emp_no = c.emp_no)

-- Q4.) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select b.emp_no, c.last_name, c.first_name, a.dept_name 
	from departments as a
	inner join dept_emp b
	on (a.dept_no = b.dept_no)
	inner join employees as c
	on (b.emp_no = c.emp_no)

-- Q5.) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex 
	from employees 
	where first_name = 'Hercules'
	and last_name like 'B%'

-- Q6.) List each employee in the Sales department, including their employee number, last name, and first name.

select * from departments
select * from employees
select * from dept_emp

---- 1st subqeury, get dept_no from employees in sales

select dept_no 
	from departments 
	where dept_name = 'Sales'

---- 2nd subquery, get emp_no from employees in sales

select emp_no 
	from dept_emp
	where dept_no in (
		select dept_no 
			from departments 
			where dept_name = 'Sales'
	)

---- Employees from sales

select emp_no, first_name, last_name 
	from employees
	where emp_no in (
		select emp_no 
			from dept_emp
			where dept_no in (
				select dept_no 
					from departments 
					where dept_name = 'Sales')
	)

-- Q7.) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

---- All the employees from sales and development 

select * 
	from departments as a
	inner join dept_emp as b
	on (a.dept_no = b.dept_no)
	where a.dept_no in (
		select dept_no 
			from departments
			where dept_name = 'Sales' or dept_name = 'Development'
	)
	
	
select c.last_name, c.first_name, b.emp_no, a.dept_name
	from departments as a
	inner join dept_emp as b
	on (a.dept_no = b.dept_no)
	inner join employees as c
	on (b.emp_no = c.emp_no)
	where a.dept_name = 'Sales' or a.dept_name = 'Development'

-- Q8.) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select count(last_name) as count, last_name 
	from employees
	group by last_name
	order by count desc