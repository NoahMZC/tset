view: create_pdt_bq {
  derived_table: {
    interval_trigger: "5 minute"
    create_process: {
      sql_step: CREATE TABLE BGPDT(
            calender date,
            get_cnt integer,
            get_out integer,
            sum_getting_getout integer
        )  ;;
      sql_step: INSERT INTO BGPDT(calender, get_cnt, get_out, sum_getting_getout)
                  select DATE(dt), sum(get_cnt), sum(get_off_cnt), sum(get_cnt+get_off_cnt)
                  from   bm_f_subway_passenger_dd
                  group by dt;;
    }
  }
}
