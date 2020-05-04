select distinct
    [SectionID] as section_id, 
    [Course_Number] as course_id, 
    [Teacher_Name] as teacher_name, 
    [Credit_Type] as credit_type
    
from {{ source('eoygrades_data','C2020_Y1_Historical') }}