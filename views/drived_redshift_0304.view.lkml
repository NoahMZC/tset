view: drived_redshift_0304 {
  derived_table: {
    explore_source: redshifttable_0304 {
      column: dt_date {
        field: bm_f_subway_passenger_dd.dt_date
      }
      column: subway_line {}
      derived_column: sum_passenger_cnt {
        sql: sum(passenger_cnt) ;;
      }
    }
  }
dimension: dt_date {
  type: date
}
dimension: subway_line {
  type: number
}
measure: sum_passenger_cnt {
  type: number
}

}
