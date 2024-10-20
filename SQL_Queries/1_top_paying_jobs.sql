/*
Question: What are the top-paying data engineer jobs?
- Identify the top 10 highest-paying Data Engineer roles that are available remotely.
- Focuses on Job postings with specifies salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Engineers as well as from which company.
*/

SELECT
    job_title,
    name company,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact job_table
LEFT JOIN company_dim company_table
    ON job_table.company_id = company_table.company_id
WHERE
    job_title = 'Data Engineer'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;