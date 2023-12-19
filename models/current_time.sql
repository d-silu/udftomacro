-- {# select {{ dbt_date.today() }} as current_date #}

select {{ get_current_timestamp() }} as current_date