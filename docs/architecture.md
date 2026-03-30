# Kubernetes Production Architecture

## Control Plane
- 3 Nodes (HA)
- Stacked etcd

## Workers
- Application workloads

## Components
- ArgoCD (GitOps)
- NGINX Ingress
- Calico (CNI)

## External
- Edge Load Balancer (TCP 6443)
- DevOps VM (Jenkins, Harbor)
- PostgreSQL VM

## Flow
User → Edge LB → Ingress → Service → Pods