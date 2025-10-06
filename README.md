# I Have a Question
A simple Full-Stack forum application where people can ask questions about any topic, and get answers from other users. It features a responsive React.js frontend with a sleek design, a Java Sprinboot backend with a PostgreSQL database providing full CRUD operations and user authentication.

## Tech Stack
### Frontend
JavaScript, React + Vite

### Backend
Java Springboot and Maven, with PostgreSQL Database

### Infrastructure
Terraform, Kubernetes (with Helm), Docker

## How to Deploy to AWS
### Prerequisites
Make sure these are installed and configured on your system:
  - aws CLI (with an AWS account with an access key and secret key)
  - Terraform
  - kubectl
  - Helm

### 1. Clone the Repository
```bash
git clone https://github.com/Davidjuhasz05/i-have-a-question-forum.git
cd i-have-a-question-forum
```

### 2. Configure Terraform variables
Remove the `.example` extension from `terraform/terraform.tfvars.example`, then fill in your AWS region, access key, secret key, and a name for the project.

### 3. Add ingress-nginx repo with Helm (one-time setup)
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

### 4. Create the Terraform infrastructure (cluster + app)
```bash
cd terraform/cluster
terraform init
terraform apply -var-file="../terraform.tfvars"
```
Wait for all the resources to be created (might take 10-15 minutes)
```bash
cd ../app
terraform init
terraform apply -var-file="../terraform.tfvars"
```

### 5. Get the application URL with kubectl
```bash
kubectl get ingress -n app
```
Just copy the link in the `ADDRESS` column, open it in your browser, and you're done!