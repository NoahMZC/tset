view: SQL_drived_table { #View 이름
  derived_table: {       #drived_table을 선언합니다.
    sql:                 --SQL결과를 View로 사용합니다.
    select dt, get_cnt   --SQL문을 작성합니다.
    from
    bm_f_subway_passenger_dd;;
  }
  dimension_group: dt { #Dimension, Measure를 선언합니다.
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
    sql: get_cnt ;; #Column명만 선언해도 됩니다.
    label: "탑승인원"
  }
}
