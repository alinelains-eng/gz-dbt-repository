with 

source as (

    select * from {{ source('gz_raw_data', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        cast(pdt_id as float64) as products_id,
        revenue,
        quantity

    from source

)

select * from renamed