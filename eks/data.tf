data "terraform_remote_state"  "networking" {
  backend = "s3"
  config = {
    bucket         = "hoitcs-tf-state"
    key            = "tf-networking/terraform.tfstate"
    region         = "us-east-1"
  }

}



output test {
  value = data.terraform_remote_state.networking.outputs
}
