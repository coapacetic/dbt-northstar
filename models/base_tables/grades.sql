SELECT DISTINCT [STUDENT_NUMBER], [Course_Number], [TermID], [Percent]
FROM {{ source('eoygrades_data','C2020_Y1_Historical')}}