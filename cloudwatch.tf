
#### SNS Topic to receive alerts ####
resource "aws_sns_topic" "cpu_alerts" {
  name = "cpu-utilization-alerts"
}

#### SNS Subscription to send email notifications ####
resource "aws_sns_topic_subscription" "cpu_alerts_subscription" {
  topic_arn = aws_sns_topic.cpu_alerts.arn
  protocol  = "email"
  endpoint  = "maged3bdelfatah@gmail.com"  
}

#### CloudWatch Alarm for CPU Utilization ####
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  alarm_name          = "High-CPU-Utilization-Above-50"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300  # 5-minute period
  statistic           = "Average"
  threshold           = 50  # Trigger the alarm when CPU utilization is >= 50%
  alarm_description   = "This alarm triggers when CPU utilization exceeds 50%."
  insufficient_data_actions = []

  #### Action when the alarm state is triggered ####
  alarm_actions = [
    aws_sns_topic.cpu_alerts.arn,
  ]

  #### Action when the alarm state is OK ####
  ok_actions = [
    aws_sns_topic.cpu_alerts.arn,
  ]

  #### Action when the alarm state is in ALARM ####
  actions_enabled = true
}
