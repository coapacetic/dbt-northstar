WITH gym_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'gym_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    {{ passed_prior_course_by_cred_type("'PE'") }}
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], gym_creds.[gym_credits]
FROM {{ ref('students')}}
LEFT JOIN gym_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = gym_creds.[STUDENT_NUMBER]
