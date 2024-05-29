/*
Question: What skills are required for the top-paying data scientist jobs?
- Use the top 10 highest-paying Data Scientist jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/


WITH Top_Paying_Jobs AS (
    SELECT
        job_id,
        salary_year_avg,
        job_title,
        name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Scientist' AND
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
    SELECT
        Top_Paying_Jobs.*,
        skills
FROM
    Top_Paying_Jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = Top_Paying_Jobs.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id;

/*
Here's the breakdown of the most demanded skills for data scientists in 2023, based on job postings:
Both SQL  and Python are leading with a bold count of 4 for each one.
AWS is also highly sought after, with a bold count of 3.
Other skills like azure, pytorch, and tensorflow show varying degrees of demand.

RESULTS
=======

[
  {
    "job_id": 40145,
    "salary_year_avg": "550000.0",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "salary_year_avg": "550000.0",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "name": "Selby Jennings",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "salary_year_avg": "525000.0",
    "job_title": "Staff Data Scientist - Business Analytics",
    "name": "Selby Jennings",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "salary_year_avg": "375000.0",
    "job_title": "Data Scientist",
    "name": "Algo Capital Group",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "salary_year_avg": "375000.0",
    "job_title": "Data Scientist",
    "name": "Algo Capital Group",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "salary_year_avg": "375000.0",
    "job_title": "Data Scientist",
    "name": "Algo Capital Group",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "salary_year_avg": "375000.0",
    "job_title": "Data Scientist",
    "name": "Algo Capital Group",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "salary_year_avg": "375000.0",
    "job_title": "Data Scientist",
    "name": "Algo Capital Group",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "salary_year_avg": "375000.0",
    "job_title": "Data Scientist",
    "name": "Algo Capital Group",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "salary_year_avg": "375000.0",
    "job_title": "Data Scientist",
    "name": "Algo Capital Group",
    "skills": "tableau"
  },
  {
    "job_id": 126218,
    "salary_year_avg": "320000.0",
    "job_title": "Director Level - Product Management - Data Science",
    "name": "Teramind",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "salary_year_avg": "320000.0",
    "job_title": "Director Level - Product Management - Data Science",
    "name": "Teramind",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "salary_year_avg": "320000.0",
    "job_title": "Director Level - Product Management - Data Science",
    "name": "Teramind",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "salary_year_avg": "320000.0",
    "job_title": "Director Level - Product Management - Data Science",
    "name": "Teramind",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "salary_year_avg": "320000.0",
    "job_title": "Director Level - Product Management - Data Science",
    "name": "Teramind",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "salary_year_avg": "320000.0",
    "job_title": "Director Level - Product Management - Data Science",
    "name": "Teramind",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "salary_year_avg": "320000.0",
    "job_title": "Director Level - Product Management - Data Science",
    "name": "Teramind",
    "skills": "datarobot"
  },
  {
    "job_id": 38905,
    "salary_year_avg": "300000.0",
    "job_title": "Principal Data Scientist",
    "name": "Storm5",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "salary_year_avg": "300000.0",
    "job_title": "Principal Data Scientist",
    "name": "Storm5",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "salary_year_avg": "300000.0",
    "job_title": "Principal Data Scientist",
    "name": "Storm5",
    "skills": "java"
  },
  {
    "job_id": 38905,
    "salary_year_avg": "300000.0",
    "job_title": "Principal Data Scientist",
    "name": "Storm5",
    "skills": "c"
  },
  {
    "job_id": 38905,
    "salary_year_avg": "300000.0",
    "job_title": "Principal Data Scientist",
    "name": "Storm5",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "salary_year_avg": "300000.0",
    "job_title": "Principal Data Scientist",
    "name": "Storm5",
    "skills": "gcp"
  },
  {
    "job_id": 457991,
    "salary_year_avg": "300000.0",
    "job_title": "Head of Battery Data Science",
    "name": "Lawrence Harvey",
    "skills": "python"
  },
  {
    "job_id": 457991,
    "salary_year_avg": "300000.0",
    "job_title": "Head of Battery Data Science",
    "name": "Lawrence Harvey",
    "skills": "aws"
  },
  {
    "job_id": 457991,
    "salary_year_avg": "300000.0",
    "job_title": "Head of Battery Data Science",
    "name": "Lawrence Harvey",
    "skills": "gcp"
  },
  {
    "job_id": 226011,
    "salary_year_avg": "300000.0",
    "job_title": "Distinguished Data Scientist",
    "name": "Walmart",
    "skills": "scala"
  },
  {
    "job_id": 226011,
    "salary_year_avg": "300000.0",
    "job_title": "Distinguished Data Scientist",
    "name": "Walmart",
    "skills": "java"
  },
  {
    "job_id": 226011,
    "salary_year_avg": "300000.0",
    "job_title": "Distinguished Data Scientist",
    "name": "Walmart",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "salary_year_avg": "300000.0",
    "job_title": "Distinguished Data Scientist",
    "name": "Walmart",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "salary_year_avg": "300000.0",
    "job_title": "Distinguished Data Scientist",
    "name": "Walmart",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "salary_year_avg": "300000.0",
    "job_title": "Distinguished Data Scientist",
    "name": "Walmart",
    "skills": "kubernetes"
  }
]
*/