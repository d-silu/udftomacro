{% set year = var("year") %}

select
    {{ find_easter_sunday(year) }} as easter
