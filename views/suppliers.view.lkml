view: suppliers{
  sql_table_name: `looker_advanced_training.suppliers_transformation` ;;

  dimension: account_balance {
    type: number
    sql: ${TABLE}.account_balance ;;
  }
  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: supplier_address {
    type: string
    sql: ${TABLE}.supplier_address ;;
  }
  dimension: supplier_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.supplier_key ;;
  }
  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
  }
  dimension: supplier_nation_key {
    type: number
    sql: ${TABLE}.supplier_nation_key ;;
  }
  dimension: supplier_phone {
    type: string
    sql: ${TABLE}.supplier_phone ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [supplier_name]
  }

  measure: total_account_balance {
    label: "Total Account Balance"
    type: sum
    sql: ${account_balance} ;;
    value_format_name: usd
  }

# Dimension for the default icon link
  dimension: general_profile_link {
    type: string
    label: "General Profile"
    sql: "general_profile";;  # Replace "general_profile" with a valid SQL expression from your data.
    html: <a href="/dashboards/735" >
            <img src="https://static.wixstatic.com/media/6b805b_84a20d931d4048ccb5fda6410cfd5838~mv2.png/v1/fill/w_175,h_51,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/jutomate%202023.png" width="175" height="51"/>
        </a> ;;
  }

# Dimension for the selected icon link
  dimension: general_profile_link_selected {
    type: string
    label: "General Profile Selected"
    sql: "general_profile";;  # Replace "general_profile" with a valid SQL expression from your data.
    html: <a href="/dashboards/735" >
            <img src="https://static.wixstatic.com/media/6b805b_84a20d931d4048ccb5fda6410cfd5838~mv2.png/v1/fill/w_175,h_51,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/jutomate%202023.png" width="175" height="51"/>
        </a> ;;
  }


}
