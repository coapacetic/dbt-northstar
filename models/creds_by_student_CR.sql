WITH cr_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'cr_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    {{ passed_prior_course_by_cred_type("'CR'") }}
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], cr_creds.[cr_credits]
FROM {{ ref('students')}}
LEFT JOIN cr_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = cr_creds.[STUDENT_NUMBER]
