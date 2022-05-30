view: raw_bm_f_subway_dd {

  sql_table_name: `project_b_team.bm_f_subway_passenger_dd`
    ;;

  dimension: date {
    type: date
    sql: ${TABLE}.dt ;;
  }

  dimension: subway_line_nm {
    type: string
    sql: ${TABLE}.subway_line_nm ;;
  }
  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }
  measure: get_cnt {
    type: number
    sql: ${TABLE}.get_cnt ;;
  }
  measure: get_off_cnt {
    type: number
    sql: ${TABLE}.get_off_cnt ;;
  }
  measure: moving_passenger_cnt {
    type: number
    sql: ${TABLE}.moving_passenger_cnt ;;
  }
  measure: sunsusong_cnt {
    type: number
    sql: ${TABLE}.sunsusong_cnt ;;
  }
}
