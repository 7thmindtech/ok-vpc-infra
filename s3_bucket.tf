#Loadbalancer access log s3 bucket 
resource "aws_s3_bucket" "ok-backup" {
  bucket = "${var.cust_name}-${var.env}-alb-access-log"
  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-backup-lb-log" }))
}

#s3 bucket policy to allow access
resource "aws_s3_bucket_policy" "ok-backup-policy" {
  bucket = aws_s3_bucket.ok-backup.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Sid": "",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::156460612806:root"
        },
        "Action": "s3:PutObject",
        "Resource": "arn:aws:s3:::${var.cust_name}-${var.env}-alb-access-log/alb/AWSLogs/${var.account_id}/*"
    },
    {
        "Sid": "",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${var.account_id}:root"
        },
        "Action": "s3:GetObject",
        "Resource": "${aws_s3_bucket.ok-backup.arn}/*"
    },
    {
        "Sid": "",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${var.account_id}:root"
        },
        "Action": "s3:ListBucket",
        "Resource": "${aws_s3_bucket.ok-backup.arn}"
    },
    {
        "Sid": "AllowPutAccess",
        "Effect": "Allow",
        "Principal": {
            "AWS": "arn:aws:iam::${var.account_id}:root"
        },
        "Action": [
            "s3:PutObject",
            "s3:PutObjectACL"
        ],
        "Resource": [
            "${aws_s3_bucket.ok-backup.arn}",
            "${aws_s3_bucket.ok-backup.arn}/*"
        ]
    }
  ]
}
EOF
}