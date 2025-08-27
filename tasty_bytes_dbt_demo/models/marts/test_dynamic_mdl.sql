{{
    config(
        materialized='table'
    )
}}

SELECT 1::int as col_int,
        2::float as col_float