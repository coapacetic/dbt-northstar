SELECT DISTINCT [Course_Number], [SectionID], [STUDENT_NUMBER], [TermID], [Percent]
FROM {{ source('eoygrades_data','C2020_Y1_Historical')}}
{{ ignore_courses() }}