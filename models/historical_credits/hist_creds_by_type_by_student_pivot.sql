SELECT [LastFirst] AS student, {{ credit_types_list() }}
FROM {{ ref('hist_creds_by_type_by_student')}}
PIVOT (sum(tot_creds_earned)
FOR [Credit_Type] IN ({{ credit_types_list() }}))
AS PivotTable
