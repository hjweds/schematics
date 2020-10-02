# Schematics example

1. a multizone VPC

2. a subnet in each zone

3. a public gateway in each zone attached to subnet

4. create an IKS cluster in the VPC

5. deploy an App to the cluster

6. configure TLS cert for the app ingress.

# Note

1. Make sure the address prefix cidr blocks do not overlap with the default ones of the VPC

2. To check the available IKS flavors, run `ibmcloud ks flavors --zone $ZONE --provider vpc-gen2`

3. Make sure you have proper permission of Certificate Manager, in order to have the default ingress secret. More details: https://cloud.ibm.com/docs/containers?topic=containers-cs_troubleshoot_debug_ingress#ingress_secret