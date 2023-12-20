{%- macro find_easter_sunday_long(year) -%}

    date(
        concat(
            {{ year }} || '-' || 
            LPAD(TO_VARCHAR(
            (3 + floor(((((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) - (({{ year }} + floor({{ year }} / 4) + ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) + 2 - (floor({{ year }}/100)) + floor((floor({{ year }}/100)) / 4)) - (7 * floor(({{ year }} + floor({{ year }} / 4) + ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) + 2 - (floor({{ year }}/100)) + floor((floor({{ year }}/100)) / 4)) / 7)))) + 40) / 44))
            ),2,0) || '-' || 
            LPAD(TO_VARCHAR(
            ((((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) - (({{ year }} + floor({{ year }} / 4) + ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) + 2 - (floor({{ year }}/100)) + floor((floor({{ year }}/100)) / 4)) - (7 * floor(({{ year }} + floor({{ year }} / 4) + ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) + 2 - (floor({{ year }}/100)) + floor((floor({{ year }}/100)) / 4)) / 7)))) + 28 - (31 * floor(((3 + floor(((((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) - (({{ year }} + floor({{ year }} / 4) + ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) + 2 - (floor({{ year }}/100)) + floor((floor({{ year }}/100)) / 4)) - (7 * floor(({{ year }} + floor({{ year }} / 4) + ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * (1 - floor((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) / 28) * floor(29 / ((((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) - (30 * floor(((floor({{ year }}/100)) - floor((floor({{ year }}/100)) / 4) - floor(((floor({{ year }}/100)) - (floor(((floor({{ year }}/100)) - 17) / 25))) / 3) + 19 * ({{ year }} - (19 * floor({{ year }} / 19))) + 15) / 30))) + 1)) * floor((21 - ({{ year }} - (19 * floor({{ year }} / 19)))) / 11))) + 2 - (floor({{ year }}/100)) + floor((floor({{ year }}/100)) / 4)) / 7)))) + 40) / 44)))/4 )))
            ),2,0)
            )
        ):: timestamp
{%- endmacro -%}