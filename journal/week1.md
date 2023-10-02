# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defines required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not shown visibly in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_id="my-user_id"`

### var-file flag

We can use the `-var-file` in a similar way as the `-var` flag, but providing a **file** (with `.tfvars` or `.tfvars.json` extension) that contains the values.

This is used when we want to set multiple variables.

### terraform.tvfars

This is the default file to load in terraform variables in blunk.

### auto.tfvars

Using a file with the extension `.auto.tfvars` is an alternative to the `-var-file` flag.

This file is loaded automatically, like the `terraform.tfvars` one.

### Order of terraform variables

    - A variable value file explicitly referenced using a "-var" flag.
    - A ".tfvars" file explicitly referenced using a "-var-file" flag.
    - A file with the ".auto.tfvars" extension.
    - A file called "terraform.tfvars".
    - An environment variable with the "TF_VAR_name" format.
    - The default value in the variable definition.