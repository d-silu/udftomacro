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
    )::timestamp

{%- endmacro -%}



{% macro find_easter_sunday(year) -%}
    
    {%- set c = (year//100) -%}
    {%- set n = (year - (19 * (year // 19))) -%}
    {%- set k = ((c - 17)// 25) %}
    {%- set i1 = (c - (c // 4) - ((c - k) // 3) + 19 * n + 15) -%}
    {%- set i2 = (i1 - (30 * (i1 // 30)))  %}
    {%- set i3 = (i - (i // 28) * (1 - (i // 28) * (29 // (i + 1)) * ((21 - n) // 11))) -%}
    {%- set j = (year + year // 4 + i + 2 - c + c // 4) -%}
    {%- set j = (j - (7 * (j // 7))) -%}
    {%- set l = i - j -%}
    {%- set m = 3 + (l + 40) // 44 -%}
    {%- set d = l + 28 - 31 * (m // 4) -%}
    

    date(concat({{ year }} || '-' || LPAD(TO_VARCHAR({{ m }}),2,0) || '-' || LPAD(TO_VARCHAR({{ d }}),2,0))):: timestamp

{%- endmacro %}




    {%- set d = ((((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) - (( {{ year }}  +  {{ year }}  // 4 + (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) + 2 - ({{ year }}//100) + ({{ year }}//100) // 4) - 7 * (( {{ year }}  +  {{ year }}  // 4 + (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) + 2 - ({{ year }}//100) + ({{ year }}//100) // 4) // 7))) + 28 - 31 * ((3 + (((((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) - (( {{ year }}  +  {{ year }}  // 4 + (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) + 2 - ({{ year }}//100) + ({{ year }}//100) // 4) - 7 * (( {{ year }}  +  {{ year }}  // 4 + (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)- (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15)// 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) + 2 - ({{ year }}//100) + ({{ year }}//100) // 4) // 7))) + 40) // 44) // 4) -%}
    {%- set m = 3 + (((((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) - (( {{ year }}  +  {{ year }}  // 4 + (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) + 2 - ({{ year }}//100) + ({{ year }}//100) // 4) - 7 * (( {{ year }}  +  {{ year }}  // 4 + (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) // 28) * (1 - (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) // 28) * (29 // (((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) - (30 * ((({{ year }}//100) - (({{ year }}//100) // 4) - ((({{ year }}//100) - ((({{ year }}//100) - 17)// 25)) // 3) + 19 * ({{ year }} - (19 * ({{ year }} // 19))) + 15) // 30))) + 1)) * ((21 - ({{ year }} - (19 * ({{ year }} // 19)))) // 11))) + 2 - ({{ year }}//100) + ({{ year }}//100) // 4) // 7))) + 40) // 44 -%}