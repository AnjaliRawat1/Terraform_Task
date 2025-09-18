#The Nautilus DevOps team needs to create an SSM parameter in AWS with the following requirements:
#The name of the parameter should be datacenter-ssm-parameter.
#Set the parameter type to String.
#Set the parameter value to datacenter-value.
#The parameter should be created in the us-east-1 region.
#Ensure the parameter is successfully created using terraform and can be retrieved when the task is completed.

resource "aws_ssm_parameter" "datacenter_ssm_parameter" {
  type = "String"
  value = "datacenter-value"
  name = "datacenter-ssm-parameter"
}
output "ssm_parameter_value" {
value = nonsensitive(aws_ssm_parameter.datacenter_ssm_parameter.value)
}
