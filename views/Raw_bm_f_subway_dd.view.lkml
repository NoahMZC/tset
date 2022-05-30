view: raw_bm_f_subway_dd {
  sql_table_name: `project_b_team.bm_f_subway_card_dd` ;;
  dimension: dt {
    type: date
  }
  dimension: subway_line_nm {
    type: string
  }
  dimension: station_nm {
    type: string
  }
  measure: get_cnt {
    type: sum
  }
  measure: get_off_cnt {
    type: sum
  }
  measure: moving_passenger_cnt {
    type: sum
  }
  measure: sunsusong_cnt {
    type: sum
  }
}
