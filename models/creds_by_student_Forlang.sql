WITH forlang_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'forlang_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    {{ passed_prior_course_by_cred_type("'FORLANG'") }}
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], forlang_creds.[forlang_credits]
FROM {{ ref('students')}}
LEFT JOIN forlang_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = forlang_creds.[STUDENT_NUMBER]
