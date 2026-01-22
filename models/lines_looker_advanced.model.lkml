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

explore: nations {
  join: suppliers{
    type: left_outer
    sql_on: ${nations.nation_key} = ${suppliers.supplier_nation_key};;
    relationship: one_to_many
  }

  join: customers{
    type: left_outer
    sql_on: ${nations.nation_key} = ${customers.nation_key} ;;
    relationship: one_to_many
  }
}

explore: orders {
  join: lineitems {
    type: left_outer
    sql_on: ${lineitems.order_key} = ${orders.order_key} ;;
    relationship: one_to_many
  }
}

explore: customers{
  join: orders {
    type: left_outer
    sql_on: ${customers.customer_key} = ${orders.customer_key} ;;
    relationship: one_to_many
  }
}

explore: lineitems {}


explore: partsupps{
  join: lineitems{
    type: left_outer
    sql_on: ${partsupps.part_key} = ${lineitems.part_key} ;;
    relationship: one_to_many
  }
}

explore: parts{
  join: partsupps{
    type: left_outer
    sql_on: ${parts.part_key} = ${partsupps.part_key} ;;
    relationship: one_to_many
  }
}

explore: regions {
  join: nations {
    type: left_outer
    sql_on: ${regions.region_key} = ${nations.region_key};;
    relationship: one_to_many
  }
}

explore: suppliers {
  extends: [suppliers]
  # persist_with: test_no_pdt
  join: top_n_nations {
    view_label: "Top N Ranking"
    type: inner
    relationship: many_to_one
    sql_on: ${suppliers.supplier_nation_key} = ${top_n_nations.supplier_nation_key} ;;
  }

  join: partsupps{
    type: left_outer
    sql_on:  ${suppliers.supplier_key} = ${partsupps.supplier_key} ;;
    relationship: one_to_many
  }

  join: nations {
    type: left_outer
    sql_on:  ${suppliers.supplier_nation_key} = ${nations.nation_key} ;;
    relationship: many_to_one
  }
}
