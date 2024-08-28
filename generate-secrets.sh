#!/bin/bash

# Generate random password and Erlang cookie
RABBITMQ_PASSWORD=$(openssl rand -base64 12)
ERLANG_COOKIE=$(openssl rand -base64 32)

# Create Kubernetes secrets
kubectl create secret generic rabbitmq-admin-password --from-literal=rabbitmq-password="$RABBITMQ_PASSWORD"
kubectl create secret generic rabbitmq-erlang-cookie --from-literal=rabbitmq-erlang-cookie="$ERLANG_COOKIE"

echo "Secrets created successfully!"