  view: station_info2 {
    derived_table: {
      sql: SELECT
          IF(map.lat  IS NOT NULL AND map.lng  IS NOT NULL, CONCAT(IFNULL(CAST(map.lat  AS STRING), ''),',',IFNULL(CAST(map.lng  AS STRING), '')), NULL) AS map_store_location3,
          bm_d_transfer_station.station_nm  AS bm_d_transfer_station_station_nm,
          bm_d_transfer_station.station_no_cd  AS bm_d_transfer_station_station_no_cd,
          bm_d_transfer_station.subway_line_no_cd  AS bm_d_transfer_station_subway_line_no_cd,
          bm_d_transfer_station.transfer  AS bm_d_transfer_station_transfer,
          bm_d_transfer_station.transfer_line_cnt  AS bm_d_transfer_station_transfer_line_cnt
      FROM `project_b_team.bm_d_transfer_station`
           AS bm_d_transfer_station
      LEFT JOIN `project_b_team.subway_map`  AS map ON bm_d_transfer_station.station_nm=map.Station_name
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6
      ORDER BY
          1
       ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: map_store_location3 {
      type: string
      sql: ${TABLE}.map_store_location3 ;;
    }

    dimension: store_location3 {
      type: location
      sql_latitude: REGEXP_SUBSTR(${TABLE}.map_store_location3,'[^,]+', 1, 1) ;;
      sql_longitude: REGEXP_SUBSTR(${TABLE}.map_store_location3,'[^,]+', 1, 2) ;;
    }

    dimension: bm_d_transfer_station_station_nm {
      type: string
      sql: ${TABLE}.bm_d_transfer_station_station_nm ;;
    }

    dimension: bm_d_transfer_station_station_no_cd {
      type: string
      sql: ${TABLE}.bm_d_transfer_station_station_no_cd ;;
    }

    dimension: bm_d_transfer_station_subway_line_no_cd {
      type: string
      sql: ${TABLE}.bm_d_transfer_station_subway_line_no_cd ;;
    }

    dimension: bm_d_transfer_station_transfer {
      type: string
      sql: ${TABLE}.bm_d_transfer_station_transfer ;;
    }

    dimension: bm_d_transfer_station_transfer_line_cnt {
      type: number
      sql: ${TABLE}.bm_d_transfer_station_transfer_line_cnt ;;
    }

    set: detail {
      fields: [
        map_store_location3,
        bm_d_transfer_station_station_nm,
        bm_d_transfer_station_station_no_cd,
        bm_d_transfer_station_subway_line_no_cd,
        bm_d_transfer_station_transfer,
        bm_d_transfer_station_transfer_line_cnt
      ]
    }
  }
