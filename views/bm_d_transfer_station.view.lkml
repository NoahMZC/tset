view: bm_d_transfer_station {
  sql_table_name: `project_b_team.bm_d_transfer_station`
    ;;

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: station_no_cd {
    type: string
    sql: ${TABLE}.station_no_cd ;;
  }

  dimension: subway_line_no_cd {
    type: string
    sql: ${TABLE}.subway_line_no_cd ;;
  }

  dimension: transfer {
    type: string
    sql: ${TABLE}.transfer ;;
  }

  dimension: transfer_line_cnt {
    type: number
    sql: ${TABLE}.transfer_line_cnt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
