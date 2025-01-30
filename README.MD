Exercise EX007: Cloud Engineer
A simple k8s app
Version 2.0
---


People often host applications on Kubernetes for scalability and fault-tolerance. Write some
code to provision a simple 3-tier application on a variant of k8s (GKE, EKS, microk8s, .. ).

Your application should contain:
1. A web server of your choice
2. Some business logic
3. A Postgres database


The web interface should provide the user with a button, a text string, and a count. Pressing
the button should increment the counter. The counter value should be stored in the
database, but there is no need to update it automatically as the database changes. The text
string should be configurable by administrators without modifying the application.


Your solution should use Terraform (or equivalent) to create the necessary infrastructure in
your chosen provider and Ansible (or equivalent) to provision the infrastructure.

Additional requirements:

● When deployed on a zonally redundant k8s cluster such as GKE’s regional k8s
clusters, the application should tolerate the failure of any one zone in a region.
● You should ensure that the application is secure against external attackers and
provide some protection against horizontal traversal by threat actors.
● Avoid using hardwired credentials.


We’re not expecting you to provide a perfect solution, but we would like you to have come up
with:

    ● A workable approach that could be extended to give a production-quality solution
    ● A reasonable amount (100-200 lines or so) of readable code that we could plausibly
maintain.
    ● An idea of how to achieve a production-quality solution based on what you’ve done,
what trade-offs you elected to make, and where the weak points in that solution might
be.


bigpay-demo-project/
├── 3-tier-app/
│   ├── backend/
│   ├── db/
│   ├── frontend/
│   ├── docker-compose.yaml
│   └── README.MD
├── terraform/aws/
│   ├── modules/
│   │   ├── vpc/
│   │   ├── eks/
│   │   ├── rds/
│   │   ├── igw/
│   │   └── alb/
│   ├── eip.tf
│   ├── igw_route_table.tf
│   ├── main.tf
│   ├── nat_gateway.tf
│   ├── nat_gateway_route_table.tf
│   ├── outputs.tf
│   ├── private_subnet_association.tf
│   ├── public_subnet_association.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── README.MD
├── k8s-manifests/eks/
│   ├── configmap.yaml
│   ├── frontend-deployment.yaml
│   ├── backend-deployment.yaml
│   ├── backend-service.yaml
│   ├── frontend-service.yaml
│   ├── ingress.yaml
│   ├── namespace.yaml
│   ├── network-policies.yaml
│   └── README.MD
├── ansible/
│   ├── playbook.yaml
│   └── README.MD
└── README.md

# Terraform
terraform init
terraform plan
terraform apply

# K8s
kubectl apply -f k8s-manifests/namespace.yaml
kubectl apply -f k8s-manifests/


create  terraform IaC code to build EKS infrstruture along with ELB to deploy  an Nodejs Web application along with postgresql into multiple region. Create the complete project