view: nations{
  sql_table_name: `looker_advanced_training.nations_transformation` ;;

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }
  dimension: nation_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.nation_key ;;
  }
  dimension: nation_name {
    type: string
    sql: ${TABLE}.nation_name ;;
  }
  dimension: region_key {
    type: number
    sql: ${TABLE}.region_key ;;
  }
  measure: count {
    type: count
    approximate_threshold: 100000
    drill_fields: [nation_name]
  }
}
