output "arn" {
    value = aws_iam_role.main.arn
    description = "The Amazon Resource Name (ARN) specifying the role."
}

output "create_date" {
    value = aws_iam_role.main.create_date
    description = "The creation date of the IAM role."
}

output "description" {
    value = aws_iam_role.main.description
    description = "The description of the role."
}

output "id" {
    value = aws_iam_role.main.id
    description = "The name of the role."
}

output "name" {
    value = aws_iam_role.main.name
    description = "The name of the role."
}

output "unique_id" {
    value = aws_iam_role.main.unique_id
    description = "The stable and unique string identifying the role."
}

output "policy_arns" {
    value = aws_iam_role_policy_attachment.main.*.policy_arn
    description = "The ARNs of the policies attached to the role."
}
