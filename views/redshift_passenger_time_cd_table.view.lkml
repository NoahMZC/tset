view: redshift_passenger_time_cd_table {
  sql_table_name: looker_dataset.redshift_passenger_cd ;;

  dimension: name {
    type: string
    primary_key: yes
    sql: ${TABLE}.name ;;
  }

  dimension: timecode {
    type: string
    sql: ${TABLE}.timecode ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
