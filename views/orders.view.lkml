view: orders{
  sql_table_name: `looker_advanced_training.orders_transformation` ;;

  dimension: clerk {
    type: string
    sql: ${TABLE}.clerk ;;
  }
  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: customer_key {
    type: number
    sql: ${TABLE}.customer_key ;;
  }
  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }
  dimension: order_key {
    type: number
    sql: ${TABLE}.order_key ;;
  }
  dimension: order_priority {
    type: string
    sql: ${TABLE}.order_priority ;;
  }
  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }
  dimension: ship_priority {
    type: number
    sql: ${TABLE}.ship_priority ;;
  }
  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
  }
}
