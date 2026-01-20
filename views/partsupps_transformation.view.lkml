view: partsupps_transformation {
  sql_table_name: [looker_advanced_training.partsupps_transformation] ;;

  dimension: available_quantity {
    type: number
    sql: ${TABLE}.available_quantity ;;
  }
  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: part_key {
    type: number
    sql: ${TABLE}.part_key ;;
  }
  dimension: supplier_key {
    type: number
    sql: ${TABLE}.supplier_key ;;
  }
  dimension: supply_cost {
    type: number
    sql: ${TABLE}.supply_cost ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
  }
}
