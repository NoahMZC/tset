view: bm_f_subway_data_compare {
  sql_table_name: `project_b_team.bm_f_subway_data_compare`
    ;;

  dimension: col_nm {
    type: string
    sql: ${TABLE}.col_nm ;;
  }

  dimension: col_val {
    type: number
    sql: ${TABLE}.col_val ;;
  }

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

  measure: count {
    type: count
    drill_fields: []
  }
}
