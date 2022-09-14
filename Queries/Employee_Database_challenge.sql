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