view: depend_bqpdt {
 sql_table_name: looker_pdt_dataset.BGPDT ;;
  dimension: calendar {
    type: date
    sql: ${TABLE}.calender ;;
  }
  measure: sum_getting_getout {
    type: sum
    sql: ${TABLE}.sum_getting_getout ;;
  }
}
