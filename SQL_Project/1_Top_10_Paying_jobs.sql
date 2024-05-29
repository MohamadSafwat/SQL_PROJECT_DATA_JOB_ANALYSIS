/*
Question: What are the top-paying data scientist jobs?
- Identify the top 10 highest-paying Data Scientist roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data scientists, offering insights into employment options and location flexibility.
*/


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
LIMIT 10;


/*
Here's the breakdown of the top data analyst jobs in 2023:
Salary Range: Top 10 paying data scientist roles span from $300,000 to $550,000, indicating significant salary potential in the field.
Diverse Employers: Companies like Selby Jennings, Algo, and Demandbase are among those offering high salaries, showing a broad interest across different industries.
Job Title Variety: There's a high diversity in job titles, from Data Scientist to Director of Data Science, reflecting varied roles and specializations within data science.

RESULTS
=======
[
  {
    "job_id": 40145,
    "salary_year_avg": "550000.0",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "name": "Selby Jennings"
  },
  {
    "job_id": 1714768,
    "salary_year_avg": "525000.0",
    "job_title": "Staff Data Scientist - Business Analytics",
    "name": "Selby Jennings"
  },
  {
    "job_id": 1131472,
    "salary_year_avg": "375000.0",
    "job_title": "Data Scientist",
    "name": "Algo Capital Group"
  },
  {
    "job_id": 1742633,
    "salary_year_avg": "351500.0",
    "job_title": "Head of Data Science",
    "name": "Demandbase"
  },
  {
    "job_id": 551497,
    "salary_year_avg": "324000.0",
    "job_title": "Head of Data Science",
    "name": "Demandbase"
  },
  {
    "job_id": 126218,
    "salary_year_avg": "320000.0",
    "job_title": "Director Level - Product Management - Data Science",
    "name": "Teramind"
  },
  {
    "job_id": 1161630,
    "salary_year_avg": "313000.0",
    "job_title": "Director of Data Science & Analytics",
    "name": "Reddit"
  },
  {
    "job_id": 129924,
    "salary_year_avg": "300000.0",
    "job_title": "Director of Data Science",
    "name": "Storm4"
  },
  {
    "job_id": 38905,
    "salary_year_avg": "300000.0",
    "job_title": "Principal Data Scientist",
    "name": "Storm5"
  },
  {
    "job_id": 226011,
    "salary_year_avg": "300000.0",
    "job_title": "Distinguished Data Scientist",
    "name": "Walmart"
  }
]
*/