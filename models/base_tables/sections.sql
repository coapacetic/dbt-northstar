SELECT DISTINCT [SectionID] AS sect_id, [Course_Number], [Teacher_Name], [Credit_Type]
FROM {{ source('eoygrades_data','C2020_Y1_Historical')}}