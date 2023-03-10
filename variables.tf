variable "aws" {
  type = object({
    region     = string
    access_key = string
    secret_key = string
  })
  sensitive = true
  description = "AWS related information and credentials"
}

variable "confluent" {
  type = object({
    cloud_api_key    = string
    cloud_api_secret = string
  })
  sensitive = true
  description = "Confluent (Cloud) related credentials"
}

variable "kafka" {
  type = object({
    environment = object({
      id = string
    })
    cluster = object({
      id            = string
      api_version   = string
      kind          = string
      rest_endpoint = string
    })
    credentials = object({
      api_key_id     = string
      api_key_secret = string
    })
  })
  sensitive = true
  description = "Information and credentials about/from the Kafka cluster"
}

variable "domain" {
  type = string
  description = "The domain of the data product"
}

variable "name" {
  type = string
  description = "The name of the data product"
}

variable "input" {
  type = list(object({
    topic      = string
    format     = string
    table_name = string
    schema     = string
  }))
  description = <<EOT
topic: Name of the Kafka topic which should be processed
format: Currently only 'JSON' is supported
table_name: Name of the data catalog table, where data is stored
schema: Path to the JSON schema file which describes the messages received from Kafka and the table within the data catalog
EOT
}

variable "output" {
  type = object({
    grant_access = list(string)
  })
  default = {
    grant_access = []
  }
  description = <<EOT
grant_access: "List of AWS account ids which should have access to the data product"
EOT
}
