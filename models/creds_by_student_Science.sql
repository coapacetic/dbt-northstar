WITH science_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'sci_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    {{ passed_prior_course_by_cred_type("'SCI'") }}
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], science_creds.[sci_credits]
FROM {{ ref('students')}}
LEFT JOIN science_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = science_creds.[STUDENT_NUMBER]
