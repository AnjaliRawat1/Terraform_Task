#1) The table name should be datacenter-users.

#2) The primary key should be datacenter_id (String).

#3) The table should use PAY_PER_REQUEST billing mode.

resource "aws_dynamodb_table" "datacenter_users"{
    name = "datacenter-users"
    hash_key = "datacenter_id"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "datacenter_id"
      type = "S"
    }
    tags = {
      Name = "datacenter-users"
    }
}
