module "dynamodb_table" {
    source = "terraform-aws-modules/dynamodb-table/aws"

    name = "amt-document-types"
    hash_key = "company"

    attributes = [{
        name = "company"
        type = "S"
    }]
}