with 

grades as (
    select * from {{ ref('q3_grades_with_course_id') }}
),

final as (
    select
        student_id,
        course_id,
        credit_type,
        avg(pct) as pct -- average the first three quarters together

    from grades

    where quarter = 'Q1' or quarter = 'Q2' or quarter = 'Q3'  -- only select the first three quarters

    group by student_id, course_id, credit_type
    
)

select * from final