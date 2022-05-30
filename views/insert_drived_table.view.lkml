view: insert_drived_table {
    derived_table: {
      sql:
      SELECT
        1 AS seq, CAST('2022-01-01' AS DATE) AS dt, 1 AS subway_line_nm, 150 AS station_no, '서울역' AS station_nm, '승차' AS get_get_off_gb, '일반' AS passenger_type_gb, 71 AS until06, 88 AS cnt06, 166 AS cnt07, 359 AS cnt08, 440 AS cnt09, 659 AS cnt10, 975 AS cnt11, 1222 AS cnt12, 1229 AS cnt13, 1026 AS cnt14, 1244 AS cnt15, 1366 AS cnt16, 1314 AS cnt17, 1157 AS cnt18, 913 AS cnt19, 795 AS cnt20, 1193 AS cnt21, 752 AS cnt22, 203 AS over23
      UNION ALL
      SELECT
        2 AS seq, CAST('2022-01-01' AS DATE) AS dt, 1 AS subway_line_nm, 150 AS station_no, '서울역' AS station_nm, '승차' AS get_get_off_gb, '어린이' AS passenger_type_gb, 1 AS until06, 0 AS cnt06, 0 AS cnt07, 1 AS cnt08, 0 AS cnt09, 3 AS cnt10, 10 AS cnt11, 12 AS cnt12, 12 AS cnt13, 13 AS cnt14, 9 AS cnt15, 12 AS cnt16, 11 AS cnt17, 8 AS cnt18, 3 AS cnt19, 5 AS cnt20, 5 AS cnt21, 5 AS cnt22, 0 AS over23
      UNION ALL
      SELECT
        3 AS seq, CAST('2022-01-01' AS DATE) AS dt, 1 AS subway_line_nm, 150 AS station_no, '서울역' AS station_nm, '승차' AS get_get_off_gb, '중고생' AS passenger_type_gb, 0 AS until06, 0 AS cnt06, 0 AS cnt07, 1 AS cnt08, 0 AS cnt09, 2 AS cnt10, 0 AS cnt11, 0 AS cnt12, 0 AS cnt13, 1 AS cnt14, 1 AS cnt15, 0 AS cnt16, 0 AS cnt17, 0 AS cnt18, 0 AS cnt19, 0 AS cnt20, 2 AS cnt21, 0 AS cnt22, 0 AS over23
      UNION ALL
      SELECT
        4 AS seq, CAST('2022-01-01' AS DATE) AS dt, 1 AS subway_line_nm, 150 AS station_no, '서울역' AS station_nm, '승차' AS get_get_off_gb, '청소년' AS passenger_type_gb, 1 AS until06, 1 AS cnt06, 2 AS cnt07, 10 AS cnt08, 31 AS cnt09, 38 AS cnt10, 43 AS cnt11, 33 AS cnt12, 37 AS cnt13, 33 AS cnt14, 26 AS cnt15, 36 AS cnt16, 38 AS cnt17, 40 AS cnt18, 27 AS cnt19, 13 AS cnt20, 31 AS cnt21, 13 AS cnt22, 10 AS over23
      UNION ALL
      SELECT
        5 AS seq, CAST('2022-01-01' AS DATE) AS dt, 1 AS subway_line_nm, 150 AS station_no, '서울역' AS station_nm, '승차' AS get_get_off_gb, '우대권' AS passenger_type_gb, 46 AS until06, 47 AS cnt06, 40 AS cnt07, 65 AS cnt08, 113 AS cnt09, 167 AS cnt10, 242 AS cnt11, 238 AS cnt12, 217 AS cnt13, 241 AS cnt14, 239 AS cnt15, 253 AS cnt16, 217 AS cnt17, 145 AS cnt18, 112 AS cnt19, 81 AS cnt20, 94 AS cnt21, 37 AS cnt22, 15 AS over23
      UNION ALL
      SELECT
        6 AS seq, CAST('2022-01-01' AS DATE) AS dt, 1 AS subway_line_nm, 150 AS station_no, '서울역' AS station_nm, '승차' AS get_get_off_gb, '영어 일반' AS passenger_type_gb, 0 AS until06, 0 AS cnt06, 0 AS cnt07, 2 AS cnt08, 0 AS cnt09, 1 AS cnt10, 0 AS cnt11, 2 AS cnt12, 2 AS cnt13, 3 AS cnt14, 1 AS cnt15, 0 AS cnt16, 2 AS cnt17, 0 AS cnt18, 0 AS cnt19, 1 AS cnt20, 0 AS cnt21, 0 AS cnt22, 0 AS over23

      ;;
    }

    dimension: seq {
      type: number
      sql: ${TABLE}.seq ;;
    }

    dimension: dt {
      type: date
      datatype: date
      sql: ${TABLE}.dt ;;
    }

    dimension: subway_line_nm {
      type: number
      sql: ${TABLE}.subway_line_nm ;;
    }

    dimension: station_no {
      type: number
      sql: ${TABLE}.station_no ;;
    }

    dimension: station_nm {
      type: string
      sql: ${TABLE}.station_nm ;;
    }

    dimension: get_get_off_gb {
      type: string
      sql: ${TABLE}.get_get_off_gb ;;
    }

    dimension: passenger_type_gb {
      type: string
      sql: ${TABLE}.passenger_type_gb ;;
    }

    dimension: until06 {
      type: number
      sql: ${TABLE}.until06 ;;
    }

    dimension: cnt06 {
      type: number
      sql: ${TABLE}.cnt06 ;;
    }

    dimension: cnt07 {
      type: number
      sql: ${TABLE}.cnt07 ;;
    }

    dimension: cnt08 {
      type: number
      sql: ${TABLE}.cnt08 ;;
    }

    dimension: cnt09 {
      type: number
      sql: ${TABLE}.cnt09 ;;
    }

    dimension: cnt10 {
      type: number
      sql: ${TABLE}.cnt10 ;;
    }

    dimension: cnt11 {
      type: number
      sql: ${TABLE}.cnt11 ;;
    }

    dimension: cnt12 {
      type: number
      sql: ${TABLE}.cnt12 ;;
    }

    dimension: cnt13 {
      type: number
      sql: ${TABLE}.cnt13 ;;
    }

    dimension: cnt14 {
      type: number
      sql: ${TABLE}.cnt14 ;;
    }

    dimension: cnt15 {
      type: number
      sql: ${TABLE}.cnt15 ;;
    }

    dimension: cnt16 {
      type: number
      sql: ${TABLE}.cnt16 ;;
    }

    dimension: cnt17 {
      type: number
      sql: ${TABLE}.cnt17 ;;
    }

    dimension: cnt18 {
      type: number
      sql: ${TABLE}.cnt18 ;;
    }

    dimension: cnt19 {
      type: number
      sql: ${TABLE}.cnt19 ;;
    }

    dimension: cnt20 {
      type: number
      sql: ${TABLE}.cnt20 ;;
    }

    dimension: cnt21 {
      type: number
      sql: ${TABLE}.cnt21 ;;
    }

    dimension: cnt22 {
      type: number
      sql: ${TABLE}.cnt22 ;;
    }

    dimension: over23 {
      type: number
      sql: ${TABLE}.over23 ;;
    }

    measure: count {
      type: count
    }
}
