{% set year = var("year") %}

select
    {{ find_easter_sunday_long(year) }} as easter
