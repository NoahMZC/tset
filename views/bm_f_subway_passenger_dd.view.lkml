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
    group_label: "인원수"
    group_item_label: "탑승수"
  }

  measure: get_off_cnt {
    type: sum
    sql: ${TABLE}.get_off_cnt ;;
    label: "하차인원"
    group_label: "인원수"
    group_item_label: "하차수"
  }

  measure: moving_passenger_cnt {
    type: sum
    sql: ${TABLE}.moving_passenger_cnt ;;
    label: "유동인원"
    group_label: "인원수"
    group_item_label: "유동수"
  }
  measure: sunsusong_cnt {
    type: sum
    sql: ${TABLE}.sunsusong_cnt ;;
    filters: [bm_f_subway_passenger_dd.subway_line_no_cd: "02" ]
    label: "순수송인원"
    group_label: "인원수"
    group_item_label: "순수송"
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
    sql: concat(right(${TABLE}.subway_line_no_cd,1),'호선');;
    drill_fields:[station_no_cd]
  }


  # dimension: sunsusong_cnt {
  #   type: number
  #   sql: ${TABLE}.sunsusong_cnt ;;
  # }



  measure: count {
    type: count
    drill_fields: []
  }

  measure: count2 {
    type: count
    drill_fields: [user_details*]
  }
  set: user_details {
    fields: [station_no_cd, station_no_cd, passenger_type_gb_cd]
  }
}
