## Kafka Custom KMS Key 
create_kafka_kms_key_id        = true
kafka_key_usage                = "ENCRYPT_DECRYPT"
kafka_customer_master_key_spec = "SYMMETRIC_DEFAULT"
kafka_multi_region             = false
kafka_deletion_window_in_days  = null
kafka_is_enabled               = true
kafka_enable_key_rotation      = false
kafka_kms_key_name             = "msk-kafka-key"
## Kafka node and cluster config
name_prefix         = "kafka-cluster"
vpc_id              = "vpc-04d796513538107d5"
subnet_ids          = ["subnet-0558372d5ba749417", "subnet-08af060aeb20af40c"]
kafka_SG_id         = ["sg-02b42751eab13f53a", "sg-0a80c39996b1d8abc"]
kafka_tag_key       = "user"
kafka_tag_value     = "devops"
kafka_version       = "2.6.2"
kafka_broker_number = 2
kafka_instance_type = "kafka.m5.xlarge"
## Monitoring
kafka_monitoring_level = "PER_TOPIC_PER_BROKER"
enable_jmx_exporter    = true
enable_node_exporter   = true
## Storage
kafka_encryption_in_transit = "TLS"
kafka_ebs_volume_size       = "100"
## Storage auto scaling
enable_storage_autoscaling = false
scaling_max_capacity       = "200"
scaling_target_value       = "60"
## Logging
enable_logging_info_cloudwatch = false
cloudwatch_log_group           = null
enable_logging_info_firehouse  = false
firehose_delivery_stream       = null
enable_logging_info_s3         = false
s3_bucket_id                   = null
## Kafka Custom config file
tags                                                 = {}
kafka_custom_config_auto_create_topics               = true
kafka_custom_config_delete_topics                    = false
kafka_custom_config_default_replication_factor       = 2
kafka_custom_config_min_insync_replicas              = 1
kafka_custom_config_num_io_threads                   = 8
kafka_custom_config_num_network_threads              = 5
kafka_custom_config_num_partitions                   = 2
kafka_custom_config_num_replica_fetchers             = 2
kafka_custom_config_socket_request_max_bytes         = 104857600
kafka_custom_config_unclean_leader_election_enable   = true
kafka_custom_config_offsets_topic_replication_factor = 1