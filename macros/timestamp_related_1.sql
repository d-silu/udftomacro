-- {# get current date #}

{%- macro get_current_date() -%}
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

{%- macro find_nth_weekday(nth_week, week_day, year, month) -%}

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
    )::timestamp

{%- endmacro -%}




-- {% Easter Sunday %}

{% macro find_easter_sunday_test1(year) -%}
    
    {%- set c = (year/100) | int -%}
    {%- set n = (year - (19 * (year / 19) | int )) | int -%}
    {%- set k = ((c - 17)/25) | int %}
    {%- set i1 = (c - (c /4) | int - ((c - k) / 3) | int + 19 * n + 15) -%}
    {%- set i2 = (i1 - (30 * (i1 / 30) | int))  %}
    {%- set i3 = (i2 - (i2 / 28) | int * (1 - (i2 / 28) | int * (29 / (i2 + 1)) | int * ((21 - n) / 11) | int)) -%}
    {%- set j = (year + (year / 4) | int + i3 + 2 - c + (c / 4) | int) -%}
    {%- set j = (j - (7 * (j / 7) | int)) | int -%}
    {%- set l = i3 - j -%}
    {%- set m = 3 + ((l + 40) / 44) | int -%}
    {%- set d = l + 28 - (31 * (m / 4) | int) | int -%}

    date(concat({{ year }} || '-' || LPAD(TO_VARCHAR({{ m }}),2,0) || '-' || LPAD(TO_VARCHAR({{ d }}),2,0))):: timestamp

{%- endmacro %}


{% macro find_easter_sunday_test2(year) -%}
    
    {%- set c = (year//100) -%}
    {%- set n = (year - (19 * (year // 19))) -%}
    {%- set k = ((c - 17)// 25) %}
    {%- set i1 = (c - (c // 4) - ((c - k) // 3) + 19 * n + 15) -%}
    {%- set i2 = (i1 - (30 * (i1 // 30)))  %}
    {%- set i3 = (i2 - (i2 // 28) * (1 - (i2 // 28) * (29 // (i2 + 1)) * ((21 - n) // 11))) -%}
    {%- set j = (year + year // 4 + i3 + 2 - c + c // 4) -%}
    {%- set j = (j - (7 * (j // 7))) -%}
    {%- set l = i3 - j -%}
    {%- set m = 3 + (l + 40) // 44 -%}
    {%- set d = l + 28 - 31 * (m // 4) -%}

    date(concat({{ year }} || '-' || LPAD(TO_VARCHAR({{ m }}),2,0) || '-' || LPAD(TO_VARCHAR({{ d }}),2,0))):: timestamp

{%- endmacro %}

