-- {# select {{ dbt_date.today() }} as current_date #}

select {{ get_current_date() }} as current_date