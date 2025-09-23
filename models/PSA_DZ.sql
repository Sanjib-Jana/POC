{{
  config(
    materialized='incremental',
    unique_key='PROCESS_ID',
    incremental_strategy='delete+insert',
    pre_hook=[
      "UPDATE {{this}} SET LATEST_FLAG = 0"
    ]
  )
}}

{{ fill_missing_columns(
     ref('VW_PSA_DZ'),
     this
) }}
