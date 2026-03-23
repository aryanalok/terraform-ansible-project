provider "aws" {
    region = "ap-south-1"
     assume_role {
        role_arn = "arn:aws:iam::DEV_ACCOUNT_ID:role/OrganizationAccountAccessRole"
  }
}
   
