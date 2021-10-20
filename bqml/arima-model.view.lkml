include: "/iot-gas-facilities-demo/measurements.view"

# Training an ARIMA model. Model is rebuilt every day.

# view: arima_model {
#   derived_table: {
#     sql_trigger_value: SELECT CURRENT_DATE() ;;
#     sql_create:
#       CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
#       OPTIONS
#         (model_type = 'ARIMA_PLUS',
#         time_series_timestamp_col = 'timestamp_minutes',
#         time_series_data_col = 'minute_value',
#         time_series_id_col = ['device_id', 'property_measured'],
#         data_frequency = 'PER_MINUTE',
#         ) AS
#       SELECT
#         DATETIME_TRUNC(timestamp, MINUTE) as timestamp_minutes,
#         device_id,
#         property_measured,
#         SUM(value) as minute_value
#       FROM `sandbox-keyera-poc.foglamp_demo.measurements_raw`
#       GROUP BY timestamp_minutes, device_id, property_measured;;
#   }


  view: arima_model {
    derived_table: {
      datagroup_trigger: arima_trigger
      sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS
        (model_type = 'ARIMA_PLUS',
         time_series_timestamp_col = 'timestamp_minutes',
         time_series_data_col = 'minute_value',
         time_series_id_col = ['device_id', 'property_measured'],
         data_frequency = 'PER_MINUTE',
         horizon = 2880
        ) AS
      SELECT
        DATETIME_TRUNC(measurements.timestamp, MINUTE) as timestamp_minutes,
        measurements.device_id as device_id,
        measurements.property_measured as property_measured,
        SUM(measurements.value) as minute_value
      FROM ${measurements.SQL_TABLE_NAME} as measurements
      GROUP BY timestamp_minutes, device_id, property_measured;;
    }

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
}
