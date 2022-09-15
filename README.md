# Pewlett Hackard Analysis

## Overview
Pewlett Hackard has came to the staggering realization that they will be having many employees retiring in the near future. To plan for the future, they have asked Bobby and I to complete analysis on their retiring employees. The purpose of this analysis is read and interpret six CSV files using SQL to determine the number of retiring employees per title, and identify employees who are eligible to participate in the mentorship program. 

### Resources
- Data Source: departments.csv, dept_emp.csv, dept_managers.csv, employees.csv, salaries.csv, titles.csv
- Software: SQL, PostgreSQL, pdAdmin

## Results
### Entity Relationship Diagram
- Before incorporating the csv files in to SQL, it was essential to create a ERD (Entity Relationship Diagram) to visualize the relationship each csv file has with one another. This ERD allowed us to easily see the connections between files and understand the links in the primary keys between the tables. 

![EmployeeDB](https://user-images.githubusercontent.com/109091887/190501552-a9a8fe92-fc0a-4d30-b067-56003145202b.png)

### Retirement Titles
- By joining employees.csv and titles.csv, distinctly selecting employee numbers, then filtering by birth date, we are able to see a list of employees by employee number, name, and title. Using this information, we are able to count how many employees are leaving based on their job title. This will be useful in determining how many positions will Pewlett Hackard need to fill per job title.

![data-Module-7-Challenge-Image-3](https://user-images.githubusercontent.com/109091887/190503481-dbbd8405-3601-4801-a072-a1dabee650b5.png)

### Mentorship Program
- In order to prepare for the many vacancies that will occur, Pewlett Hackard decided to put a mentorship program into development. By joining the employees.csv, dept_emp.csv, and titles.csv, we are able to create a table that displays all employees that are eligible to partake in the mentorship program.

<img width="748" alt="data-Module-7-Challenge-Image-4" src="https://user-images.githubusercontent.com/109091887/190506601-8e9f4aea-9352-4224-ad19-fe734efe2a74.png">

- I feel that it is imporant to find the percent of current employees that are retiring soon. Using the following code, we are counting the amount of employees there are that are still employeed at Pewlett Hackard.
```
SELECT count (e.emp_no),
e.emp_no,
de.to_date
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')
group by e.emp_no, de.to_date;
```
Of the 240,124 current employees, 72,458 employees are retiring soon. This makes up about 30% of their workforce. Showing the retiring employees as a relative frequency will help emphasis the magnitude of how it will effect the company. I think it would be beneficial to expedite the mentorship program by identifying the eligible members that are interested as soon as possible. 

Pewlett Hackard is a large company boasting several thousand employees and it's been around for a long time. As baby boomers begin to retire at a rapid rate, Pewlett Hackard is to the future in two ways. First, it's offering retirement package for those who meet certain criteria. Second, it's starting to think about which positions will need to be filled in the near future. The number of upcoming retirements will leave thousands of job openings. What would happen to a company if they didn't look ahead and prepare for this many vacancies. Bobby is an up and coming HR analyist whose task is to perform employee research. Spefically, he needs to find answers to the folling questions; who will be retiring in the next few years and how many positions will Pewlett Hackard need to fill.? This analysis will help future=proof Pewlett Hackard by generating a list of all employees who are eligible for the retirement package. The employee data Bobby needs is only available in the form of six CSV files because Pewlet Hackard has been mainly using Excel and VBA
.to work with their data. But now they've finally decided to update their methods and instead use SQL, a definite upgrade considering the amount of data. Your task is to help Bobby build an employee database with SQL by applying your data modeling, engineering, and analysis skills. 

At Pewlett Hackard there are large number of employees that will soon be retiring. Working along side Bobby, we must determine the number of retiring employees per title, and identify employees who are eligible to particpate in a mentorship program. 

Now that Bobby has proven his SQL chops, his manager has given both of you two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, you’ll write a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.
