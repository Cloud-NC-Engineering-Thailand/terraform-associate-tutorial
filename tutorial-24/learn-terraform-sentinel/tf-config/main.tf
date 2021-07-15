variable "region" {
  description = "This is the cloud hosting region where your webapp will be deployed."
}

variable "prefix" {
  description = "This is the environment where your webapp is deployed. qa, prod, or dev"
}

provider "aws" {
  region = var.region
}

resource "random_pet" "petname" {
  length    = 3
  separator = "-"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.prefix}-${random_pet.petname.id}"
  acl    = "public-read"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.prefix}-${random_pet.petname.id}/*"
            ]
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"

  }
  tags = {
    Name        = "HashiConf-Digital"
    Environment = "Prod"
  }
  force_destroy = true
}


resource "aws_s3_bucket_object" "bucket" {
  acl          = "public-read"
  key          = "index.html"
  bucket       = aws_s3_bucket.bucket.id
  content      = file("${path.module}/index.html")
  content_type = "text/html"
}

output "bucket_website_endpoint" {
  value = "http://${aws_s3_bucket.bucket.website_endpoint}/index.html"
}
