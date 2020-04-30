SELECT *, CASE
    WHEN {{ ref('q3_grades_by_course')}}.[AVG_PERCENT] >= 70 THEN 1
    ELSE 0
    END AS credits_earned
FROM q3_grades_by_course
