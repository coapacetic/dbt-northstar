WITH hist_q3_creds AS (
    SELECT * FROM {{ ref('hist_creds_by_type_by_student')}}
    UNION
    SELECT * FROM {{ ref('q3_creds_by_type_by_student')}}
)

SELECT [stu_id],[LastFirst],[Credit_Type], sum(tot_creds_earned) as tot_creds_earned
FROM hist_q3_creds
GROUP BY [stu_id],[LastFirst],[Credit_Type]