WITH credits_earned AS (
    SELECT [STUDENT_NUMBER],[SECTIONID] AS sectid,[COURSE_NAME], CASE
        WHEN grade >= 70 THEN 'Passing'
        ELSE 'Failing'
    END AS passing
    FROM {{ ref('Q123_grades_by_student')}}
)

SELECT *
FROM credits_earned
LEFT JOIN {{ ref('sections')}}
ON credits_earned.sectid = {{ ref('sections')}}.[SECTIONID]