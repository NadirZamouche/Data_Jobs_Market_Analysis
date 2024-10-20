/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Engineer positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Engineers and
    help identify the most financially rewarding skills to aquire or to improve.
*/

WITH avg_salary AS (
	SELECT
	    skill_id,
	    ROUND(AVG(job_table.salary_year_avg),0) salary_avg
	FROM
	    skills_job_dim
	INNER JOIN job_postings_fact job_table
	    ON job_table.job_id = skills_job_dim.job_id
    WHERE
        job_title = 'Data Engineer'
        AND salary_year_avg IS NOT NULL
	GROUP BY
	    skill_id
)

SELECT
    skill_table.skills,
    avg_salary.salary_avg
FROM skills_dim skill_table
INNER JOIN avg_salary
    ON avg_salary.skill_id = skill_table.skill_id
ORDER BY
    salary_avg DESC
LIMIT 25;

--Take 2:
SELECT
    skills,
    ROUND(AVG(job_table.salary_year_avg),0) salary_avg
FROM
    job_postings_fact job_table
INNER JOIN skills_job_dim skill_job_table
    ON job_table.job_id = skill_job_table.job_id
INNER JOIN skills_dim skill_table
    ON skill_job_table.skill_id = skill_table.skill_id
WHERE
    job_title = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    salary_avg DESC
LIMIT 25;