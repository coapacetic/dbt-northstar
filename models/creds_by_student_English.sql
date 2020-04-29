WITH english_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'eng_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    {{ passed_prior_course_by_cred_type("'ENG'") }}
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], english_creds.[eng_credits]
FROM {{ ref('students')}}
LEFT JOIN english_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = english_creds.[STUDENT_NUMBER]