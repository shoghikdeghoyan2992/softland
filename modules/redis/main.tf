resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = var.cluster_id
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [var.security_group_id]

  tags = var.tags
}

resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "${var.cluster_id}-subnet-group"
  subnet_ids = var.subnet_ids
}
