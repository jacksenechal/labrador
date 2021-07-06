prereqs
- packer installed
- aws configuration for target account
- targetable VPC and subnet for AMI building

bootstrap
- packer build
- plug AMI into your terraform / or spin up a box manually

post-boot setup
- ssh in with key forwarding (-A)
- clone bsw and devops repos into right places
- bundle install in devops
- `sudo ln -s /home/ubuntu/workspace/devops/Thorfile /usr/local/bin/devops`
- `sudo cp /home/ubuntu/bootstrap-workstation/ansbile/roles/aws-okta/files/mavenlink-* /usr/local/bin/`
- copy last `env_keep` line from `bsw/ansbile/templates/sudoers.j2` into `sudo visudo`
- devops enroll
