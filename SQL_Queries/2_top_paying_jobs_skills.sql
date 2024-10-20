/*
Question: What skills are required for the top-paying data engineer jobs?
- Use the top 10 highest-paying Data Engineer jobs from the first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skiils,
    helping job seekeers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        name company,
        salary_year_avg
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
    LIMIT 10
)

SELECT
    job_title,
    company,
    salary_year_avg,
    skill_table.skills skill
FROM
    top_paying_jobs
INNER JOIN skills_job_dim skills_job_table
    ON top_paying_jobs.job_id = skills_job_table.job_id
INNER JOIN skills_dim skill_table
    ON skills_job_table.skill_id = skill_table.skill_id
ORDER BY
        salary_year_avg DESC;