{{ config(materialized='table') }}

with order_payments as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        o.amount,
        p.payment_id,
        p.payment_method,
        p.payment_amount,
        p.payment_date
    from {{ ref('stg_orders') }} o
    left join {{ ref('stg_payments') }} p
        on o.order_id = p.order_id
)

select * from order_payments
