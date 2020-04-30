SELECT DISTINCT [Course_Number] AS c_id, [Course_Name], [Credit_Type]
FROM {{ source('eoygrades_data','C2020_Y1_Historical')}}
