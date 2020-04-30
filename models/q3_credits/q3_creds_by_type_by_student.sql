SELECT * 
FROM {{ ref('students')}}
JOIN {{ ref('q3_creds_by_type')}}
ON {{ ref('students')}}.stu_id = {{ ref('q3_creds_by_type')}}.[STUDENT_NUMBER]
