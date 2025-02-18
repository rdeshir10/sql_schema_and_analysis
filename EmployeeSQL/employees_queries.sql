select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;

-- Q1 List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no AS "Employee Number", 
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   e.sex,
	   s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- Q2 List the first name, last name, and hire date for the employees who were hired in 1986

-- USing to_Date function 
SELECT first_name AS "First Name",
	   last_name AS "Last Name",
	   TO_DATE(hire_date, 'MM/DD/YYYY') as "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM TO_DATE(hire_date, 'MM/DD/YYYY')) = 1986 
ORDER BY hire_date;

-- As VARCHAR
SELECT first_name AS "First Name",
	   last_name AS "Last Name",
	   hire_date AS "Hire Date"
FROM employees
Where hire_date like '%1986';

-- Q3 List the manager of each department along with their department number, department name, employee number, last name, and first name 

SELECT dm.dept_no AS "Department Number",
	   d.dept_name AS "Department Name",
	   e.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name"
FROM employees AS e
INNER JOIN dept_manager AS dm 
ON e.emp_no = dm.emp_no
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no;

-- Q4 List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT de.dept_no AS "Department Number",
	   e.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no;

-- Q5 List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 

SELECT first_name AS "First Name",
	   last_name AS "Last Name",
	   sex As "Sex"
FROM employees
WHERE first_name = 'Hercules'
	AND last_name like 'B%';

-- Q6 List each employee in the Sales department, including their employee number, last name, and first name

SELECT e.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name"
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- Q7 List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT e.emp_no AS "Employee Number",
	   e.last_name AS "Last Name",
	   e.first_name AS "First Name",
	   d.dept_name AS "Department Name"
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
	OR d.dept_name = 'Development';

-- Q8 List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name

SELECT last_name as "Last name",
	   COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

























