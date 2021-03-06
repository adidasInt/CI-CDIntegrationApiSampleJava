# A Complete CI/CD process integration for apiSampleJava

This repository provides all necesary components to platform and deploy a CI/CD procces 
to the application apiSampleJava.

The main components are the following:
1. Kubernetes cluster, currently hosted in Google Cloud, using Google Kubernete Engine (GKE)
2. Jenkins, as automation server, deployed in the Kubernetes cluster using helm
3. Helm as package repository for Kubernetes
4. Github as SCM
5. Google Container Registry as Docker Images Registry

## Kubernetes powered by GKE
In our case, GKE is deployed by a custom Terraform template, based in the Hashicorp default template for GKE.
This template also, include the configuration of Service Accounts, namespaces and credentials. The only component
needed to deploy a new cluster is that template.

## Jenkins
Jenkins provides us a platform to develop our pipeline as code, using Jenkinsfile. All the configuration 
needed by jenkins is described in jenkins-values.yaml, a file ready to use with Helm.
In this case, we use Jenkins Chart, that use Jenkins Kubernetes plugin to allow the integration of Jenkins in a Kubernetes cluster. Amoung others, we have the capacity to deploy on demand Jenkins agents, allowing horizontal scalability. Also provides the possibility to define containers inside a Jenkins file, using groovy.

## Helm
Helm provides the capacity to deploy "Charts" in Kubernetes. In this case, we are only using Jenkins Chart, but 
we have the posibility to install any type of application like prometheus or grafana.

## Github
As SCM, Github allow to manage files and version of the code, but also manage the events send to Jenkins.

## Google Container Registry
GCE provide a Docker Image Registry that fits perfectly with GKE, that avoid us work related with Image management and credentials. Also provide a GUI where we can manage the images.

## How it works?
The final target is simple. If you push content to the branch develop in Github, you will see the changes in *app-dev.rapibox.cloud* only if the defined test pass.
If you do the same against master, you will find your changes in *app.raspibox.cloud* (again, only if the test pass).

## ToDo list (or wishlist)

### Terraform template improvement
The integration with Terraform is good, but can be better. Hashicorp provides a Helm service provider, this would allow
to deploy the whole application, jenkins included, with a single command in terraform. The only problem is related with the tiller installation. At the execution time of the script, tiller can't get the cluster endpoint and interact with the Kubernetes API. A workaround is possible, but some time is needed.

### CI / CD Improvement
The GitFlow interaction in this case is quite simple. To achieve a similar real world flow, we need to improve our Jenkinsfile and allow work with tags, PR and so on. Also, a way to promote docker images from develop to production is desirable.

### Test something!
The testing is one of the core components of the CI/CD operation and the DevOps philosophy, if we don't have the propper test, we can't garantee the quality of the deployed software. But in this case I don't have enought time to alter the application.

### Github Plugin
Github plugin branch scanner is terribly slow, and I don't know why.

### Nginx Ingress Controller
Is almost de facto standard way to manage ingress in a environments with multiple applications. In this case, we have only three, but It will be useful anyways.

### Security what?
The cluster is a security disaster right now. We should improve the use of the service accounts. Also we need a 
solution to avoid build images with the host machine docker daemon (Yes... that daemon runs as root). Kaniko could be an option.