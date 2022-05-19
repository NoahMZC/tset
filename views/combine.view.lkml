view: combine {
  sql_table_name:
  {% if _model._name == 'noah_0513.model' %}
  `project_b_team.bm_f_subway_passenger_dd`
  {% else %}
  rs.redshifttable
  {% endif %} ;;

  dimension: clean_transported_cnt {
    type: number
    sql:
      {% if _model._name == 'noah_0513.model' %}
      ${TABLE}.sunsusong_cnt
      {% else %}
      ${TABLE}.clean_transported_cnt
      {% endif %}  ;;
  }

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  dimension: foot_traffic_cnt {
    type: number
    sql:
        {% if _model._name == 'noah_0513.model' %}
        ${TABLE}.moving_passenger_cnt
        {% else %}
        ${TABLE}.foot_traffic_cnt
        {% endif %} ;;
  }

  dimension: getoff_passenger_cnt {
    type: number
    sql:
        {% if _model._name == 'noah_0513.model' %}
        ${TABLE}.get_off_cnt
        {% else %}
        ${TABLE}.getoff_passenger_cnt
        {% endif %} ;;
  }

  dimension: passenger_cnt {
    type: number
    sql:
        {% if _model._name == 'noah_0513.model' %}
        ${TABLE}.get_cnt
        {% else %}
        ${TABLE}.passenger_cnt
        {% endif %} ;;
  }

  dimension: passenger_type_cd {
    type: string
    sql:
        {% if _model._name == 'noah_0513.model' %}
        ${TABLE}.passenger_type_gb_cd
        {% else %}
        ${TABLE}.passenger_type_cd
        {% endif %} ;;
  }

  dimension: station_cd {
    type: number
    sql:
        {% if _model._name == 'noah_0513.model' %}
        ${TABLE}.station_no_cd
        {% else %}
        ${TABLE}.station_cd
        {% endif %} ;;
  }

  dimension: subway_line_cd {
    type: number
    sql:
        {% if _model._name == 'noah_0513.model' %}
        ${TABLE}.subway_line_no_cd
        {% else %}
        ${TABLE}.subway_line_cd
        {% endif %} ;;
  }

  dimension: tm_range_cd {
    type: number
    sql:
        {% if _model._name == 'noah_0513.model' %}
        ${TABLE}.time_gb_cd
        {% else %}
        ${TABLE}.tm_range_cd
        {% endif %} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
