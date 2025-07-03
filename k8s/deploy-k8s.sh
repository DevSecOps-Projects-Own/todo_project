#!/bin/bash

set -e

kubectl apply -f django-secret.yaml
kubectl apply -f postgres-pvc.yaml
kubectl apply -f postgres-deployment.yaml
kubectl apply -f postgres-service.yaml

# Wait for PostgreSQL to be ready
echo "Waiting for PostgreSQL to be ready..."
kubectl get po | grep postgres | grep -v 'Running' | awk '{print $1}' | while read pod; do
  kubectl wait --for=condition=Ready pod/$pod --timeout=60s
  printf "PostgreSQL pod %s is ready.\n" "$pod"
done

# Apply Django deployment and service
kubectl apply -f django-deployment.yaml
kubectl apply -f django-service.yaml

# Wait for Django to be ready
echo "Waiting for Django to be ready..."
kubectl get po | grep django | grep -v 'Running' | awk '{print $1}' | while read pod; do
  kubectl wait --for=condition=Ready pod/$pod --timeout=60s
  printf "Django pod %s is ready.\n" "$pod"
done

# # apply migrations
# echo "Applying Django migrations..."
# kubectl exec -it $(kubectl get pods --selector=app=django -o jsonpath='{.items[0].metadata.name}') -- python manage.py migrate  
# echo "Django migrations applied successfully."

# Port-forward the Django service
echo "Port-forwarding Django service..."
kubectl port-forward service/django-service 8000:8000 &
echo "Django service is now accessible at http://localhost:8000"
