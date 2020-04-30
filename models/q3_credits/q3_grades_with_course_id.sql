SELECT {{ source('c2020_grades_by_quarter','c2020_apr24_grade_by_quarter')}}.*, {{ ref('sections')}}.Credit_Type
FROM {{ source('c2020_grades_by_quarter','c2020_apr24_grade_by_quarter')}}
LEFT JOIN {{ ref('sections')}}
ON {{ source('c2020_grades_by_quarter','c2020_apr24_grade_by_quarter')}}.[SECTIONID] = {{ ref('sections')}}.sect_id
{{ ignore_courses() }}