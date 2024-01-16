WITH test_raw_ICAP_USD_Basis_Swaps_20240108 AS (

  SELECT * 
  
  FROM {{ ref('test_raw_ICAP_USD_Basis_Swaps_20240108')}}

),

Reformat_1 AS (

  SELECT 
    RIC AS RIC,
    ROW_NUMBER() OVER (ORDER BY RIC, DATE, TIME) AS ID,
    TO_DATE(DATE) AS DATE,
    TO_TIME(TIME) AS TIME,
    TENOR AS TENOR
  
  FROM test_raw_ICAP_USD_Basis_Swaps_20240108 AS in0

)

SELECT *

FROM Reformat_1
