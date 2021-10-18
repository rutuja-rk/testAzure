resource "newrelic_alert_policy" "error_alert_policy" {
  name = "Error Terraform Policy"
}

# Error percentage > 2.5 % for at least 5 mins-Flipgrid Moderation(Prod)

resource "newrelic_alert_condition" "error_percentage" {
  policy_id       = newrelic_alert_policy.error_alert_policy.id
  name            = "Error percentage High"
  entities        = [1828291911]
  type            = "apm_app_metric"
  metric          = "error_percentage"
  condition_scope = "application"

  # Define a critical alert threshold that will trigger after 5 minutes above a 2.5% error rate.
  term {
    duration      = 5
    operator      = "above"
    threshold     = "2.5"
    time_function = "all"
  }
}
