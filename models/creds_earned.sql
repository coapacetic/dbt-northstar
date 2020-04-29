SELECT {{ ref('students')}}.[STUDENT_NUMBER], {{ ref('students')}}.[LastFirst], {{ ref('creds_by_student_English')}}.eng_credits, {{ ref('creds_by_student_Math')}}.math_credits,
{{ ref('creds_by_student_Science')}}.sci_credits, {{ ref('creds_by_student_History')}}.hist_credits, {{ ref('creds_by_student_Forlang')}}.forlang_credits, 
{{ ref('creds_by_student_Elective')}}.elective_credits, {{ ref('creds_by_student_CR')}}.cr_credits, {{ ref('creds_by_student_Gym')}}.gym_credits,
{{ ref('creds_by_student_Finlit')}}.finlit_credits
FROM {{ ref('students')}}
LEFT JOIN {{ ref('creds_by_student_English')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_English')}}.[STUDENT_NUMBER]
LEFT JOIN {{ ref('creds_by_student_Math')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_Math')}}.[STUDENT_NUMBER]
LEFT JOIN {{ ref('creds_by_student_Science')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_Science')}}.[STUDENT_NUMBER]
LEFT JOIN {{ ref('creds_by_student_History')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_History')}}.[STUDENT_NUMBER]
LEFT JOIN {{ ref('creds_by_student_Forlang')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_Forlang')}}.[STUDENT_NUMBER]
LEFT JOIN {{ ref('creds_by_student_Elective')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_Elective')}}.[STUDENT_NUMBER]
LEFT JOIN {{ ref('creds_by_student_CR')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_CR')}}.[STUDENT_NUMBER]
LEFT JOIN {{ ref('creds_by_student_Gym')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_Gym')}}.[STUDENT_NUMBER]
LEFT JOIN {{ ref('creds_by_student_Finlit')}}
ON {{ ref('students')}}.[STUDENT_NUMBER] = {{ ref('creds_by_student_Finlit')}}.[STUDENT_NUMBER]
