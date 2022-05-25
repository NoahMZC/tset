view: create_pdt_bq {
  derived_table: {
    interval_trigger: "5 minute"
    create_process: {
      sql_step: CREATE TABLE ${SQL_TABLE_NAME}(
            calender date,
            get_cnt integer,
            get_out integer,
            sum_getting_getout integer
        )  ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME}(calender, get_cnt, get_out, sum_getting_getout)
                  select DATE(dt), sum(get_cnt), sum(get_off_cnt), sum(get_cnt+get_off_cnt)
                  from   bm_f_subway_passenger_dd
                  group by dt;;
    }
  }
  dimension: just_for_Create {
    sql: 1=1 ;;
  }
  dimension: date {
    type: date
    sql: calender ;;
  }
}
