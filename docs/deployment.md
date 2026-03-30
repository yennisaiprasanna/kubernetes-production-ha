# Deployment Guide

## Step 1: Clone Repo
git clone <repo>

## Step 2: Apply ArgoCD App
kubectl apply -f k8s/argocd/app.yaml

## Step 3: Verify
kubectl get pods -A
kubectl get ingress -A

## Step 4: Access
https://argocd.example.com