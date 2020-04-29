WITH hist_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'hist_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    {{ passed_prior_course_by_cred_type("'HIST'") }}
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], hist_creds.[hist_credits]
FROM {{ ref('students')}}
LEFT JOIN hist_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = hist_creds.[STUDENT_NUMBER]
