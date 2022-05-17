view: map {
  sql_table_name: `project_b_team.subway_map` ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: store_location3 {
    type: location
    sql_latitude: ${TABLE}.lat ;;
    sql_longitude:${TABLE}.lng ;;
  }
  dimension: Station_name {
    type: string
    sql:${TABLE}.Station_name ;;
  }

 }
