### Setting Up an AWS EC2

This little lab set up a new EC2 instance on AWS and creates a security group that allows you to connect the instance using SSH.

## AWS provider
The first step it's to set up the <a href="https://github.com/fergavgo/Terraform/blob/c974d900ac10a9fa4a6ffdc29e53d0856d42f409/AWS%20EC2/providers.tf/" target="blank">provider</a> we're working with.

## AWS Network stuff
Now, is necesary to create a VPS, Subnet, a Public IP address (in order you can connect to the instance), a gateway for the VPC and routing options. 

## Security group
The security file has the options to create a new security group. This is like a firewall set-up that allows external connections to the instance. In this case, allows SSH connections from Internet. 

## EC2 instance
Finally, the EC2 instance will be created and asociated to a security group and a Keypar you previously have created (you need the name). Thus, you can connect the instance using the Public IP address and following <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="blank">these steps</a>. 
