view: dimension_measure {
  sql_table_name: `project_b_team.bm_f_subway_card_dd`
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

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
    label: "역명"
  }

  dimension: subway_line_nm {
    type: string
    sql: ${TABLE}.subway_line_nm ;;
    label: "호선명"
  }


  parameter: cut {
    type: number
    allowed_value: {
      label: "만 단위"
      value: "10000"
    }
    allowed_value: {
      label: "일 단위"
      value: "1"
    }
    label: "단위 수 선택"
  }

  parameter: getting {
    type:string
    allowed_value: {
      label: "탑승인원수"
      value: "get_cnt"
    }
    allowed_value: {
      label: "하차인원수"
      value: "get_off_cnt"
    }
    allowed_value: {
      label: "총 운송인원수"
      value: "moving_passenger_cnt"
    }
    allowed_value: {
      label: "순수송인원수"
      value: "sunsusong_cnt"
    }
    allowed_value: {
      label: "순승차비율"
      value: "순승차비율"
    }
    allowed_value: {
      label: "순유동유입비율"
      value: "순유동유입비율"
    }
    label: "탑승 선택"
  }

  parameter: Start_date {
    type: date
    description: "Use this field to select a date to filter results by."
  }
  parameter: End_date {
    type: date
    description: "Use this field to select a date to filter results by."
  }



  measure: sumeverything2 {
    type: sum
    sql:
      CASE
        WHEN {% parameter getting %} = 'get_cnt'
          THEN ${TABLE}.get_cnt/{% parameter cut %}
        WHEN {% parameter getting %} = 'get_off_cnt'
          THEN ${TABLE}.get_off_cnt/{% parameter cut %}
       WHEN {% parameter getting %} = 'moving_passenger_cnt'
          THEN ${TABLE}.moving_passenger_cnt/{% parameter cut %}
        WHEN {% parameter getting %} = 'sunsusong_cnt'
          THEN ${TABLE}.sunsusong_cnt/{% parameter cut %}
        WHEN {% parameter getting %} = '순승차비율'
          THEN (${TABLE}.sunsusong_cnt/${TABLE}.get_cnt)/{% parameter cut %}
        WHEN {% parameter getting %} = '순유동유입비율'
          THEN ((${TABLE}.get_off_cnt - ${TABLE}.get_cnt) / ${TABLE}.moving_passenger_cnt))/{% parameter cut %}
        ELSE 1
      END;;
    value_format: "0"
    label: "탑승량_measure"
  }


  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
