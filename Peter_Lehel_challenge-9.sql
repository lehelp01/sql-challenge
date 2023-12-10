-- Module 9 Challenge

-- First we create tables
-- Departments table
CREATE TABLE departments (
	dept_no VARCHAR not null,
	dept_name VARCHAR not null
);

--dept_emp table
CREATE TABLE dept_emp (
	emp_no DEC NOT NULL,
	dept_no VARCHAR
);

--dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no DEC NOT NULL
);

--employees table
CREATE TABLE employees (
	emp_no DEC,
	emp_title VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date VARCHAR
);

--salaries table
CREATE TABLE salaries (
	emp_no DEC,
	salary DEC
);

--titles table
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

--check whether data import was successful for all tables
SELECT *
FROM departments;	
SELECT *
FROM dept_emp;
SELECT *
FROM dept_manager;
SELECT *
FROM employees;
SELECT *
FROM salaries;
SELECT *
FROM titles;


-- Data analysis
-- 1. List the employee number, last name, first name, sex, and salary of each employee 
-- it is done by performing an INNER JOIN on the employees & salaries tables
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT  employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM employees
	JOIN dept_manager ON 
	JOIN departments ON
		departments.dept_no=dept_manager.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	JOIN dept_emp ON
		dept_emp.emp_no=employees.emp_no
	JOIN departments ON
		departments.dept_no=dept_emp.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%' ;

--6. List each employee in the Sales department, including their employee number, last name, and first name 
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%' ;

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	JOIN dept_emp ON
		dept_emp.emp_no=employees.emp_no
	JOIN departments ON
		departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 
SELECT last_name, COUNT(last_name) AS "frequency count"
FROM employees
GROUP BY last_name
ORDER BY "frequency count" DESC;
