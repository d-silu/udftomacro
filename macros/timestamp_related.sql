-- {# get current date #}

{%- macro get_current_timestamp() -%}
    TO_DATE({{ dbt.current_timestamp() }})
{%- endmacro -%}


-- {# Get week day from a date #}

{%- macro find_week_day(user_date) -%}
    -- {# Non iso format#}
    case dayofweek({{ user_date }})
        when 6 then previous_day({{ user_date }}, 'fr')
        when 0 then next_day({{ user_date }}, 'mo')
        else {{ user_date }}
    end
{%- endmacro -%}


-- {# Get Nth Week day #}
{%- macro find_nth_week_day(nth_week, week_day, year, month) -%}

    dateadd(day,((case substr(upper({{ week_day }}),0,2) 
                when 'SU' Then 0
                when 'MO' Then 1
                when 'TU' then 2
                when 'WE' then 3
                when 'TH' then 4
                when 'FR' then 5
                when 'SA' then 6
            end - dayofweekiso(date_from_parts({{ year }}, {{ month }}, 1))) % 7) + ({{ nth_week }} * 7), 
            date_from_parts({{ year }}, {{ month }}, 1))

{%- endmacro -%}
