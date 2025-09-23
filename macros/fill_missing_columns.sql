{% macro fill_missing_columns(source_relation, target_relation) %}
  {% set source_cols = adapter.get_columns_in_relation(source_relation) %}
  {% set target_cols = adapter.get_columns_in_relation(target_relation) %}
  {% set source_col_names = source_cols | map(attribute='name') | list %}

  select
  {%- for col in target_cols %}
      {%- if col.name in source_col_names %}
          {{ adapter.quote(col.name) }}
      {%- else %}
          {%- if col.name.upper() == 'INSERTED_TS' %}
              current_timestamp() as {{ adapter.quote(col.name) }}
          {%- else %}
              null as {{ adapter.quote(col.name) }}
          {%- endif %}
      {%- endif %}
      {%- if not loop.last %},{% endif %}
  {%- endfor %}
  from {{ source_relation }}
{% endmacro %}
