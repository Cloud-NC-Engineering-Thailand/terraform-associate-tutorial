output "lb_url" {
  description = "URL of load balancer"
  value       = "http://${module.elb_http.this_elb_dns_name}/"
}

output "web_instance_count" {
  description = "Number of EC2 instances"
  value       = length(aws_instance.app)
}
