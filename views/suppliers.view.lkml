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
}
