- dashboard: 1_system_overview
  title: "(1) System Overview - iot-poc"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  refresh: 1 minute
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"\n\theight: 54px; \n\tbackground-color: #fff; \n\tcolor:\
      \ #5f6368; \n\tborder-radius: 54px; \n\tborder: solid 1px #5f6368; \n\tfont-family:\
      \ Google Sans,Noto Sans,Noto Sans JP,Noto Sans KR,Noto Naskh Arabic,Noto Sans\
      \ Thai,Noto Sans Hebrew,Noto Sans Bengali,sans-serif; \n\tpadding: 12px;\">\n\
      <span style=\"\n\twidth: 38px;\n\theight: 38px; \n\tborder-radius: 60px; \n\t\
      background-color: white; \n\tdisplay:table-cell; \n\tvertical-align:middle;\
      \ \n\ttext-align:center; \n\tmargin-right: 12px; \n\tfloat: left;\">\n<img width=\"\
      16px\" src=\"https://storage.googleapis.com/brechtv/Looker_Favicon_32x32%403x.png\"\
      />\n</span>\n\n<span style=\"\n\tpadding: 4px; \n\tfloat:left;\">\n\t<h1 style=\"\
      margin-top:0;\n\t\tcolor: #6E6E6E; \n\tline-height: 1.2rem;\">\n\t\tSystem Overview\n\
      \t</h1>\n</span>\n<span style=\"padding: 4px; float:right;\">\n\t<a style=\"\
      background-color: #fff; color: #5f6368; padding: 5px 10px;\" href=\"https://badalio.cloud.looker.com/boards/3\"\
      >Home</a>\n\t<a style=\"background-color: #fff; color: #5f6368; padding: 5px\
      \ 10px;\" href=\"https://badalio.cloud.looker.com/explore/facilities-demo/measurements\"\
      >Explore</a>\n\t<a style=\"background-color: #fff; color: #5f6368; padding:\
      \ 5px 10px;\" href=\"https://badalio.ca.looker.com/dashboards-next/12?Property%20Measured=flowrate&Device%20ID=%22Coriolis_01%22\"\
      >Indicators</a>\n\t<a style=\"background-color: #fff; color: #5f6368; padding:\
      \ 5px 10px;\" href=\"https://badalio.ca.looker.com/dashboards-next/13?Report+Date+Range=1+month&Comparison+Period=Period\"\
      >Report</a>\n</span>\n\n<div>"
    row: 0
    col: 0
    width: 24
    height: 2
  - title: New Tile
    name: New Tile
    model: iot-poc
    explore: measurements
    type: single_value
    fields: [assets.count_of_assets]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Count of Assets
    series_types: {}
    defaults_version: 1
    refresh: 1 day
    listen:
      Timestamp Date: measurements.timestamp_date
    row: 6
    col: 8
    width: 4
    height: 4
  - title: New Tile
    name: New Tile (2)
    model: iot-poc
    explore: measurements
    type: single_value
    fields: [device_connections.count_of_field_meter_tags]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#333eb5"
    single_value_title: Count of Field Meters
    series_types: {}
    defaults_version: 1
    refresh: 1 day
    listen:
      Timestamp Date: measurements.timestamp_date
    row: 10
    col: 8
    width: 4
    height: 4
  - title: Assets (Past 7 Days)
    name: Assets (Past 7 Days)
    model: iot-poc
    explore: measurements
    type: looker_grid
    fields: [assets.asset_id, assets.asset_type, measurements.property_measured, paths.designation,
      measurements.average_value]
    pivots: [measurements.property_measured, paths.designation]
    filters:
      measurements.property_measured: temperature,pressure,flowrate,density
    sorts: [assets.asset_id 0, measurements.property_measured, paths.designation]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: keyera
      palette_id: keyera-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: true
    series_cell_visualizations:
      measurements.total_value:
        is_active: true
        palette:
          palette_id: keyera-sequential-0
          collection_id: keyera
    defaults_version: 1
    refresh: 1 day
    listen:
      Timestamp Date: measurements.timestamp_date
    row: 2
    col: 8
    width: 16
    height: 4
  - title: Locations
    name: Locations
    model: iot-poc
    explore: measurements
    type: looker_map
    fields: [assets.asset_id, assets.asset_type, assets.coordinates, devices.count_of_devices]
    sorts: [assets.asset_id]
    limit: 500
    query_timezone: UTC
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: metric_imperial
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: fixed
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 51.09840169128706
    map_longitude: -113.86239051818849
    map_zoom: 13
    map_marker_radius_fixed: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    defaults_version: 1
    series_types: {}
    refresh: 1 day
    listen:
      Timestamp Date: measurements.timestamp_date
    row: 6
    col: 0
    width: 8
    height: 8
  - title: "% Events by Asset"
    name: "% Events by Asset"
    model: iot-poc
    explore: measurements
    type: looker_pie
    fields: [events_summary_view.count_of_events, assets.asset_id]
    sorts: [events_summary_view.count_of_events desc]
    limit: 500
    query_timezone: UTC
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: false
    series_colors: {}
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Timestamp Date: events_summary_view.start_date
    row: 28
    col: 16
    width: 8
    height: 6
  - title: List of Events
    name: List of Events
    model: iot-poc
    explore: events_summary_view
    type: looker_grid
    fields: [events_summary_view.device_id, paths.field_meter_tag, events_summary_view.event_type,
      events_summary_view.property_measured, events_summary_view.severity, events_summary_view.start_time,
      events_summary_view.end_time, events_summary_view.seconds_of_event_duration,
      events_summary_view.event_id, events_summary_view.comments, measurements_raw_events.minimum_value,
      measurements_raw_events.maximum_value]
    sorts: [events_summary_view.start_time desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      measurements_raw_events.minimum_value:
        is_active: false
    defaults_version: 1
    series_column_widths:
      events_summary_view.event_id: 138
    listen:
      Timestamp Date: events_summary_view.start_date
    row: 20
    col: 0
    width: 16
    height: 8
  - title: "% Events by Severity"
    name: "% Events by Severity"
    model: iot-poc
    explore: events_summary_view
    type: looker_pie
    fields: [events_summary_view.count_of_events, events_summary_view.severity]
    sorts: [events_summary_view.count_of_events desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
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
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
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
    defaults_version: 1
    listen:
      Timestamp Date: events_summary_view.start_date
    row: 28
    col: 0
    width: 8
    height: 6
  - title: "% Events by Device"
    name: "% Events by Device"
    model: iot-poc
    explore: events_summary_view
    type: looker_pie
    fields: [events_summary_view.count_of_events, events_summary_view.device_id]
    sorts: [events_summary_view.count_of_events desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: keyera
      palette_id: keyera-categorical-0
      options:
        steps: 5
    series_colors: {}
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
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
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
    defaults_version: 1
    listen:
      Timestamp Date: events_summary_view.start_date
    row: 28
    col: 8
    width: 8
    height: 6
  - title: Event Timeline
    name: Event Timeline
    model: iot-poc
    explore: events_summary_view
    type: looker_timeline
    fields: [paths.field_meter_tag, events_summary_view.event_type, events_summary_view.start_minute,
      events_summary_view.end_minute, events_summary_view.severity_level]
    sorts: [paths.field_meter_tag]
    limit: 500
    groupBars: true
    labelSize: 10pt
    showLegend: true
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      custom:
        id: d4b2888c-f76d-1cc7-a1fd-4d04f02eb54d
        label: Custom
        type: continuous
        stops:
        - color: "#fc0d31"
          offset: 0
        - color: "#dbd630"
          offset: 50
        - color: "#215AC8"
          offset: 100
      options:
        steps: 5
    valueFormat: yyyy-mm-dd (hh:mm)
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    listen:
      Timestamp Date: events_summary_view.start_date
    row: 14
    col: 0
    width: 24
    height: 6
  - title: Field Meters at Facilities/Assets
    name: Field Meters at Facilities/Assets
    model: iot-poc
    explore: measurements
    type: looker_grid
    fields: [assets.asset_id, assets.asset_type, device_connections.count_of_field_meter_tags]
    sorts: [assets.asset_id]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: keyera
      palette_id: keyera-categorical-0
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      assets.asset_id: 112
      assets.asset_type: 95
      device_connections.count_of_field_meter_tags: 152
    series_cell_visualizations:
      measurements.total_value:
        is_active: true
        palette:
          palette_id: keyera-sequential-0
          collection_id: keyera
      device_connections.count_of_field_meter_tags:
        is_active: false
    series_text_format:
      device_connections.count_of_field_meter_tags:
        bold: true
        align: center
        fg_color: "#1b10cc"
    defaults_version: 1
    hidden_fields:
    series_types: {}
    truncate_column_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_value_labels: true
    font_size: 12
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Timestamp Date: measurements.timestamp_date
    row: 2
    col: 0
    width: 8
    height: 4
  - title: Facility Hierarchy for Active Devices
    name: Facility Hierarchy for Active Devices
    model: iot-poc
    explore: measurements
    type: marketplace_viz_collapsible_tree::collapsible_tree-marketplace
    fields: [assets.asset_id, paths.designation, paths.field_meter_tag, devices.device_id]
    sorts: [devices.device_id]
    limit: 500
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    color_with_children: "#3941c2"
    color_empty: "#fff"
    series_types: {}
    defaults_version: 0
    refresh: 1 day
    listen:
      Timestamp Date: measurements.timestamp_date
    row: 6
    col: 12
    width: 12
    height: 8
  - title: Events by Type
    name: Events by Type
    model: iot-poc
    explore: events_summary_extended
    type: looker_column
    fields: [events_summary_extended.event_type, events_summary_extended.count_of_events]
    sorts: [events_summary_extended.count_of_events desc]
    limit: 500
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    defaults_version: 1
    listen:
      Timestamp Date: events_summary_extended.start_date
    row: 20
    col: 16
    width: 8
    height: 8
  filters:
  - name: Timestamp Date
    title: Timestamp Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: iot-poc
    explore: measurements
    listens_to_filters: []
    field: measurements.timestamp_date