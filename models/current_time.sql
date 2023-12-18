-- {# select {{ dbt_date.today() }} as current_date #}

select {{ get_current_timestamp() }} as current_date, {{ dbt_date.week_start() }} as week_start