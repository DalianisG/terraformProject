# Terraform AWS S3 Bucket Creation

This repository contains a simple Terraform application that demonstrates how to create an Amazon S3 bucket on AWS using Terraform. The provided Terraform configuration defines the necessary resources and settings to create an S3 bucket.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- **Terraform**: Make sure you have Terraform installed on your local machine. You can download it from the official website: [Terraform Downloads](https://www.terraform.io/downloads.html).

- **AWS Account**: You'll need an active AWS account with appropriate permissions to create S3 buckets.

## Getting Started

Follow these steps to set up and create an S3 bucket using Terraform:

1. Clone this repository to your local machine:

   ```sh
   git clone https://github.com/DalianisG/terraformProject.git
   cd terraform-aws-s3-bucket

   ```

2. Open the main.tf file in a text editor to review and customize the configuration, such as the bucket_name, acl, and other attributes according to your preferences.

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

6. Confirm the action by typing yes and pressing Enter.

7. Terraform will provision the S3 bucket based on the configuration you provided. Once the process is complete, you'll see output indicating the successful creation of the bucket.

## Clean Up

If you wish to remove the resources created by Terraform, you can use the following command:

```
terraform destroy
```

Confirm the action by typing yes when prompted.

## Customization

Feel free to customize the main.tf configuration file to match your requirements. You can adjust parameters like the bucket name, access control settings, and more.

## Important Note

Keep your AWS credentials secure. Avoid hardcoding them in your Terraform files or sharing them in public repositories.

## Resources

[Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
[Amazon S3 Documentation](https://docs.aws.amazon.com/s3/index.html)
