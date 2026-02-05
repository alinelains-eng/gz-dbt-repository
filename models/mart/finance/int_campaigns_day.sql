SELECT *
FROM {{ ref('int_campaigns') }}
ORDER BY date_date 