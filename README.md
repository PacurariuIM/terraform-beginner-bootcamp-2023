# Terraform Beginner Bootcamp 2023

## Semantic Versioning :frog:

In this project we'll be using semantic versioning for the tagging.

[semver.org](https://semver.org/)

The general format:

 **MAJOR.MINOR.PATCH**, e.g. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.


## Install the Terraform CLI

### Considerations with the Terraform CLI Changes
The Terraform CLI install instructions have changed, due to gpg keyring changes. So we needed to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distribution

This project is build against Ubuntu.
Please consider checking your Linux Distribution and change accordingly to distribution needs.

[How to check OS version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checkin OS version
```
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issues we noticed that the bash scripts steps had a considerable ammount of code. So we decided to create a new Terraform CLI bash script. 
- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy;
- Will allow us an easier debug and manually execution of Terraform CLI install;
- Will allow better portability for other projects that need to install Terraform CLI;

#### Shebang Considerations

This tells the bash script what program will interpret the script.

[Shebang documentation](https://en.wikipedia.org/wiki/Shebang_(Unix))

## Execution considerations

When executing the bash script we can use the `./` shorthand notation.
e.g. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the scropt to a program to interpret it
e.g. `source ./bin/install_terraform_cli`

#### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for the fix to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```
https://en.wikipedia.org/wiki/Chmod

### Github Lifecycle (before, init, command)

We need to be careful when using the `init` because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks

### Working with Env Vars

We can list out all Environment Variables using the `env` command
We can filter specific env vars using grep, e.g. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal, for setting we use `export HELLO='world`
For unsetting, we use `unset HELLO`
We can set an env var temporarily when just running a command
    e.g.
    ```
    HELLO=`world` ./bin/print_message

    ```
WIthin a bash script we can set an env var without writing export.
    e.g.
    ```sh
    #!/usr/bin/env bash

    HELLO='world'

    echo $HELLO
    ```

## Printing Env Vars

We can print an env var using echo, e.g. `echo HELLO`

#### Scope of env vars

When you open a new bash terminal in VSCode it will not be aware of env vars that you have set in another window. 
If you want env vars to persist accross all future basg terminals, need to set env vars in your bash profile.

#### Persisting env vars in Gitpod

We can persist env vars in Gitpod by storing them in Gitpod Secrets Storage

```
gp env HELLO='world'
```

You can also set env vars in the `.gitpod.yml`, but it's recommended not to contain sensibel env vars.

### AWS CLI installation

AWS CLI is installed for this project via the bash script ['./bin/install_aws_cli](./bin/install_aws_cli)

[Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

We can check if our AWS credentials are configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

[Configure AWS CLI env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

If it is successful you should see a json payload that looks lie this:
```json
{
    "UserId": "ABCDEIIGHABBAA",
    "Account": "12345678900",
    "Arn": "arn:aws:iam::1234567829:user/TerraformBootcampAccIonel"
}
```

We'll need to generate AWS CLI credentials from IAM User in order to use the AWS CLI.