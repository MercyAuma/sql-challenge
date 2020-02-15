/*List the following details of each employee: 
employee number, last name, first name, gender, and salary.*/

select 
employees.emp_no,
employees.last_name,
employees.first_name,
employees.gender,
salaries.salary
from public.employees
join public.salaries on employees.emp_no=salaries.emp_no

/*List employees who were hired in 1986.*/
select 
employees.emp_no,
employees.last_name,
employees.first_name,
employees.gender
,hire_date
from public.employees
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31'

/*List the manager of each department with the following information:
department number, department name, the manager's employee number, last name,
first name, and start and end employment dates.*/

SELECT  "Dept_manager".dept_no,
departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name,
"Dept_manager".from_date,
"Dept_manager".to_date
from public."Dept_manager"
join public.employees on employees.emp_no="Dept_manager".emp_no
join public.departments on "Dept_manager".dept_no = departments.dept_no 

/*List the department of each employee with the following information: 
employee number, last name, first name, and department name. */

select distinct
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from public.departments
join public.dept_emp 
on dept_emp.dept_no=departments.dept_no
join public.employees 
on employees.emp_no = dept_emp.emp_no
and dept_emp.dept_no=departments.dept_no
--and dept_emp.from_date=employees.hire_date

/*List all employees whose first name is "Hercules" and last names begin with "B."*/

select *
from public.employees
where employees.first_name='Hercules'
and employees.last_name like 'B%'


/*
List all employees in the Sales department,
including their employee number, last name, first name, and department name.
*/

select 
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from public.employees
inner join public.dept_emp 
on employees.emp_no = dept_emp.emp_no
join public.departments
on dept_emp.dept_no=departments.dept_no
and employees.emp_no = dept_emp.emp_no
where dept_name='Sales'

/*List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.*/
select 
employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from public.employees
inner join public.dept_emp 
on employees.emp_no = dept_emp.emp_no
join public.departments
on dept_emp.dept_no=departments.dept_no
and employees.emp_no = dept_emp.emp_no
where dept_name in ('Sales','Development')



/*In descending order, list the frequency count of employee last names, i.e.,
how many employees share each last name.*/

select 
employees.last_name,
count(*)
from public.employees
group by employees.last_name
order by count(*) desc

















