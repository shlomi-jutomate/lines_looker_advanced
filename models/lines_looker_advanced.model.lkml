connection: "lines_looker_advanced_training"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: lines_looker_advanced_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: lines_looker_advanced_default_datagroup

# NOTE: please see https://cloud.google.com/looker/docs/r/sql/bigquery?version=25.20
# NOTE: for BigQuery specific considerations

explore: nations_transformation {}

explore: orders_transformation {}

explore: customers_transformation {}

explore: lineitems_transformation {
 join: orders_transformation {
    type: left_outer
    sql_on: ${lineitems_transformation.order_key} = ${orders_transformation.order_key} ;;
    relationship: many_to_one
  }
}

explore: suppliers_transformation {}

explore: partsupps_transformation {}

explore: parts_transformation {}

explore: regions_transformation {
  join: nations_transformation {
    type: left_outer
    sql_on: ${regions_transformation.region_key} = ${nations_transformation.region_key};;
    relationship: many_to_one
  }
}
