view: top_n_nations {
  derived_table: {
    explore_source: suppliers {
      column: supplier_nation_key { field: suppliers.supplier_nation_key }
      column: count_suppliers { field: suppliers.count}
      # column: nation_title_handle {
      #   field: suppliers.supplier_name
      # }
      bind_all_filters: yes
      derived_column: ranking {
        sql: rank() over (order by {% parameter nation_rank_measure_selection %} DESC);;
        # , count_suppliers desc) ;;
      }
    }
  }

  dimension: supplier_nation_key {
      primary_key: yes
      hidden: yes
    type: number
  }

  dimension: count_suppliers {
    description: ""
    type: number
  }

  dimension: nation_rank {
    hidden: yes
    type: number
    sql: ${TABLE}.ranking ;;
  }

  # dimension: nation_title_handle{
  #   description: ""
  # }




  # measure: dynamic_measure {
  #   view_label: "Top N Ranking"
  #   label_from_parameter: nation_rank_measure_selection
  #   type: number
  #   sql:
  #     {% if nation_rank_measure_selection._parameter_value == 'count' %} ${suppliers.count}
  #     {% else %}  ${suppliers.count}
  #     {% endif %}
  #   ;;
  #   html:
  #     {% if nation_rank_measure_selection._parameter_value == 'count' %}  {{ suppliers.count._rendered_value }}
  #     {% else %} {{ suppliers._rendered_value }}
  #     {% endif %}
  #   ;;
  # }

  parameter: nation_rank_measure_selection {
    view_label: "Top N Ranking"
    label: "Rank By Metric"
    description: "Specify which metric to rank nations by"
    type: unquoted
    default_value: "count_suppliers"
    allowed_value: {
      label: "Total Suppliers"
      value: "count_suppliers"
    }
  }

  parameter: top_rank_limit {
    view_label: "Top N Ranking"
    type: unquoted
    default_value: "25"
    allowed_value: {
      label: "Top 3"
      value: "3"
    }
    allowed_value: {
      label: "Top 5"
      value: "5"
    }
    allowed_value: {
      label: "Top 10"
      value: "10"
    }
  }

  dimension: nation_name_top_nation {
    view_label: "Top N Ranking"
    # label: "Nations (Top {% if top_rank_limit._is_filtered %}{% parameter top_rank_limit %}{% else %}N{% endif %})"
    label: "Nation Name (Top N)"
    description: "Shows the Nation Name if in Top N, otherwise 'Other'"
    order_by_field: nation_rank_top_nations
    type: string
    sql:
          CASE
            WHEN ${nation_rank}<{% parameter top_rank_limit %} THEN ${nations.nation_name}
            ELSE 'Other'
          END
    ;;
  }

  dimension: nation_rank_top_nations {
    hidden: yes
    label_from_parameter: top_rank_limit
    type: string
    sql:
      CASE
        WHEN ${nation_rank} <= {% parameter top_rank_limit %}
          THEN
            CASE
              WHEN ${nation_rank}<10 THEN  CONCAT('0', CAST(${nation_rank} AS STRING))
              ELSE CAST(${nation_rank} AS STRING)
            END
        ELSE '9999'
      END
    ;;
  }







}
