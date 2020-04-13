## Introduction

### Why doesn't my company use Kubernetes?

The main use-case for Kubernetes is microservices, ie. [production applications](https://12factor.net/). Understandably it can be scary to put production applications on a relatively new and unknown technology stack.

As a result a lot of organisations run into a chicken-and-egg scenario with Kubernetes. They're often reluctant to adopt Kubernetes, despite its benefits, because tech teams don't have enough hands-on experience with it. Technology teams can't gain hands-on experience with Kubernetes, because the business won't adopt it.

### When will my company use Kubernetes?

You could start right now! -- A solution to the stalemate described above is to adopt Kubernetes for your CI/CD infrastructure. Build Agents are the perfect use-case for Kubernetes: They need to be [cattle not pets](https://devops.stackexchange.com/questions/653/what-is-the-definition-of-cattle-not-pets), but are far enough from production systems that the risk should be acceptable to the business. This allows tech teams to ramp up and gain experience of running 'production' Kubernetes infrastructure, before adopting it for enterprise applications.

### What's this repo about?

This repo was designed to get anyone up and running self-hosted Azure DevOps Agents on Azure's managed Kubernetes service, AKS.
Everything will be deployed as code, and the walkthrough can be completed in under an hour!

By the end of you will have bootstrapped:
- A Terraform backend
- A working [Kubernetes](http://kubernetes.io) cluster
- A Container Registry
- A couple of self-hosted Azure Pipelines Agents using the [Helm](https://helm.sh) package manager

and deployed a Wordpress application via a Pipeline running on those same agents.

### **<div align="center">[Let's get started!](doc/01_prereqs.md)</div>**