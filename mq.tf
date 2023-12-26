data "aws_secretsmanager_secret_version" "mq_password" {
  secret_id = "mq-broker-password"  
}

resource "aws_mq_broker" "my_mq_broker" {
  broker_name        = "my-mq-broker"
  engine_type        = "ActiveMQ"    
  engine_version     = "5.15.0"      
  host_instance_type = "mq.t3.micro" 

  user {
    username = "mq_user"
    password = data.aws_secretsmanager_secret_version.mq_password.secret_string
  }

  apply_immediately          = true
  auto_minor_version_upgrade = true

  deployment_mode     = "SINGLE_INSTANCE" # Or "ACTIVE_STANDBY_MULTI_AZ" for high availability
  publicly_accessible = true

  security_groups = [module.app_security_group.security_group_id]
  subnet_ids      = [for subnet in module.subnets : subnet.subnet_id]

  tags = {
    Name = "MyMQBroker"
  }
}
