## Deploying a K3S infrastructure with Vagrant

These scripts allow the deployment of a Kubernetes cluster running in Vagrant using K3S.
By default, the script deploys a cluster having 2 master nodes and 2 worker nodes. If you need more nodes, just reconfigure Vagrantfile.

## Tools required

* [VirtualBox 6.1](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant	2.2.*](https://www.vagrantup.com/downloads.html)


## Create or Destroy a local K3S cluster 

In order to allow Kubernetes nodes to communicate with each other in SSH, you can create it yourself before starting the deployment via Vagrant.
```bash
> ssh-keygen -f ./.ssh/id_rsa
```

You can launch the deployment with a simple command.
```bash
> vagrant up
```

If you no longer need the cluster, you can destroy it with a simple.
```bash
> vagrant destroy -f
```

## Connect to K3S cluster
Run the script that will allow you to download kubectl and configure it to connect to our cluster without affecting any of the configuration already on the host.
```bash
> source ./scripts/configure_kubectl.sh
```
