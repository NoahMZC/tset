view: red_passenger_cd {
  sql_table_name: looker_dataset.redshift_passenger_cd ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: timecode {
    type: number
    primary_key: yes
    sql: ${TABLE}.timecode ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
