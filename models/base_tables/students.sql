SELECT DISTINCT [STUDENT_NUMBER] AS stu_id, [LastFirst], [HOME_ROOM]
FROM {{ source ('eoygrades_data','C2020_Y1_Historical') }}