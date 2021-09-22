-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
Select emp.emp_no as "Employee Number", emp.first_name as "First Name", emp.last_name as "Last Name", emp.sex, sal.salary
From Employees emp
Join Salaries sal on emp.emp_no = sal.emp_no
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
Select emp.first_name as "First Name", emp.last_name as "Last Name", emp.hire_date as "Hire Date"
From employees emp
Where date_part('year', emp.hire_date) = 1986
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Select dept.dept_no as "Department Number", dept.dept_name as "Department Name", emp.emp_no as "Employee Number", emp.first_name as "First Name", emp.last_name as "Last Name", titles.title as "Title"
From employees emp
Join dept_manager dmgr on dmgr.emp_no = emp.emp_no
Join departments dept on dept.dept_no = dmgr.dept_no
Join titles on titles.title_id = emp.emp_title_id
Order By emp.last_name
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
Select emp.emp_no as "Employee Number", emp.first_name as "First Name", emp.last_name as "Last Name", dept.dept_name as "Department Name"
From employees emp
Join dept_manager dmgr on dmgr.emp_no = emp.emp_no
Join departments dept on dept.dept_no = dmgr.dept_no
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select emp.first_name as "First Name", emp.last_name as "Last Name", emp.sex
From employees emp
Where emp.first_name = 'Hercules' And emp.last_name Like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select emp.emp_no as "Employee Number", emp.first_name as "First Name", emp.last_name as "Last Name", dept.dept_name as "Department Name"
From employees emp
Join dept_emp on emp.emp_no = dept_emp.emp_no
Join departments dept on dept.dept_no = dept_emp.dept_no
Where dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select emp.emp_no as "Employee Number", emp.first_name as "First Name", emp.last_name as "Last Name", dept.dept_name as "Department Name"
From employees emp
Join dept_emp on emp.emp_no = dept_emp.emp_no
Join departments dept on dept.dept_no = dept_emp.dept_no
Where dept_name IN ('Sales', 'Development')
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select Count(*), last_name
From Employees
Group By last_name 
Order By 1 desc

-- Search employee Number
Select emp.emp_no as "Employee Number", emp.first_name as "First Name", emp.last_name as "Last Name", dept.dept_name as "Department Name"
From employees emp
Join dept_emp on emp.emp_no = dept_emp.emp_no
Join departments dept on dept.dept_no = dept_emp.dept_no
Where emp.emp_no = 499942
