# Scaling and Replication in Kubernetes

To scale the application, you can increase the number of replicas in the deployment configuration. This will launch more pods to handle the increased load.

Here's how to scale the deployments:

1.  **Using `kubectl scale` command:**

    ```bash
    kubectl scale deployment/todo-api --replicas=3
    kubectl scale deployment/todo-frontend --replicas=3
    ```

    This command will update the number of replicas for the `todo-api` and `todo-frontend` deployments to 3.

2.  **Using `kubectl edit` command:**

    ```bash
    kubectl edit deployment/todo-api
    kubectl edit deployment/todo-frontend
    ```

    This command will open the deployment configuration in a text editor. You can then modify the `replicas` field to the desired number.

3.  **Applying a modified YAML file:**

    Modify the `replicas` field in your deployment YAML files (e.g., `api-deployment.yaml` and `frontend-deployment.yaml`) and apply the changes using `kubectl apply`:

    ```bash
    kubectl apply -f api-deployment.yaml
    kubectl apply -f frontend-deployment.yaml
    ```

You can also configure Horizontal Pod Autoscaling (HPA) to automatically adjust the number of replicas based on metrics like CPU utilization or memory usage.

Here's how to create an HPA for the `todo-api` deployment:

```bash
kubectl autoscale deployment todo-api --cpu-percent=80 --min=1 --max=5
```

This command will create an HPA that targets the `todo-api` deployment, aiming for 80% CPU utilization, with a minimum of 1 replica and a maximum of 5 replicas.