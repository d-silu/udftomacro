
{% set nthweek = var("weeknum") %}
{% set week_day = "'"~ var("weekday") ~"'" %}
{% set year = var('year') %}
{% set month = var('month') %}

select 
    {{ find_nth_weekday_new(nthweek, week_day, year, month) }} as result 