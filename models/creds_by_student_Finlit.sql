WITH finlit_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'finlit_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    {{ passed_prior_course_by_cred_type("'FINLIT'") }}
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], finlit_creds.[finlit_credits]
FROM {{ ref('students')}}
LEFT JOIN finlit_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = finlit_creds.[STUDENT_NUMBER]
