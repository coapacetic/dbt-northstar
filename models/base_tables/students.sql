SELECT DISTINCT [STUDENT_NUMBER], [LastFirst]
FROM {{ source('eoygrades_data','C2020_Y1_Historical')}}