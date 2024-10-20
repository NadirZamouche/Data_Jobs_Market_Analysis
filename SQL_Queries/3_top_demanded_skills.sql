/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to the second query.
- Identify the top 5 in-demand skills for a data engineer.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/

WITH skill_job_count AS (
	SELECT
	    skill_id,
	    COUNT(*) AS total_jobs
	FROM
	    skills_job_dim
	INNER JOIN job_postings_fact
	    ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_title = 'Data Engineer'
	GROUP BY
	    skill_id
)

SELECT
     skill_table.skills skill,
     skill_job_count.total_jobs
FROM skills_dim skill_table
INNER JOIN skill_job_count
     ON skill_job_count.skill_id = skill_table.skill_id
ORDER BY
     skill_job_count.total_jobs DESC
LIMIT 5;

--Take 2:
SELECT
    skills,
    COUNT(skill_job_table.job_id) demand_count
FROM
    job_postings_fact job_table
INNER JOIN skills_job_dim skill_job_table
    ON job_table.job_id = skill_job_table.job_id
INNER JOIN skills_dim skill_table
    ON skill_job_table.skill_id = skill_table.skill_id
WHERE
    job_title = 'Data Engineer'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;