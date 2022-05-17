view: bm_f_subway_passenger_dd {
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

  measure: get_cnt {
    type: sum
    sql: ${TABLE}.get_cnt ;;
    label: "탑승인원"
  }

  measure: get_off_cnt {
    type: sum
    sql: ${TABLE}.get_off_cnt ;;
    label: "하차인원"
  }

  measure: moving_passenger_cnt {
    type: sum
    sql: ${TABLE}.moving_passenger_cnt ;;
    label: "유동인원"
  }
  measure: sunsusong_cnt {
    type: sum
    sql: ${TABLE}.sunsusong_cnt ;;
    label: "순수송인원"
  }

  dimension: time_gb_cd {
    type: string
    sql: ${TABLE}.time_gb_cd ;;
  }

  # dimension: get_cnt {
  #   type: number
  #   sql: ${TABLE}.get_cnt ;;
  # }

  # dimension: get_off_cnt {
  #   type: number
  #   sql: ${TABLE}.get_off_cnt ;;
  # }

  # dimension: moving_passenger_cnt {
  #   type: number
  #   sql: ${TABLE}.moving_passenger_cnt ;;
  # }

  dimension: passenger_type_gb_cd {
    type: string
    sql: ${TABLE}.passenger_type_gb_cd ;;
  }

  dimension: station_no_cd {
    type: string
    sql: ${TABLE}.station_no_cd ;;
  }

  dimension: subway_line_no_cd {
    type: string
    sql: ${TABLE}.subway_line_no_cd ;;
  }

  dimension: subway_line_no_name {
    type: string
    sql: concat(right(${TABLE}.subway_line_no_cd,1),'호선') ;;
  }


  # dimension: sunsusong_cnt {
  #   type: number
  #   sql: ${TABLE}.sunsusong_cnt ;;
  # }



  measure: count {
    type: count
    drill_fields: []
  }
}
