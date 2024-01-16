WITH RAW_CUSTOMER_AGE_TEST AS (

  SELECT * 
  
  FROM {{ source('BLACKROCK.PUBLIC', 'RAW_CUSTOMER_AGE_TEST') }}

),

customers AS (

  SELECT * 
  
  FROM {{ ref('customers')}}

),

Join_1 AS (

  SELECT * 
  
  FROM RAW_CUSTOMER_AGE_TEST AS in0
  INNER JOIN customers AS in1
     ON in0.ID = in1.CUSTOMER_ID

),

OrderBy_1 AS (

  SELECT * 
  
  FROM Join_1 AS in0
  
  ORDER BY ID ASC

),

Filter_Out_Null AS (

  SELECT * 
  
  FROM OrderBy_1 AS in0
  
  WHERE FIRST_ORDER IS NULL OR TOTAL_ORDERS IS NULL OR MOST_RECENT_ORDER IS NULL

)

SELECT *

FROM Filter_Out_Null
