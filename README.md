### Repo structure

    .
    ├── main.tf                     # terraform file to create ec2 instance
    ├── install_dependencies.sh     # user data script for the ec2 instance to install dependencies 
    └── README.md

#### Runs on terraform cloud under "dreamapp" workspace
https://app.terraform.io/app/dreamapp/workspaces/dreamapp


#### Creates the following:
* ec2 instance with ubuntu
* security groups: 
  * ingress:
    * allowing ssh (port 22) 
    * allow http (port 80)
  * egress:
    * allow egress on all ports
* attaches userdata (install_dependencies.sh script)
