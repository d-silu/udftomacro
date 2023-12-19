

{% set date_param=var("date") %}
{% set date_paths = "'"~ date_param~"'" %}
select 
    {{ find_week_day(date_paths) }} as result_week_day