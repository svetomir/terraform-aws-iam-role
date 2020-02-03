resource "aws_iam_role" "main" {
    name                  = var.name
    
    assume_role_policy    = var.require_mfa ? data.aws_iam_policy_document.assume_role_require_mfa.json : data.aws_iam_policy_document.assume_role.json
    description           = var.description
    force_detach_policies = var.force_detach_policies
    max_session_duration  = var.max_session_duration
    name_prefix           = var.name_prefix
    path                  = var.path
    permissions_boundary  = var.permissions_boundary
    tags                  = var.tags
}

resource "aws_iam_role_policy_attachment" "main" {
    count = length(var.policy_arns) > 0 ? length(var.policy_arns) : 0

    role       = aws_iam_role.main.name
    policy_arn = element(var.policy_arns, count.index)
}

data "aws_iam_policy_document" "assume_role" {
    statement {
        actions = ["sts:AssumeRole"]
        effect = "Allow"
        principals {
            identifiers = var.trusted_arns
            type = "AWS"
            
        }
        principals {
            identifiers = var.trusted_services
            type = "Service"
            
        }
        sid = ""
    }
}

data "aws_iam_policy_document" "assume_role_require_mfa" {
    statement {
        actions = ["sts:AssumeRole"]
        condition {
            test = "Bool"
            values = ["true"]
            variable = "aws:MultiFactorAuthPresent"
        }
        condition {
            test     = "NumericLessThan"
            values   = [var.mfa_age]
            variable = "aws:MultiFactorAuthAge"
        }
        effect = "Allow"
        principals {
            identifiers = var.trusted_arns
            type = "AWS"
            
        }
        principals {
            identifiers = var.trusted_services
            type = "Service"
            
        }
        sid = ""
    }
}
