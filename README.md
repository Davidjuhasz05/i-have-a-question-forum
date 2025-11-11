<a id="readme-top"></a>


<!-- PROJECT LOGO -->
<br />
<div align="center">
<h3 align="center">I Have a Question</h3>

  <p align="center">
    A simple Full-Stack forum application where people can ask questions about any topic, and get answers from other users. It features a responsive React.js frontend with a sleek design, a Java Sprinboot backend with a PostgreSQL database providing full CRUD operations and user authentication.
    <br />
    <a href="https://github.com/Davidjuhasz05/i-have-a-question-forum"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/Davidjuhasz05/i-have-a-question-forum/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    &middot;
    <a href="https://github.com/Davidjuhasz05/i-have-a-question-forum/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#deploy-to-aws">Deploy to AWS</a></li>
      </ul>
    </li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

![Website screenshot][website-screenshot]


### Built With

### Frontend
[![JavaScript]][JavaScript-url]
[![React.js]][React-url]
[![React-Router.js]][React-Router-url]
[![Vite.js]][Vite-url]

### Backend
[![Java]][Java-url]
[![Spring-Boot]][Spring-Boot-url]
[![Maven]][Maven-url]
[![PostgreSQL]][PostgreSQL-url]

### Infrastructure
[![Docker]][Docker-url]
[![Kubernetes]][Kubernetes-url]
[![Helm]][Helm-url]
[![Terraform]][Terraform-url]


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

Make sure these are installed and configured on your system:

  * [AWS CLI][AWS-CLI-url] with an AWS account with an access key and secret key
  * [Terraform][Terraform-download-url]
  * [kubectl][kubectl-url]
  * [Helm][Helm-install-url]

### Deploy to AWS

#### 1. Clone the Repository
```bash
git clone https://github.com/Davidjuhasz05/i-have-a-question-forum.git
cd i-have-a-question-forum
```

#### 2. Configure Terraform variables

  Remove the `.example` extension from `terraform/terraform.tfvars.example`, then fill in your AWS region, access key, secret key, and a name for the project.

#### 3. Add ingress-nginx repo with Helm (one-time setup)
```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

#### 4. Create the Terraform infrastructure (cluster + app)
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

#### 5. Get the application URL with kubectl
```bash
kubectl get ingress -n app
```

  Just copy the link in the `ADDRESS` column, open it in your browser, and you're done!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Davidjuhasz05/i-have-a-question-forum.svg?style=for-the-badge
[contributors-url]: https://github.com/Davidjuhasz05/i-have-a-question-forum/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Davidjuhasz05/i-have-a-question-forum.svg?style=for-the-badge
[forks-url]: https://github.com/Davidjuhasz05/i-have-a-question-forum/network/members
[stars-shield]: https://img.shields.io/github/stars/Davidjuhasz05/i-have-a-question-forum.svg?style=for-the-badge
[stars-url]: https://github.com/Davidjuhasz05/i-have-a-question-forum/stargazers
[issues-shield]: https://img.shields.io/github/issues/Davidjuhasz05/i-have-a-question-forum.svg?style=for-the-badge
[issues-url]: https://github.com/Davidjuhasz05/i-have-a-question-forum/issues
[license-shield]: https://img.shields.io/github/license/Davidjuhasz05/i-have-a-question-forum.svg?style=for-the-badge
[license-url]: https://github.com/Davidjuhasz05/i-have-a-question-forum/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/david-juhasz-dave
[website-screenshot]: website_screenshot.png

[JavaScript]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=000
[JavaScript-url]: https://developer.mozilla.org/en-US/docs/Web/JavaScript
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://react.dev
[Vite.js]: https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white
[Vite-url]: https://vite.dev
[React-Router.js]: https://img.shields.io/badge/React_Router-CA4245?style=for-the-badge&logo=react-router&logoColor=white
[React-Router-url]: https://reactrouter.com
[Spring-Boot]: https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring&logoColor=white
[Spring-Boot-url]: https://spring.io/projects/spring-boot
[Java]: https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white
[Java-url]: https://www.oracle.com/java
[Maven]: https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white
[Maven-url]: https://maven.apache.org
[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[PostgreSQL-url]: https://www.postgresql.org
[Docker]: https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://www.docker.com
[Kubernetes]: https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white
[Kubernetes-url]: https://kubernetes.io
[kubectl-url]: https://kubernetes.io/docs/tasks/tools
[Terraform]: https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white
[Terraform-url]: https://developer.hashicorp.com/terraform
[Terraform-download-url]: https://developer.hashicorp.com/terraform/downloads
[Helm]: https://img.shields.io/badge/Helm-0F1326?style=for-the-badge&logo=helm&logoColor=white
[Helm-url]: https://helm.sh
[Helm-install-url]: https://helm.sh/docs/intro/install
[AWS-CLI-url]: https://aws.amazon.com/cli