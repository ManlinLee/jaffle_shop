WITH stg_payments AS (

  SELECT * 
  
  FROM {{ ref('stg_payments')}}

),

next_gem_payments AS (

  SELECT * 
  
  FROM stg_payments AS raw_payments
  
  WHERE amount < 3

)

SELECT *

FROM next_gem_payments
