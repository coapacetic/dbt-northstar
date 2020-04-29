WITH math_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'math_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    {{ passed_prior_course_by_cred_type("'MATH'") }}
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], math_creds.[math_credits]
FROM {{ ref('students')}}
LEFT JOIN math_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = math_creds.[STUDENT_NUMBER]
