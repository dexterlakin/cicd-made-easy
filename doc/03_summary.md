# Wrapping Up

By now you will have bootstrapped:
- A Terraform backend
- a [Kubernetes](http://kubernetes.io) cluster
- A Container Registry
- A couple of self-hosted Azure Pipelines Agents using the [Helm](https://helm.sh) package manager

and deployed a Wordpress application via a Pipeline running on those same agents.

This code isn't intended to be production-ready. It's intended to enable teams without any experience to jump in and get started quickly.

After running through the quick install guide, why not familiarise yourself more with some of the key concepts used here:
 - [Kubectl](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
 - [Helm](https://helm.sh/blog/helm-3-released/)
 - [Infrastructure as Code](https://www.terraform.io/)
 - [Pipelines as Code](https://docs.microsoft.com/en-us/azure/devops/pipelines/?view=azure-devops)
 - [Kubernetes Day 2 Operations](https://www.rackspace.com/blog/kubernetes-as-a-service-value-day-2-operations)
 - [Scaling up Azure DevOps](https://docs.microsoft.com/en-us/azure/devops/pipelines/licensing/concurrent-jobs?view=azure-devops#self-hosted-cicd)

Once you're done, here are few more ideas to keep you challenged:
- [Scale up](doc/10_scale_up.md) or down the number of agents running
- Write a pipeline to destroy all Azure resources or [uninstall the agents](./11_uninstall.md)
- Write a pipeline to deploy to another region (hint: Try adding a new [Stage](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/stages?view=azure-devops&tabs=yaml))
- [Customize the Agent Docker image](https://github.com/microsoft/azure-pipelines-image-generation)
- [Secure Azure API permissions](./01_prereqs.md)
- [Secure the Kubernetes cluster](https://kubernetes.io/docs/tasks/administer-cluster/securing-a-cluster/)

Good luck!