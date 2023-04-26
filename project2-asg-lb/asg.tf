# required part for creation an asg
resource "aws_autoscaling_group" "asg" {
    name = "${aws_launch_configuration.launch_configuration.name}-asg"   #  

    min_size         = 1
    desired_capacity = 1
    max_size         = 2

}
#  not required part
#     health_check_type = "ELB"
#     load_balancers = [
#         aws_elb.elb.id
#     ]

#    launch_configuration = aws_launch_configuration.launch_configuration.name

#     enabled_metrics = [
#     "GroupMinSize",
#     "GroupMaxSize",
#     "GroupDesiredCapacity",
#     "GroupInServiceInstances",
#     "GroupTotalInstances"
#   ]

#   metrics_granularity = "1Minute"

#   vpc_zone_identifier  = [
#     aws_subnet.subnet1.id,
#     aws_subnet.subnet2.id
#   ]

#   # Required to redeploy without an outage.
#   lifecycle {
#     create_before_destroy = true
#   }

#   tags {
#     key                 = "Name"
#     value               = "web"
#     propagate_at_launch = true
#   }

# }