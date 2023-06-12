WITH stg_reviews AS (
    SELECT * FROM {{ source('phones', 'mobile_phones')}}
),

staged AS (
    SELECT
        md5(trim(votes)) AS votes_hash,
        votes,
        stars
    FROM stg_reviews

)

SELECT * FROM staged
