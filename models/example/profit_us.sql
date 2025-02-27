-- models/profit_model.sql
SELECT
    sales_date,
    SUM(quantity_sold * unit_sell_price) AS total_revenue,
    SUM(quantity_sold * unit_purchase_cost) AS total_cost,
    SUM(quantity_sold * unit_sell_price) - SUM(quantity_sold * unit_purchase_cost) AS total_profit
FROM {{ source('DBT_SCHEMA', 'SALES_US') }}
GROUP BY sales_date


