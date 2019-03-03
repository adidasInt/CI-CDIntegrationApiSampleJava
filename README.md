# A Complete CI/CD proccess integration for apiSampleJava

This repository provides all necesary components to platform and deploy a CI/CD proccess 
to the application apiSampleJava.

The main componentes are the following:
1. Kubernetes cluster, currently hosted in Google Cloud, using Google Kubernete Engine (GKE)
2. Jenkins, as automation server, deployed in the Kubernetes cluster using helm.
3. Github as SCM
4. Google Container Registry as Docker Images Registry

## Kubernetes powered by GKE
