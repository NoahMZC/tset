connection: "0519_redshift"

# include all the views
include: "/views/**/*.view"

datagroup: 0519_redshift_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: 0519_redshift_test_default_datagroup

explore: red_passenger_cd {}

explore: redshifttable {}
