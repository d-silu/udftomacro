-- {# get current date #}

{%- macro get_current_timestamp() -%}
    TO_DATE({{ dbt.current_timestamp() }})
{%- endmacro -%}


-- {# Get week day from a date #}

{%- macro find_week_day(user_date) -%}
    -- {# Non iso format#}
    case dayofweek(date({{ user_date }}))
        when 6 then previous_day(date({{ user_date }}), 'fr')
        when 0 then next_day(date({{ user_date }}), 'mo')
        else date({{ user_date }})
    end
{%- endmacro -%}


-- {# Get Nth Week day #}

{%- macro find_nth_week_day(nth_week, week_day, year, month) -%}

    dateadd(
        day,
        case substr(upper({{ week_day }}),0,2) 
            when 'MO' then 0
            when 'TU' then 1
            when 'WE' then 2
            when 'TH' then 3
            when 'FR' then 4
            when 'SA' then 5
            when 'SU' then 6
        end,
        dateadd(
            week,
            case when 
                case 
                    substr(upper({{ week_day }}),0,2)
                    when 'SU' then 7
                    when 'MO' then 1
                    when 'TU' then 2
                    when 'WE' then 3
                    when 'TH' then 4
                    when 'FR' then 5
                    when 'SA' then 6
                end >= 
                    case when dayofweek(date_from_parts({{ year }},{{ month }},1)) = 0 then 7
                        else dayofweek(date_from_parts({{ year }},{{ month }},1))
                    end
                then {{ nth_week }} - 1
                else {{ nth_week }}
            end,
            date_trunc(week, date_from_parts({{ year }}, {{ month }},1))
            )
    )

{%- endmacro -%}
