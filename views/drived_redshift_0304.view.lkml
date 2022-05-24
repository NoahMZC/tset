view: drived_redshift_0304 {
  derived_table: {
    interval_trigger: "30 minute"
    explore_source: redshifttable_0304 {
      column: dt_date {
        field: redshifttable_0304.dt_date
      }
      column: subway_line_cd {}
      column: clean_transported_cnt {}
      # derived_column: abs_clean_transported_cnt {
      #   sql: abs(clean_transported_cnt) ;;
      #}
    }
    distribution_style: all
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
