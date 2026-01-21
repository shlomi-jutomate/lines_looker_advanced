view: lineitems{
  sql_table_name: [looker_advanced_training.lineitems_transformation] ;;

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension_group: commit {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.commit_date ;;
  }
  dimension: discount_rate {
    type: number
    sql: ${TABLE}.discount_rate ;;
  }
  dimension: extended_price {
    type: number
    sql: ${TABLE}.extended_price ;;
  }
  dimension: line_number {
    type: number
    sql: ${TABLE}.line_number ;;
  }
  dimension: line_status {
    type: string
    sql: ${TABLE}.line_status ;;
  }
  dimension: order_key {
    type: number
    sql: ${TABLE}.order_key ;;
  }
  dimension: part_key {
    type: number
    sql: ${TABLE}.part_key ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension_group: receipt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.receipt_date ;;
  }
  dimension: return_flag {
    type: string
    sql: ${TABLE}.return_flag ;;
  }
  dimension_group: shipping {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipping_date ;;
  }
  dimension: shipping_instructions {
    type: string
    sql: ${TABLE}.shipping_instructions ;;
  }
  dimension: shipping_mode {
    type: string
    sql: ${TABLE}.shipping_mode ;;
  }
  dimension: supplier_key {
    type: number
    sql: ${TABLE}.supplier_key ;;
  }
  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
  }
}
