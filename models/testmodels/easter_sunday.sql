-- {# {% set year = var("year") %} #}

select
    given_year,
    {{ find_easter_sunday_test1('given_year') }} as easter
from {{ source('date_table', 'find_easter') }}
