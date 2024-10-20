/*
Question: What are the most optimal skills to learn (aka it's in high demand and high-paying skill)?
- Identify skills in high demand and associated with high avergae salaries for Data Engineer roles.
- Concentrates on remote positions with specified salaries.
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights fo career development in data engineering.
*/

WITH skills_demand AS (
    SELECT
        skill_table.skill_id,
        skill_table.skills,
        COUNT(skill_job_table.job_id) demand_count
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
        skill_table.skill_id
), avg_salary AS (
    SELECT
        skill_table.skill_id,
        skill_table.skills,
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
        skill_table.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    salary_avg
FROM
    skills_demand
INNER JOIN avg_salary
    ON skills_demand.skill_id = avg_salary.skill_id
ORDER BY
    demand_count DESC,
    salary_avg DESC
LIMIT 25;

--rewriting this same query more concisely
SELECT
    skill_table.skill_id,
    skill_table.skills,
    COUNT(skill_job_table.job_id) demand_count,
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
    skill_table.skill_id
ORDER BY
    demand_count DESC,
    salary_avg DESC
LIMIT 25;