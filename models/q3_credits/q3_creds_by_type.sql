SELECT [STUDENT_NUMBER], [Credit_Type], sum(credits_earned) AS tot_creds_earned
FROM {{ ref('q3_creds_by_course')}}
GROUP BY [STUDENT_NUMBER], [Credit_Type]