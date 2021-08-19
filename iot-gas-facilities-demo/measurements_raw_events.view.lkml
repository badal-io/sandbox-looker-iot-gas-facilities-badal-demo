view: measurements_raw_events {
  sql_table_name: `sandbox-keyera-poc.foglamp_demo.measurements_raw_events`
    ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${TABLE}.device_id, ${TABLE}.timestamp, ${TABLE}.property_measured, ${TABLE}.event_type) ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_version {
    type: string
    sql: ${TABLE}.device_version ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: property_measured {
    type: string
    sql: ${TABLE}.property_measured ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour,
      minute,
      minute10,
      second
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

### MEASURES ###

  measure: event_value {
    type: sum
    sql: ${value} ;;
  }

  measure: average_value {
    type: average
    sql: ${value} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
