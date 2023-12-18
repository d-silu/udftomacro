with get_week_day as (
    select id, given_date from {{ source('date_table', 'week_n_weekend') }}
)
select
    id,
    given_date,
    {{ find_week_day('given_date') }} as result_date
from get_week_day