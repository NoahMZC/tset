connection: "0513_noah"

# include all the views
include: "/views/*.view"
include: "/**/*.dashboard"
datagroup: noah_0513_default_datagroup {
  #sql_trigger: SELECT MAX(id) FROM bm_f_subway_card_dd
  #persist_for: "37min";;
  max_cache_age: "1 hour"
}

persist_with: noah_0513_default_datagroup

explore: bm_d_time_range_cd {}

explore: bm_d_transfer_station {
  join: map {
    from: map
    type: left_outer
    sql_on: ${bm_d_transfer_station.station_nm}=${map.Station_name} ;;
    relationship: one_to_one
  }
}

explore: bm_d_calender_dt {}

#explore: bm_d_passenger_type_cd {}

explore: bm_f_subway_card_dd {
  sql_always_where: ${bm_f_subway_card_dd.dt_date} >=DATE({% parameter bm_f_subway_card_dd.Start_date %})
                  AND ${bm_f_subway_card_dd.dt_date} <=DATE({% parameter bm_f_subway_card_dd.End_date %});;
}

explore: dimension_measure {
   sql_always_where: ${dimension_measure.dt_date} >=DATE({% parameter dimension_measure.Start_date %})
    AND ${dimension_measure.dt_date} <=DATE({% parameter dimension_measure.End_date %});;
}

explore: drived_table{}
explore: bm_f_subway_passenger_dd {
  join: station_info2 {
    from:  station_info2
      # {join: map
      #     {sql_table_name: `project_b_team.subway_map`
      #       type: left_outer
      #       sql_on: ${station_info.station_nm}=${TABLE}.Station_name ;;
      #       relationship: one_to_one
      #     }
      # }
    type: left_outer
    sql_on: ${bm_f_subway_passenger_dd.subway_line_no_cd} = ${station_info2.bm_d_transfer_station_subway_line_no_cd}
            AND ${bm_f_subway_passenger_dd.station_no_cd} = ${station_info2.bm_d_transfer_station_station_no_cd};;
            relationship: many_to_one
  }
  join: passenger_info {
    from: bm_d_passenger_type_cd
    type: left_outer
    sql_on: ${bm_f_subway_passenger_dd.passenger_type_gb_cd} =${passenger_info.cd} ;;
    relationship: many_to_one
  }
}
