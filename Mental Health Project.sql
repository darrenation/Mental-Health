-- Count the number of records in the data
SELECT COUNT(*) AS totalrecords
FROM students;


-- Count the number of international and domestic students
SELECT inter_dom, COUNT(inter_dom) AS xount_inter_dom
FROM public.students
GROUP BY inter_dom;


-- Query the data to see all records where inter_dom is neither 'Dom' nor 'Inter'
SELECT *
FROM public.students
WHERE inter_dom NOT LIKE 'Dom' AND inter_dom NOT LIKE 'Inter';


-- See what Region international students are 
SELECT region, COUNT(inter_dom) as count_inter_dom
FROM public.students
WHERE inter_dom = 'Inter'
GROUP BY region;


-- Find out the basic summary statistics of the diagnostic tests for all 
SELECT MIN(ToDep) AS min_phq,
	MAX(ToDep) AS max_phq,
	ROUND(AVG(ToDep), 2) AS avg_phq,
	MIN(ToSC) AS min_scs,
	MAX(ToSC) AS max_scs,
	ROUND(AVG(ToSC), 2) AS avg_scs,
	MIN(ToAS) AS min_as,
	MAX(ToAS) AS max_as,
	ROUND(AVG(ToAS), 2) AS avg_as
FROM students;


-- Statistics of each student group on one table, remembering to avoid the empty 
SELECT inter_dom,
	MIN(ToDep) AS min_phq,
	MAX(ToDep) AS max_phq,
	ROUND(AVG(ToDep), 2) AS avg_phq,
	MIN(ToSC) AS min_scs,
	MAX(ToSC) AS max_scs,
	ROUND(AVG(ToSC), 2) AS avg_scs,
	MIN(ToAS) AS min_as,
	MAX(ToAS) AS max_as,
	ROUND(AVG(ToAS), 2) AS avg_as
FROM students
WHERE inter_dom IN ('Inter', 'Dom')
GROUP BY inter_dom;


-- Average scores for each age group of international students, and view them in order
SELECT age,
ROUND(AVG(todep), 2) AS avg_phq,
ROUND(AVG(tosc), 2) AS avg_scs,
ROUND(AVG(toas), 2) AS avg_as
FROM public.students
WHERE inter_dom = 'Inter'
GROUP BY age
ORDER BY age;