view: email_campaign_reporting {
  derived_table: {
    sql: SELECT
        CAMPAIGN_GO_LIVE_DATE_ID, NUM_EMAILS_SENT, NUM_EMAILS_OPENED,
        (NUM_EMAILS_CLICKED/NULLIF(NUM_EMAILS_OPENED,0)) * 100 AS EMAIL_CLICK_PCT
      FROM DIS_MASTERING.FRM.FA_ACS_CAMPAIGN_EMAIL_RESPONSE_SUMMARY
      UNION
      SELECT CAMPAIGN_GO_LIVE_DATE_ID, NUM_EMAILS_SENT, NUM_EMAILS_OPENED,
        (NUM_EMAILS_CLICKED/NULLIF(NUM_EMAILS_OPENED,0)) * 100 AS EMAIL_CLICK_PCT
      FROM dis_mart.frm.fa_campaign_selection_response_summary
      ORDER BY 1 desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: campaign_go_live_date_id {
    type: number
    sql: ${TABLE}."CAMPAIGN_GO_LIVE_DATE_ID" ;;
  }

  dimension: num_emails_sent {
    type: number
    sql: ${TABLE}."NUM_EMAILS_SENT" ;;
  }

  dimension: num_emails_opened {
    type: number
    sql: ${TABLE}."NUM_EMAILS_OPENED" ;;
  }

  dimension: email_click_pct {
    type: number
    value_format: "0.00%"
    sql: ${TABLE}."EMAIL_CLICK_PCT" ;;
  }

  set: detail {
    fields: [campaign_go_live_date_id, num_emails_sent, num_emails_opened, email_click_pct]
  }
}
