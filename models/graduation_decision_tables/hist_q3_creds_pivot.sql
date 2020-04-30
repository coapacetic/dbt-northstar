SELECT [LastFirst] AS student, {{ credit_types_list() }}
FROM {{ ref('hist_q3_creds')}}
PIVOT (sum(tot_creds_earned)
FOR [Credit_Type] IN ({{ credit_types_list() }}))
AS PivotTable
