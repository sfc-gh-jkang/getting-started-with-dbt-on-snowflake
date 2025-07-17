-- Setting variables
-- {%- set payment_method_types_list = get_payment_methods() -%}
-- Do with a macro get distinct values from payment_method column from table raw_payments
{%- set payment_method_types_list = dbt_utils.get_column_values(
    table=ref('raw_payments'),
    column='payment_method'
) -%}

-- Using Jinja to create for loop
SELECT
    order_id,
    sum(amount) as total_amount,
    {%- for payment_method_types in payment_method_types_list %}
    sum(case when payment_method = '{{payment_method_types}}' then amount end) as {{payment_method_types}}_amount
    {%- if not loop.last %},{% endif -%}
    {% endfor %}
FROM {{ ref('raw_payments') }}
GROUP BY 1
