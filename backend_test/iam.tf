data "aws_iam_policy_document" "assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_role" {
  name               = "${var.env_prefix}-backend-test-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy_document.json
  # 初回apply後にコメントアウト解除
  # description        = "modify"
}

