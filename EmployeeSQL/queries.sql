SELECT *
FROM employees

SELECT *
FROM titles

SELECT *
FROM salaries

SELECT *
FROM dept_manager

SELECT *
FROM dept_employee

SELECT *
FROM departments

--1]
--List the following details of each employee: 
--employee number, last name, first name, gender, and salary.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees emp
JOIN salaries as sal 
ON emp.emp_no = sal.emp_no

--2]
--List employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date like '1986%'

--3]
--List the manager of each department with the following 
--information: department number, department name, the 
--manager's employee number, last name, first name, and 
--start and end employment dates.

SELECT man.dept_no, dep.dept_name, man.emp_no, 
emp.first_name,emp.last_name,depEmp.from_date,depEmp.to_date
FROM dept_manager as man
JOIN departments as dep
ON dep.dept_no = man.dept_no
JOIN employees as emp
ON emp.emp_no = man.emp_no
JOIN dept_employee as depEmp
ON depEmp.emp_no = man.emp_no

--4]
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT deptEMP.emp_no, emp.last_name,emp.first_name, dep.dept_name
FROM employees as emp 
JOIN dept_employee as deptEMP
ON deptEMP.emp_no = emp.emp_no
JOIN departments as dep
ON dep.dept_no = deptEMP.dept_no


--5]
--List all employees whose first name is "Hercules" and
--last names begin with "B."

SELECT emp.first_name, emp.last_name
FROM employees as emp
WHERE emp.first_name = 'Hercules' AND emp.last_name like 'B%'

--6]
--List all employees in the Sales department, 
--including their employee number, last name, first name, 
--and department name.

SELECT deptEMP.emp_no, emp.last_name,emp.first_name,dep.dept_name
FROM dept_employee as deptEMP
JOIN employees as emp
ON emp.emp_no = deptEMP.emp_no
JOIN departments as dep
ON dep.dept_name = 'Sales'

--7]
--List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.

SELECT deptEMP.emp_no, emp.last_name,emp.first_name,dep.dept_name
FROM dept_employee as deptEMP
JOIN employees as emp
ON emp.emp_no = deptEMP.emp_no
JOIN departments as dep
ON dep.dept_name IN ('Sales', 'Development') 

--8]
--In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) as lastNCcount
FROM employees
GROUP BY last_name
ORDER BY lastNCcount DESC


