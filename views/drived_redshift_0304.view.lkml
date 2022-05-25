view: redshift_passenger_dataset_drived_table {
  derived_table: {
    interval_trigger: "5 minute"
    distribution_style: "all"
    indexes: ["dt_date"]
    explore_source: redshift_passenger_dataset {
      column: dt_date {
        field: redshift_passenger_dataset.dt_date
      }
      column: subway_line_cd {}
      column: clean_transported_cnt {}
      }
    }

  dimension: dt_date {
    type: date
  }
  dimension: subway_line_cd {
    type: number
  }
  measure: abs_clean_transported_cnt {
    type: sum
   sql:abs(clean_transported_cnt) ;;
  }
}
