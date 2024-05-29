/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Scientist roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data science
*/

-- Identifies skills in high demand for Data Scientist roles
-- Use Query #3

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS no_of_skills,
    ROUND(AVG(salary_year_avg)) AS salary_avg
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY 
    no_of_skills DESC,
    salary_avg DESC
LIMIT 10;

/*
Here's a breakdown of the most optimal skills for Data Scientists in 2023: 
High-Demand Programming Languages: Python SQL and R stand out for their high demand, with demand counts of 763, 591 and 148 respectively. Despite their high demand, their average salaries are around $143,828 for Python, $142,833 for SQL and $137,885 for R, indicating that proficiency in these languages is highly valued but also widely available.
Cloud Tools and Technologies: Skills in specialized technologies such as AWS show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data science.
Business Intelligence and Visualization Tools: Tableau with demand counts of 219, and average salaries around $146,970, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
Database Technologies: The demand for skills in traditional databases (SQL) with average salaries ranging from $142,833, reflects the enduring need for data storage, retrieval, and management expertise.

RESULTS
=======

[
  {
    "skills": "python",
    "no_of_skills": "763",
    "salary_avg": "143828"
  },
  {
    "skills": "sql",
    "no_of_skills": "591",
    "salary_avg": "142833"
  },
  {
    "skills": "r",
    "no_of_skills": "394",
    "salary_avg": "137885"
  },
  {
    "skills": "sas",
    "no_of_skills": "220",
    "salary_avg": "129920"
  },
  {
    "skills": "tableau",
    "no_of_skills": "219",
    "salary_avg": "146970"
  },
  {
    "skills": "aws",
    "no_of_skills": "217",
    "salary_avg": "149630"
  },
  {
    "skills": "spark",
    "no_of_skills": "149",
    "salary_avg": "150188"
  },
  {
    "skills": "tensorflow",
    "no_of_skills": "126",
    "salary_avg": "151536"
  },
  {
    "skills": "azure",
    "no_of_skills": "122",
    "salary_avg": "142306"
  },
  {
    "skills": "pytorch",
    "no_of_skills": "115",
    "salary_avg": "152603"
  }
]
*/