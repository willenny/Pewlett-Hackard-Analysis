-- deliverable 1

SELECT emp_no, first_name, last_name
FROM employees;

select title, from_date, to_date
from titles;

SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

-- number of employees by their most recent job title who are about to retire
select count(title), title
into retiring_titles
from unique_titles
group by title
order by count(title) desc;

-- deliverable 2

-- mentorship eligibility table
SELECT distinct on (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
and (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by emp_no ASC;

deliverable 3

-- current exmployees that are not eligible to retire
SELECT 
e.emp_no,
e.first_name,
e.last_name,
ti.title,
de.to_date
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
where (e.birth_date between '1965-01-01' and '9999-01-01') -- born after retirement eligibility
AND (e.hire_date between '1988-01-01' and '9999-01-01') -- hired after retirement eligiblity
and (de.to_date = ('9999-01-01')) -- currently employeed
-- and ti.title contains "Engineer" or "Staff" -- this isn't right but I can't figure it out
group by e.emp_no, de.to_date, ti.title;
