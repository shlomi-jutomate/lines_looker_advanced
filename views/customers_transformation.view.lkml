view: customers{
  sql_table_name: [looker_advanced_training.customers_transformation] ;;

  dimension: account_balance {
    type: number
    sql: ${TABLE}.account_balance ;;
  }
  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: customer_address {
    type: string
    sql: ${TABLE}.customer_address ;;
  }
  dimension: customer_key {
    type: number
    sql: ${TABLE}.customer_key ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }
  dimension: market_segment {
    type: string
    sql: ${TABLE}.market_segment ;;
  }
  dimension: nation_key {
    type: number
    sql: ${TABLE}.nation_key ;;
  }
  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [customer_name]
  }
}
