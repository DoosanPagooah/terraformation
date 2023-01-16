output "alb_dns_mame" {

    value = aws_lb.example.dns_name
    description = "The domain name of the load balancer"
  
}