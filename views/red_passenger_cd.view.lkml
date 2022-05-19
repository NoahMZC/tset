view: red_passenger_cd {
  sql_table_name: rs.passenger_cd ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: timecode {
    type: number
    sql: ${TABLE}.timecode ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
