WITH products AS (
    SELECT * FROM {{ ref ('stg_products') }}
),

dim_brands AS (
    SELECT * FROM {{ ref ('dim_brands') }}
),

dim_reviews AS (
    SELECT * FROM {{ ref ('dim_reviews') }}
),

final AS (
    SELECT
        *
    FROM products
    JOIN dim_brands using (brand_hash)
    JOIN dim_reviews using (votes_hash)
)

SELECT * FROM final
