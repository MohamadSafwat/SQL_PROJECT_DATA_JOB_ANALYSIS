/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Science positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Scientists and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg)) AS Salary_AVG,
    COUNT(skills_job_dim.job_id) AS no_of_skills
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY skills
ORDER BY Salary_AVG DESC
LIMIT 25;

/*
Here's a breakdown of the results for top paying skills for Data Scientists:
- Data Protection , Server Side Applications and DevOps skills like GDPR, GOLANG and Atlassian are commanded with top salaries.
- Other Programming Languages like Julia and C are also commanded with high salaries reflecting that the market change dynamically and needs diversity of languages.

RESULTS
=======
[
  {
    "skills": "gdpr",
    "salary_avg": "217738",
    "no_of_skills": "4"
  },
  {
    "skills": "golang",
    "salary_avg": "208750",
    "no_of_skills": "2"
  },
  {
    "skills": "atlassian",
    "salary_avg": "189700",
    "no_of_skills": "5"
  },
  {
    "skills": "selenium",
    "salary_avg": "180000",
    "no_of_skills": "1"
  },
  {
    "skills": "opencv",
    "salary_avg": "172500",
    "no_of_skills": "4"
  },
  {
    "skills": "neo4j",
    "salary_avg": "171655",
    "no_of_skills": "4"
  },
  {
    "skills": "microstrategy",
    "salary_avg": "171147",
    "no_of_skills": "6"
  },
  {
    "skills": "dynamodb",
    "salary_avg": "169670",
    "no_of_skills": "3"
  },
  {
    "skills": "php",
    "salary_avg": "168125",
    "no_of_skills": "4"
  },
  {
    "skills": "tidyverse",
    "salary_avg": "165513",
    "no_of_skills": "4"
  },
  {
    "skills": "solidity",
    "salary_avg": "165000",
    "no_of_skills": "1"
  },
  {
    "skills": "c",
    "salary_avg": "164865",
    "no_of_skills": "48"
  },
  {
    "skills": "go",
    "salary_avg": "164691",
    "no_of_skills": "57"
  },
  {
    "skills": "datarobot",
    "salary_avg": "164500",
    "no_of_skills": "5"
  },
  {
    "skills": "qlik",
    "salary_avg": "164485",
    "no_of_skills": "15"
  },
  {
    "skills": "redis",
    "salary_avg": "162500",
    "no_of_skills": "1"
  },
  {
    "skills": "watson",
    "salary_avg": "161710",
    "no_of_skills": "4"
  },
  {
    "skills": "rust",
    "salary_avg": "161250",
    "no_of_skills": "2"
  },
  {
    "skills": "elixir",
    "salary_avg": "161250",
    "no_of_skills": "2"
  },
  {
    "skills": "cassandra",
    "salary_avg": "160850",
    "no_of_skills": "10"
  },
  {
    "skills": "looker",
    "salary_avg": "158715",
    "no_of_skills": "57"
  },
  {
    "skills": "slack",
    "salary_avg": "158333",
    "no_of_skills": "6"
  },
  {
    "skills": "terminal",
    "salary_avg": "157500",
    "no_of_skills": "1"
  },
  {
    "skills": "airflow",
    "salary_avg": "157414",
    "no_of_skills": "23"
  },
  {
    "skills": "julia",
    "salary_avg": "157244",
    "no_of_skills": "5"
  }
]
*/
