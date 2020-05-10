with 

credits as (
    select * from NORTH_STAR.dbt_kcoapman.y1_creds_by_type_by_student
),

final as (
    select 
        student_id,
        lastfirst
    
    from credits

    pivot (
        sum(total_credits_earned) -- total creds for each credit type
        for credit_type in (



 
ENG
 , 
 
MATH
 , 
 
SCI
 , 
 
HIST
 , 
 
FORLANG
 , 
 
ELECT
 , 
 
PE
 , 
 
CR
 , 
 
ADMIN

 

)
    ) as PivotTable
)

select * from final 
limit 100