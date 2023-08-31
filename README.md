# Terraform AWS S3 Bucket - SNS

This repository contains a simple Terraform application that demonstrates how to create an Amazon S3 bucket and an SNS topic and receive an email every time a file is uploaded on the s3 bcucket using Terraform. The provided Terraform configuration defines the necessary resources and settings.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- **Terraform**: Make sure you have Terraform (version ~> 0.15) installed on your local machine. You can download it from the official website: [Terraform Downloads](https://www.terraform.io/downloads.html).

- **AWS Account**: You'll need an active AWS account with appropriate permissions to create S3 buckets.

## Getting Started

Follow these steps to set up and create an S3 bucket using Terraform:

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/DalianisG/terraformProject.git
   cd terraformProject

   ```

2. Open the `variables.tf` file in a text editor to review and customize the `bucket_name`, `sns_topic_name` and `sns_email` according to your preferences.

3. Initialize the Terraform working directory:

   ```
   terraform init
   ```

4. Preview the changes that Terraform will make:

   ```
   terraform plan
   ```

5. If the plan looks good, apply the configuration to create the S3 bucket:


   ```
   terraform apply
   ```

6. Confirm the action by typing `yes` and pressing Enter.

7. Terraform will provision the S3 bucket and SNS topic based on the configuration you provided. Once the process is complete, you'll see output indicating the successful creation of the bucket.

8. Confirm subscription on your email.

## Clean Up

If you wish to remove the resources created by Terraform, you have to empty the s3 bucket using the console [(AWS Empty Bucket Documentation)](https://docs.aws.amazon.com/AmazonS3/latest/userguide/empty-bucket.html) or the command:

```
aws s3 rm s3://bucket-name --recursive
```

on the CLI. Then you can use the following command to destroy the infrastructure (s3 bucket and SNS topic):

```
terraform destroy
```

Confirm the action by typing `yes` when prompted.

## Customization

Feel free to customize the `variable.tf` file to match your requirements. You can adjust parameters like the bucket name, region, SNS topic name and email. On `main.tf` file you can make changes to ACL, enable versioning, change lifecycle policy etc.

## Important Note

Keep your AWS credentials secure. Avoid hardcoding them in your Terraform files or sharing them in public repositories.

## Resources

[Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
[Amazon S3 Documentation](https://docs.aws.amazon.com/s3/index.html)
