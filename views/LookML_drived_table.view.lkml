view: LookML_drived_table {
  derived_table: {
    #interval_trigger: "5 minute"
    explore_source:bm_f_subway_passenger_dd{
      column: date_timestamp {
        field: bm_f_subway_passenger_dd.dt_date
      }
      column: station_no_cd {}
      column: get_cnt {}
      column: get_out {
        field:  bm_f_subway_passenger_dd.get_off_cnt
      }
      column: subway_line_no_name {}
      derived_column: sum_getting_getout {
        sql: get_cnt + get_out ;;
      }
    }
  }
  dimension: date {
    type: date
    label: "날짜"
    sql: ${TABLE}.date_timestamp ;;
  }
  dimension: subway_line_no_name {
    type: string
    label: "호선"
  }
  dimension: station_no_cd {
    type: string
    label: "역 번호"
  }
  measure: get_cnt {
    type: sum
    sql: ${TABLE}.get_cnt ;;
    label: "탑승인원"
  }
  measure: get_out {
    type: sum
    sql: ${TABLE}.get_out ;;
    label: "하차인원"
  }
  measure: sum_getting_getout {
    type: sum
    sql: ${TABLE}.sum_getting_getout ;;
    label: "탑승 인원 + 하차 인원"
  }
}

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }

# view: drived_table {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
