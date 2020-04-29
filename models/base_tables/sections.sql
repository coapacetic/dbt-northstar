SELECT DISTINCT [SectionID], [Course_Number]
FROM {{ source('eoygrades_data','C2020_Y1_Historical')}}