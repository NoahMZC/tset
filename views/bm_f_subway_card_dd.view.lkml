view: bm_f_subway_card_dd {
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
    label: "탑승 선택"
  }

  parameter: date {
    type:string
    allowed_value: {
      label: "일"
      value: "date"
    }
    allowed_value: {
      label: "주"
      value: "week"
    }
    allowed_value: {
      label: "월"
      value: "month"
    }
    allowed_value: {
      label: "년"
      value: "year"
    }
    label: "년/월/일 선택"
  }

  dimension: date1 {
    sql:
    {% if date._parameter_value == "'date'" %}
      ${TABLE}.dt
  {% endif %};;
  }


  parameter: Start_date {
    type: date
    description: "Use this field to select a date to filter results by."
  }
  parameter: End_date {
    type: date
    description: "Use this field to select a date to filter results by."
  }


  # measure: sumeverything {
  #   type: sum
  #   sql:
  #     CASE
  #       WHEN {% parameter getting %} = 'get_cnt' AND {% parameter cut %} = 10000
  #         THEN ${TABLE}.get_cnt/{% parameter cut %}
  #       WHEN {% parameter getting %} = 'get_cnt' AND {% parameter cut %} = 1
  #         THEN ${TABLE}.get_cnt
  #       WHEN {% parameter getting %} = 'get_off_cnt' AND {% parameter cut %} = 10000
  #         THEN ${TABLE}.get_off_cnt/10000
  #       WHEN {% parameter getting %} = 'get_off_cnt' AND {% parameter cut %} = 1
  #         THEN ${TABLE}.get_off_cnt
  #     WHEN {% parameter getting %} = 'moving_passenger_cnt' AND {% parameter cut %} = 10000
  #         THEN ${TABLE}.moving_passenger_cnt/10000
  #       WHEN {% parameter getting %} = 'moving_passenger_cnt' AND {% parameter cut %} = 1
  #         THEN ${TABLE}.moving_passenger_cnt
  #       WHEN {% parameter getting %} = 'sunsusong_cnt' AND {% parameter cut %} = 10000
  #         THEN ${TABLE}.sunsusong_cnt/10000
  #       WHEN {% parameter getting %} = 'sunsusong_cnt' AND {% parameter cut %} = 1
  #         THEN ${TABLE}.sunsusong_cnt
  #       ELSE 1
  #     END;;
  #   value_format: "0"
  #   label: "탑승량"
  # }

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
        ELSE 1
      END;;
    html:
    {% if getting._parameter_value == 'get_cnt' %}
      <font color="darkgreen">{{ rendered_value }}</font>
    {% elsif getting._parameter_value == 'get_off_cnt' %}
      <font color="darkred">{{ rendered_value }}</font>
    {% elsif getting._parameter_value == 'moving_passenger_cnt' %}
       <font color="darkred">{{ rendered_value }}</font>
    {% else %}
        <font color="darkgreen">{{ rendered_value }}</font>
    {% endif %};;
    value_format: "0"
    label: "탑승량_measure"
  }

  dimension: everything {
    type: number
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
        ELSE 1
      END;;
    html:
    {% if getting._parameter_value == 'get_cnt' %}
      <font color="darkgreen">{{ rendered_value }}</font>
    {% elsif getting._parameter_value == 'get_off_cnt' %}
      <font color="darkgreen">{{ rendered_value }}</font>
    {% elsif getting._parameter_value == 'moving_passenger_cnt' %}
       <font color="darkgreen">{{ rendered_value }}</font>
    {% else %}
        <font color="darkred">{{ rendered_value }}</font>
    {% endif %};;
    value_format: "0"
    label: "탑승수_dimension"
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

  # dimension: sunsusong_cnt {
  #   type: number
  #   sql: ${TABLE}.sunsusong_cnt ;;
  # }

  # parameter: test {
  #   type: string
  #   allowed_value: {
  #     label: "test123"
  #     value: "123"
  #   }
  #   allowed_value: {
  #     label: "test345"
  #     value: "345"
  #   }
  # }

  # parameter: cut_100000 {
  #   type: string
  #   allowed_value: {
  #     label: "10000원대"
  #     value: ""
  #   }
  #   allowed_value: {
  #     label: "test345"
  #     value: "345"
  #   }
  # }


  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
