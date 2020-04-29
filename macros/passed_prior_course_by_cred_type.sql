{% macro passed_prior_course_by_cred_type(dept) %}

    WHERE {{ ref('courses')}}.[Credit_Type] = {{ dept }} AND {{ ref('grades')}}.[Percent] >= 70 AND {{ ref('grades')}}.[TermID] < 2900

{% endmacro %}