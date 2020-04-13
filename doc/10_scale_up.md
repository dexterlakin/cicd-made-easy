## Scale up the number of agents

To scale the number of agents to `10`, edit the [helm values.yaml](../helm/values.yaml) and set `replicas` to `10`. Then run the helm pipeline to deploy the changes.

Using this declarative approach is preferable to using the declarative command:

```bash
kubectl scale --namespace <NAMESPACE> statefulset/vsts-agent --replicas 10
```

Because it allows for scaling actions to be tracked via the Git commit log.