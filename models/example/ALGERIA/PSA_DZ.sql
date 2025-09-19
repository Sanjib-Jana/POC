{{
  config(
    materialized='incremental',
    unique_key='PROCESS_ID',
    incremental_strategy='merge',
    schema='PSA_DZ',
    alias='PSA_DZ_SALES_NATIONAL_MTH_TRANSP',
    pre_hook=[
      "UPDATE {{this}} SET LATEST_FLAG = 0"
    ]
  )
}}

select 
    '100' as PROCESS_ID,
    '1' as LATEST_FLAG


   -- pre_hook=[
    --   "UPDATE POC.PSA_DZ.PSA_DZ_SALES_NATIONAL_MTH_TRANSP SET LATEST_FLAG = 0"
    -- ]
    -- schema='PSA_DZ',
    -- alias='PSA_DZ_SALES_NATIONAL_MTH_TRANSP',