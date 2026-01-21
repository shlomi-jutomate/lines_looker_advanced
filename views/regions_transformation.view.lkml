view: regions{
  sql_table_name: [looker_advanced_training.regions_transformation] ;;

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: region_key {
    type: number
    sql: ${TABLE}.region_key ;;
  }
  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [region_name]
  }
}
