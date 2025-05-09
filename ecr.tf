resource "aws_ecr_repository" "ok_ecr" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(local.tags, tomap({ "Name" = "${var.cust_name}-ecr" }))
}

data "aws_iam_policy_document" "ok_ecr_repo_policy" {
  statement {
    sid    = "ecr policy"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["${var.account_id}", "038462750799"]
    }

    actions = [
       "ecr:BatchCheckLayerAvailability",
        "ecr:BatchDeleteImage",
        "ecr:BatchGetImage",
        "ecr:CompleteLayerUpload",
        "ecr:DeleteLifecyclePolicy",
        "ecr:DeleteRepository",
        "ecr:DeleteRepositoryPolicy",
        "ecr:DescribeImages",
        "ecr:DescribeRepositories",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetLifecyclePolicy",
        "ecr:GetLifecyclePolicyPreview",
        "ecr:GetRepositoryPolicy",
        "ecr:InitiateLayerUpload",
        "ecr:ListImages",
        "ecr:PutImage",
        "ecr:PutLifecyclePolicy",
        "ecr:SetRepositoryPolicy",
        "ecr:StartLifecyclePolicyPreview",
        "ecr:UploadLayerPart"
    ]
  }
}

resource "aws_ecr_repository_policy" "ok_ecr_repo_attch" {
  repository = aws_ecr_repository.ok_ecr.name
  policy     = data.aws_iam_policy_document.ok_ecr_repo_policy.json
}