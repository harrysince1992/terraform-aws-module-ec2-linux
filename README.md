Module to create an EC2 instance

Inputs Require: 
ingress_ports: Ingress ports required for EC2 Security group
instance_type: can only be t2.micro
number_of_instances: max can be 3 only 

Outputs: 
private_key: private key in pem format
instance_id: instance id 
public_ip: public ip of the instanceCustom terraform module to create ec2 linux instance
