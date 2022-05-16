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

explore: bm_d_transfer_station {}

explore: bm_d_calender_dt {}

explore: bm_d_passenger_type_cd {}

explore: bm_f_subway_card_dd {
  sql_always_where: ${bm_f_subway_card_dd.dt_date} >=DATE({% parameter bm_f_subway_card_dd.Start_date %})
                  AND ${bm_f_subway_card_dd.dt_date} <=DATE({% parameter bm_f_subway_card_dd.End_date %});;
}

explore: dimension_measure {
   sql_always_where: ${dimension_measure.dt_date} >=DATE({% parameter dimension_measure.Start_date %})
    AND ${dimension_measure.dt_date} <=DATE({% parameter dimension_measure.End_date %});;
}
explore: bm_f_subway_passenger_dd {}
