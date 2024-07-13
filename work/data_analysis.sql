-- Run tables.sql first

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no AS empnum, e.last_name AS lastname, e.first_name AS firstname, e.sex AS sex, s.Salary
FROM public.employees e INNER JOIN public.salaries s
ON e.emp_no = s.emp_no
ORDER BY salary desc

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM public.employees
WHERE date_part('year', hire_date) = 1986

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM public.dept_manager dm 
INNER JOIN public.employees e ON dm.emp_no = e.emp_no
INNER JOIN public.departments d ON dm.dept_no = d.dept_no


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public.employees e     
INNER JOIN public.dept_emp de ON e.emp_no = de.emp_no
INNER JOIN public.departments d ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM public.employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM public.employees e
JOIN public.dept_emp de ON e.emp_no = de.emp_no
JOIN public.departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM public.employees e
JOIN public.dept_emp de ON e.emp_no = de.emp_no
JOIN public.departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM public.employees
GROUP BY last_name
ORDER BY frequency DESC;