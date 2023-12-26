# redis.tf

module "redis" {
  source                = "./modules/redis"
  cluster_id            = "my-redis-cluster"
  node_type             = "cache.t2.micro"
  num_cache_nodes       = 1
  parameter_group_name  = "default.redis6.x"
  engine_version        = "6.x"
  subnet_ids            = [for subnet in module.subnets : subnet.subnet_id]
  security_group_id     = module.app_security_group.security_group_id
  tags                  = {
    Name = "MyRedisCluster"
  }
}
