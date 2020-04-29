WITH elective_creds AS (
    SELECT {{ ref('grades')}}.[STUDENT_NUMBER], count(*) AS 'elective_credits'
    FROM {{ ref('grades')}}
    LEFT JOIN {{ ref('courses')}}
    ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.[Course_Number]
    WHERE ({{ ref('courses')}}.[Credit_Type] = 'ELECT' OR {{ ref('courses')}}.[Credit_Type] = 'ART') AND {{ ref('grades')}}.[Percent] >= 70 AND {{ ref('grades')}}.[TermID] < 2900
        AND {{ ref('courses')}}.[Course_Number] NOT LIKE 'UNI%'
    GROUP BY {{ ref('grades')}}.[STUDENT_NUMBER]
)

SELECT {{ ref('students')}}.[STUDENT_NUMBER], elective_creds.[elective_credits]
FROM {{ ref('students')}}
LEFT JOIN elective_creds
ON {{ ref('students')}}.[STUDENT_NUMBER] = elective_creds.[STUDENT_NUMBER]