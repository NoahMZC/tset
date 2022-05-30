view: raw_bm_f_subway_dd {

  sql_table_name: `project_b_team.bm_f_subway_passenger_dd`
    ;;

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  dimension: subway_line_nm {
    type: string
  }
  dimension: station_nm {
    type: string
  }
  measure: get_cnt {
    type: number
  }
  measure: get_off_cnt {
    type: number
  }
  measure: moving_passenger_cnt {
    type: number
  }
  measure: sunsusong_cnt {
    type: number
  }

}
