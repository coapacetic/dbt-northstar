{% macro ignore_courses() %}

{% set ignore_courses = ['ADV100', "ADV500", "DEAN01", "ENG110F", "SH100", "SR101", "SR201", "SR301", "SR401", "TEAM9", "UNI251", "UNI252"] %}

WHERE {% for course in ignore_courses %} [Course_Number] != '{{ course }}' {% if not loop.last %} AND {% endif %} {% endfor %} 

{% endmacro %}