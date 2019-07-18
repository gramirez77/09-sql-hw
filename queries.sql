-- NAME
--    queries.sql
-- 
-- DESCRIPTION
--    List of queries to perform data analysis on Pewlett Hackard employees database.
-- 
-- AUTHOR
--    Gilberto Ramirez (gramirez77@gmail.com)
--    v1.0: July 18, 2019
-- 
-- REMARKS
--    This is the ninth week homework for the UNC Data Analytics Boot Camp.
--    Used SQL style guide by Simon Holywell (https://www.sqlstyle.guide/).

-- 1) List the following details of each employee: 
--    employee number, last name, first name, gender, and salary.
SELECT e.emp_no AS emp_no, last_name, first_name, gender, salary
  FROM employees AS e
       INNER JOIN salaries AS s
       ON e.emp_no = s.emp_no;

-- 2) List employees who were hired in 1986.
SELECT emp_no, last_name, first_name, gender, hire_date
  FROM employees
 WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3) List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, 
--    last name, first name, and start and end employment dates.
SELECT d.dept_no, dept_name, e.emp_no, last_name, first_name, from_date, to_date
  FROM dept_manager AS dm
       INNER JOIN employees AS e
	   ON dm.emp_no = e.emp_no
	   
	   INNER JOIN departments AS d
	   ON dm.dept_no = d.dept_no;

-- 4) List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
  FROM dept_emp AS de
       INNER JOIN employees AS e
       ON de.emp_no = e.emp_no
	   
	   INNER JOIN departments AS d
	   ON de.dept_no = d.dept_no;

-- 5) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no, last_name, first_name, gender
  FROM employees
 WHERE first_name = 'Hercules'
   AND last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their
--    employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
  FROM dept_emp AS de
       INNER JOIN employees AS e
       ON de.emp_no = e.emp_no
	   
	   INNER JOIN departments AS d
	   ON de.dept_no = d.dept_no
 WHERE dept_name = 'Sales';

-- 7) List all employees in the Sales and Development departments, including their 
--    employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
  FROM dept_emp AS de
       INNER JOIN employees AS e
       ON de.emp_no = e.emp_no
	   
	   INNER JOIN departments AS d
	   ON de.dept_no = d.dept_no
 WHERE dept_name = 'Sales'
    OR dept_name = 'Development';

-- 8) In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS frequency
  FROM employees
 GROUP BY last_name
 ORDER BY frequency DESC, last_name ASC;

-- Epilogue
SELECT *
  FROM employees
 WHERE emp_no = 499942;