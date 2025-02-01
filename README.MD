### Exercise EX007: Cloud Engineer

 A simple k8s app ( Version 2.0)
---


### Objective:
---
Your task is to provide a simple 3-tier application on a Kubernetes variant (such as GKE, EKS, microk8s, etc.) to demonstrate scalability and fault tolerance.


#### Application Components:
- A web server of your choice
- Business logic to handle functionality
- A PostgreSQL database


#### Web Interface Requirements:
- The interface should include:
    - A button
    - A text string
    - A counter
- When the button is pressed, the counter should increment.
- The counter value should be stored in the PostgreSQL database. There is no need for real-time automatic updates when the database changes.
- The text string displayed should be configurable by administrators without modifying the application code.


#### Infrastructure Provisioning:
- Use Terraform (or an equivalent tool) to create the infrastructure in your chosen provider.
- Use Ansible (or an equivalent tool) to provision the application and related infrastructure.


#### Additional Requirements:
- The application should be deployed on a zonally redundant Kubernetes cluster (e.g., GKE’s regional clusters) to ensure that it can tolerate the failure of any single zone in the region.
- Ensure the application is secure from external attackers and protects against lateral movement by malicious actors.
- Avoid using hardcoded credentials within the application.


#### What We're Looking For:
- A practical approach that can be extended for production use.
- A reasonable amount of readable code (around 100-200 lines) that can be maintained easily.
- A clear understanding of how to scale the solution to production quality, including trade-offs you’ve made and potential weaknesses in your approach.

### Disclaimer
---
In this project, I have developed the code base, which may not be fully tested. The primary aim is to showcase my approach to the solution, starting from the development of the web application to its deployment for end users.
The following tools and technologies have been used throughout the project. Please note that the code base may require debugging, adjustments to variable values, and the installation of necessary packages. Authentication may also be necessary for successful execution.

- Node.js, Nginx, PostgreSQL
- Ansible, Terraform
- Docker, Kubernetes
- AWS


### Directory Structure
---
                terraform-k8s-demo-project/
                ├── 3-tier-app/
                │   ├── backend/
                │   ├── db/
                │   ├── frontend/
                │   ├── docker-compose.yaml
                │   └── README.MD
                ├── terraform/aws/
                │   ├── modules/
                │   │   ├── alb/
                │   │   ├── ecr/
                │   │   ├── eip/
                │   │   ├── eks/
                │   │   ├── global_settings/
                │   │   ├── igw/
                │   │   ├── nat/
                │   │   ├── rds/
                │   │   ├── s3/
                │   │   └── vpc/
                │   ├── config.tf
                │   ├── datasource.tf
                │   ├── main.tf
                │   ├── outputs.tf
                │   ├── provider.tf
                │   ├── terraform.tfvars
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

### Terraform
    terraform init
    terraform plan
    terraform apply

### K8s
    kubectl apply -f k8s-manifests/namespace.yaml
    kubectl apply -f k8s-manifests/



Develop Terraform Infrastructure-as-Code (IaC) to provision an AWS EKS cluster with an ELB for deploying a Node.js web application and a PostgreSQL database across multiple regions. Build the complete project with a well-structured architecture.
