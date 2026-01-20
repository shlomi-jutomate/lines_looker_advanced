view: parts_transformation {
  sql_table_name: [looker_advanced_training.parts_transformation] ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: container {
    type: string
    sql: ${TABLE}.container ;;
  }
  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }
  dimension: part_key {
    type: number
    sql: ${TABLE}.part_key ;;
  }
  dimension: part_name {
    type: string
    sql: ${TABLE}.part_name ;;
  }
  dimension: part_retail_price {
    type: number
    sql: ${TABLE}.part_retail_price ;;
  }
  dimension: part_size {
    type: number
    sql: ${TABLE}.part_size ;;
  }
  dimension: part_type {
    type: string
    sql: ${TABLE}.part_type ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [part_name]
  }
}
