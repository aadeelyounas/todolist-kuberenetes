# ToDo App

This is a simple ToDo application built with React, Node.js, Express, and PostgreSQL to Deploy on Kuberenetes.

## Prerequisites

-   Node.js
-   Docker
-   Docker Compose
-   kubectl (if deploying to Kubernetes)

## Getting Started

1.  Clone the repository:

    ```bash
    git clone <repository-url>
    cd ToDo-kube
    ```

2.  Set up the database:

    -   **Using Docker Compose:**

        ```bash
        docker-compose up -d postgres
        ```

    -   **Using Kubernetes:**

        Apply the PostgreSQL deployment and service:

        ```bash
        kubectl apply -f postgres-deployment.yaml
        kubectl apply -f postgres-service.yaml
        ```

3.  Set up the backend API:

    ```bash
    cd api
    npm install
    npm start
    ```

4.  Set up the frontend:

    ```bash
    cd frontend
    npm install
    npm start
    ```

## Deployment

-   **Using Docker Compose:**

    ```bash
    docker-compose up -d
    ```

-   **Using Kubernetes:**

    Apply the API and frontend deployments and services:

    ```bash
    kubectl apply -f api-deployment.yaml
    kubectl apply -f frontend-deployment.yaml
    kubectl apply -f api-service.yaml
    kubectl apply -f frontend-service.yaml
    ```

## Scaling and Replication (Kubernetes)

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