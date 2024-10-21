# Introduction
🚀 Dive into the data job market! 📊 Focusing on data engineer roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data engineering.

🔍 SQL queries? Check them out here: [SQL_Queries folder](/SQL_Queries/)

# Background
Driven by a quest to navigate the data engineer job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining other work to find optimal jobs.

Data hails from [SQL Course](https://lukebarousse.com/sql), It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data engineer jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data engineering?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learnN

# Tools I used
 For my deep dive into the data engineer job market, I harnessed the power of several key tools:

 - **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
 - **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
 - **Visual Studio Code**: My go-to for database management and executing SQL queries.
 - **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of data engineer job market. Here's how I approached each question:

### 1. Top paying Data Engineer Jobs
To identify the highest-paying roles, I filtered data engineer positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

```SQL
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
```
Here are the breakdown of the top data engineer jobs in 2023:
- **Wide Salary Range:** Top 10 paying data engineer roles span from $187,000 to $325,000, indicating significant salary potential in the field.
- **Diverse Employers:** There are multiple companies offering high salaries, showing a broad interest across different industries.



# What I learned

# Conclusion
