Deliverable 1 

-- Retirees by title 
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as tt
ON e.emp_no = tt.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

SELECT * FROM retirement_titles;

-- Remove duplicate titles 
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, 
	rt.first_name, 
	rt.last_name,
	rt.title 
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

-- Employees by most recent job title
SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles 
FROM unique_titles as ut 
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

Deliverable 2

-- Mentorship eligibility 
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees as e
LEFT OUTER JOIN dept_employees as de 
ON (e.emp_no = de.emp_no)
LEFT OUTER JOIN titles as tt 
ON (e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility;