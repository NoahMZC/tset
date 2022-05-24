view: drived_redshift_0304 {
  derived_table: {
    explore_source: redshifttable_0304 {
      column: dt_date {
        field: redshifttable_0304.dt_date
      }
      column: subway_line_cd {}
      derived_column: sum_passenger_cnt {
        sql: sum(passenger_cnt) ;;
      }
    }
  }
dimension: dt_date {
  type: date
}
dimension: subway_line_cd {
  type: number
}
measure: sum_passenger_cnt {
  type: number
}

}
