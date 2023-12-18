
with nth_week_day as (
    select * from {{ source('date_table', 'nth_day') }}
)
select 
    id,
    test_week,
    test_weekday,
    test_year,
    test_month,
    {{ find_nth_week_day('test_week','test_weekday','test_year','test_month') }} as result_date
from nth_week_day