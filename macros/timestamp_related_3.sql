{% macro find_nth_weekday_new(nth_week, week_day, year, month) %}

    dateadd(
        day,
        (case substr(upper({{ week_day }}),0,2)
            when 'SU' then 0
            when 'MO' then 1
            when 'TU' then 2
            when 'WE' then 3
            when 'TH' then 4
            when 'FR' then 5
            when 'SA' then 6
        end
    - dayofweek(to_timestamp((TO_VARIANT({{ year }}) || RIGHT('0' || TO_VARIANT({{ month }}),2) || '01'), 'YYYYMMDD'))) + 
    ({{ nth_week }} - 
        case 
            when (
                case substr(upper({{ week_day }}),0,2)
                    when 'SU' then 0
                    when 'MO' then 1
                    when 'TU' then 2
                    when 'WE' then 3
                    when 'TH' then 4
                    when 'FR' then 5
                    when 'SA' then 6
                end
                - dayofweek(to_timestamp((TO_VARIANT({{ year }}) || RIGHT('0' || TO_VARIANT({{ month }}),2) || '01'), 'YYYYMMDD'))
            ) >=0 then 1 
            else 0 
        end )* 7, 
        to_timestamp((TO_VARIANT({{ year }}) || RIGHT('0' || TO_VARIANT({{ month }}),2) || '01'), 'YYYYMMDD'))

{% endmacro %}