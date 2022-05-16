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
      value: "탑승인원수"
    }
    allowed_value: {
      label: "하차인원수"
      value: "하차인원수"
    }
    allowed_value: {
      label: "총 운송인원수"
      value: "총 운송인원수"
    }
    allowed_value: {
      label: "순수송인원수"
      value: "순수송인원수"
    }
    allowed_value: {
      label: "순승차비율"
      value: "순승차비율"
    }
    allowed_value: {
      label: "순유동유입비율"
      value: "순유동유입비율"
    }
    label: "Measure 선택"
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
        WHEN {% parameter getting %} = '탑승인원수'
          THEN ${TABLE}.get_cnt/{% parameter cut %}
        WHEN {% parameter getting %} = '하차인원수'
          THEN ${TABLE}.get_off_cnt/{% parameter cut %}
       WHEN {% parameter getting %} = '총 운송인원수'
          THEN abs(${TABLE}.moving_passenger_cnt)/{% parameter cut %}
        WHEN {% parameter getting %} = '순수송인원수'
          THEN ${TABLE}.sunsusong_cnt/{% parameter cut %}
        WHEN {% parameter getting %} = '순승차비율'
          THEN (${TABLE}.sunsusong_cnt/${TABLE}.get_cnt)/{% parameter cut %}
        WHEN {% parameter getting %} = '순유동유입비율'
          THEN ((${TABLE}.get_off_cnt - ${TABLE}.get_cnt) / abs(${TABLE}.moving_passenger_cnt))/{% parameter cut %}
        ELSE 1
      END;;
    value_format: "0"
    label: "Measure"
  }

  parameter: test {
    type: string
    allowed_value: {label: "기준일자" value: "기준일자"}
    allowed_value: {label: "주" value: "주"}
    allowed_value: {label: "기준월" value: "기준월"}
    allowed_value: {label: "분기" value: "분기"}
    allowed_value: {label: "호선" value: "호선" }
    allowed_value: {label: "역" value: "역" }
    label: "Dimension 선택"
  }

  dimension: test1 {
    type: string
    sql:
      CASE
        WHEN {% parameter test %} = '기준일자'
          THEN STRING(${TABLE}.dt)
         WHEN {% parameter test %} = '주'
          THEN (FORMAT_DATE('%F', DATE_TRUNC(dimension_measure.dt , WEEK(MONDAY))))
         WHEN {% parameter test %} = '기준월'
          THEN (FORMAT_DATE('%Y-%m', dimension_measure.dt ))
         WHEN {% parameter test %} = '분기'
          THEN (FORMAT_DATE('%Y-%m', DATE_TRUNC(dimension_measure.dt , QUARTER)))
        WHEN {% parameter test %} = '호선'
          THEN ${TABLE}.subway_line_nm
       WHEN {% parameter test %} = '역'
          THEN ${TABLE}.station_nm
        ELSE "1"
      END;;
    label: "Dimension"
  }

  dimension: st_dt {
  type: string
  sql:DATE({% parameter Start_date %}) ;;
   }
  dimension: end_dt {
    type: string
    sql:DATE({% parameter End_date %}) ;;
  }

  dimension: check {
    type: string
    sql: 1;;
    html:
      <p style="color: white; background-color: gray; font-size:100%; text-align:center">
      {{dimension_measure.st_dt}}부터 {{dimension_measure.end_dt}} 까지.
      <br>
      Dimension : {% parameter test %} , Measure : {% parameter getting %}
      </p>;;
    label: "check"
  }

}
