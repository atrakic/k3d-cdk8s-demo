# Hello cdk8s (in Python!)

![cdk8s-k3d](https://github.com/atrakic/k3d-cdk8s-demo/workflows/cdk8s-k3d/badge.svg)

This example application deploys [hello-kubernetes](https://github.com/paulbouwer/hello-kubernetes) using [cdk8s](https://cdk8s.io/).

You can apply this example into your own cluster with these step by step commands:

#### Import

```console
$ pipenv install
$ cdk8s import --language python
```

#### Synthesize the CDK into a k8s template
```console
$ cdk8s synth
```

#### Apply the k8s template to your cluster
```console
$ kubectl apply -f dist/hello.k8s.yaml
```

## Demo


```console
make status
NAME                             TYPE           CLUSTER-IP    EXTERNAL-IP                   PORT(S)        AGE     SELECTOR
service/kubernetes               ClusterIP      10.43.0.1     <none>                        443/TCP        2m40s   <none>
service/hello-service-c8685ad9   LoadBalancer   10.43.174.4   192.168.240.2,192.168.240.3   80:32694/TCP   2m8s    app=hello

NAME                                             READY   STATUS    RESTARTS   AGE    IP          NODE                       NOMINATED NODE   READINESS GATES
pod/svclb-hello-service-c8685ad9-mvrxw           1/1     Running   0          2m8s   10.42.1.4   k3d-k3s-default-agent-0    <none>           <none>
pod/svclb-hello-service-c8685ad9-kg2pk           1/1     Running   0          2m8s   10.42.0.5   k3d-k3s-default-server-0   <none>           <none>
pod/hello-deployment-c8aab50d-586bd8cf75-rs827   1/1     Running   0          2m8s   10.42.0.3   k3d-k3s-default-server-0   <none>           <none>
pod/hello-deployment-c8aab50d-586bd8cf75-6d967   1/1     Running   0          2m8s   10.42.0.4   k3d-k3s-default-server-0   <none>           <none>
```

For more details see: [Demo](https://github.com/atrakic/k3d-cdk8s-demo/actions),
  [Source gh-action](./.github/workflows/cdk8s-k3d.yml), [K3d config](./k3d.yaml)


## Credits
https://github.com/cdk8s-team/cdk8s/tree/master/examples/python/web-service
