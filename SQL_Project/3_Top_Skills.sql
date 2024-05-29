/*
Question: What are the most in-demand skills for data science?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data scientist.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS no_of_skills
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_work_from_home = TRUE
GROUP BY skills
ORDER BY no_of_skills DESC
LIMIT 5;

/*
Here's the breakdown of the most demanded skills for data science in 2023
Python and SQL remain fundamental, emphasizing the need for strong foundational skills in programming, data processing and Databases.
Cloud Computing Systems and Visualization Tools like AWS and Tableau are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

RESULTS
=======

[
  {
    "skills": "python",
    "no_of_skills": "10390"
  },
  {
    "skills": "sql",
    "no_of_skills": "7488"
  },
  {
    "skills": "r",
    "no_of_skills": "4674"
  },
  {
    "skills": "aws",
    "no_of_skills": "2593"
  },
  {
    "skills": "tableau",
    "no_of_skills": "2458"
  }
]
*/