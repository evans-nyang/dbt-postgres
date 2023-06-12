WITH source AS (
    SELECT * FROM {{ source('phones', 'mobile_phones')}}
),

staged AS (
    SELECT
        md5(trim(data_id)) AS data_id,
        md5(trim(brand)) AS brand_hash,
        -- lower(trim(item_url)) AS item_url,
        specs,
        price,
        extract(epoch from crawled_at) AS crawled_at,
        md5(trim(votes)) AS votes_hash
        
        -- date_trunc('month', created_at) AS month  
    FROM source
)

SELECT * FROM staged
