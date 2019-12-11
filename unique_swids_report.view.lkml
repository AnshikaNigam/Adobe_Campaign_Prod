view: unique_swids_report {
  derived_table: {
    sql: select  metric_value_avg as avg_obt  ,
         metric_value_max as max_obt,
        metric_value_min as  min_obt,
           metric_value as metric_val,
        cast(convert(varchar, date_id) as date) as date_obt,
        dq_check_status,
    metric_query_id

        from M_DQ_DATASET_METRIC_OBSERVATION
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: avg_obt {
    type: number
    sql: ${TABLE}.avg_obt ;;
  }

  measure: avg_msr {
    type: sum
    sql: ${TABLE}.avg_obt ;;
  }


  dimension: max_obt {
    type: number
    sql: ${TABLE}.max_obt ;;
  }

  measure: max_msr {
    type: sum
    sql: ${TABLE}.max_obt ;;
  }

  dimension: min_obt {
    type: number
    sql: ${TABLE}.min_obt ;;
  }

  measure: min_msr {
    type: sum
    sql: ${TABLE}.min_obt ;;
  }


  dimension: metric_val {
    type: number
    sql: ${TABLE}.metric_val ;;
  }


  measure: metric_val_msr {
    type: sum
    sql: ${TABLE}.metric_val ;;
  }


  dimension: date_obt {
    type: date
    sql: ${TABLE}.date_obt ;;
  }

  measure: date_msr {
    type: date
    sql: ${date_obt} ;;
  }

  dimension: dq_check_status {
    type: string
    sql: ${TABLE}.dq_check_status ;;
  }

  dimension: metric_query_id {
    type: number
    sql: ${TABLE}.metric_query_id ;;
  }

  set: detail {
    fields: [
      avg_obt,
      max_obt,
      min_obt,
      metric_val,
      date_obt,
      dq_check_status,
      metric_query_id
    ]
  }
}
