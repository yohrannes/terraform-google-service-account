# terraform-google-service-account

## How to provide.

Required tools
- Terraform
- Google Cloud CLI

### Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and [Google cloud CLI](https://cloud.google.com/sdk/docs/install-sdk) (recommend to use official doc's).

### Authenticate with your desired Google Account and create a Project (skip if you already have it)..
```
gcloud init
```
```
# If can't create a project with gcloud init, try...
gcloud projects create <GLOBAL_UNIQUE_PROJECT_NAME>
```
```
gcloud auth application-default login
```