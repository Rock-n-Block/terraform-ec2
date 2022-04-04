aws_region = "us-east-2"                                                 # Region of EC2 instance
aws_key_credentials = {
    access_key = ""                                                            # AWS Access Key (optional if  AWS CLI profile is used)
    secret_key = ""                                                             # AWS Secret Key (optional if  AWS CLI profile is used)
}
aws_profile_name = ""                                                     # AWS Access Key (optional if  Aceess and Secret keys are  used)
instance_ssh_key_file = "/home/user/.ssh/id_rsa.pub"    # SSH Public key to deploy on instance
instance_ssh_key_priv_file = "/home/user/.ssh/id_rsa"   # Path to SSH Private key
ssh_agent_support = false                                                # (Optional) Enable support for SSH Agent for connections
instance_ami = "ami-0fb653ca2d3203ac1"                     # Instance AMI ID (default: Ubuntu 20.04 x64)
instance_type = "t2.micro"                                              # Instance type 
instance_name = "Terraform EC2 AppServer"               # Instance '"Name" tag 
instance_organization = "RNB"                                      # (Optional) Instance "Organization" tag  (will not be set if  equals "")
security_rules_ports = [22, 80, 443]                               # Ports for security group
root_block_device = {
    volume_type = "gp2"                                                  # Type of volume
    volume_size = 30                                                        # Size of root volume
}