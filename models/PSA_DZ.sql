{{
  config(
    materialized='incremental',
    unique_key='PROCESS_ID',
    incremental_strategy='merge',
    pre_hook=[
      "UPDATE {{this}} SET LATEST_FLAG = 0"
    ]
  )
}}

{{ fill_missing_columns(
     ref('VW_PSA_DZ'),
     this
) }}


    -- schema='PSA_DZ',
    -- alias='PSA_DZ_SALES_NATIONAL_MTH_TRANSP',