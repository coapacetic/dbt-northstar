select distinct
    [Course_Number] as course_id, 
    [Course_Name] as course_name, 
    [Credit_Type] as credit_type

from {{ source('eoygrades_data','C2020_Y1_Historical') }}
