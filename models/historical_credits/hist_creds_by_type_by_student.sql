SELECT * 
FROM {{ ref('students')}}
JOIN {{ ref('hist_creds_by_type')}}
ON {{ ref('students')}}.stu_id = {{ ref('hist_creds_by_type')}}.[STUDENT_NUMBER]
