SELECT {{ ref('grades')}}.*, {{ ref('courses')}}.* , CASE
    WHEN {{ ref('grades')}}.[Percent] >= 70 THEN 1
    ELSE 0
    END AS credits_earned
FROM {{ ref('grades')}}
LEFT JOIN {{ ref('courses')}}
ON {{ ref('grades')}}.[Course_Number] = {{ ref('courses')}}.c_id
WHERE {{ ref('grades')}}.[TermID] < 2900