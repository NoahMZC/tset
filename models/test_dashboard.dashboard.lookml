- dashboard: test_demension_measrue123
  title: DashBoard 테스트
  layout: newspaper
  preferred_viewer: dashboards-next
  description: '테스트 중입니다.'
  refresh: hours
  embed_style:
    background_color: "black"
    title_color: "white"
    tile_background_color: "gray"
    tile_text_color: "black"
  elements:
  - title: test_demension_measrue
    name: test_demension_measrue
    model: noah_0513
    explore: dimension_measure
    type: looker_column
    fields: [dimension_measure.sumeverything2, dimension_measure.test1]
    filters: {}
    sorts: [dimension_measure.test1]
    limit: 500
    query_timezone: Asia/Seoul
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Measure 선택: dimension_measure.getting
      단위 수 선택: dimension_measure.cut
      End Date: dimension_measure.End_date
      Start Date: dimension_measure.Start_date
      Dimension 선택: dimension_measure.test
    row: 3
    col: 0
    width: 24
    height: 7
  - title: New Tile
    name: New Tile
    model: noah_0513
    explore: dimension_measure
    type: single_value
    fields: [dimension_measure.check]
    filters: {}
    sorts: [dimension_measure.check]
    limit: 500
    query_timezone: Asia/Seoul
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Measure 선택: dimension_measure.getting
      단위 수 선택: dimension_measure.cut
      End Date: dimension_measure.End_date
      Start Date: dimension_measure.Start_date
      Dimension 선택: dimension_measure.test
    row: 0
    col: 0
    width: 24
    height: 3
  filters:
  - name: Dimension 선택
    title: Dimension 선택
    type: field_filter
    default_value: 기준일자
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: noah_0513
    explore: dimension_measure
    listens_to_filters: []
    field: dimension_measure.test
  - name: Measure 선택
    title: Measure 선택
    type: field_filter
    default_value: 순유동유입비율
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    model: noah_0513
    explore: dimension_measure
    listens_to_filters: []
    field: dimension_measure.getting
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 2020/05/16
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
    model: noah_0513
    explore: dimension_measure
    listens_to_filters: []
    field: dimension_measure.Start_date
  - name: End Date
    title: End Date
    type: field_filter
    default_value: 2022/05/16
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
    model: noah_0513
    explore: dimension_measure
    listens_to_filters: []
    field: dimension_measure.End_date
  - name: 단위 수 선택
    title: 단위 수 선택
    type: field_filter
    default_value: '1'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: noah_0513
    explore: dimension_measure
    listens_to_filters: []
    field: dimension_measure.cut
