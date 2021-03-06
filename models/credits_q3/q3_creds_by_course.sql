with

grades as (
    select * from {{ ref('q3_grades_by_course')}}
),

final as (
    select 
        student_id,
        course_id,
        credit_type,
        pct,

        case 
            when pct >= 70 then 1  -- count 1 credit if grade greater than or equal to 70
            else 0  -- otherwise zero credits
        end as credits_earned
    
    from grades

)

select * from final