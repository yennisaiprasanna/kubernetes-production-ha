# Kubernetes Cluster Topology

## Overview
This document defines the **logical and physical topology** of the Kubernetes cluster
implemented in this repository.

The topology follows **enterprise production standards** with clear separation
between control plane and worker responsibilities.

---

## Cluster Composition

### Control Plane Nodes (3)

| Node Name | Role | Responsibilities |
|---|---|---|
| cp-1 | Control Plane | API server, scheduler, controller-manager, etcd |
| cp-2 | Control Plane | API server, scheduler, controller-manager, etcd |
| cp-3 | Control Plane | API server, scheduler, controller-manager, etcd |

**Rationale**
- Odd number required for etcd quorum
- Tolerates failure of 1 control plane node
- Industry-standard production baseline

---

### Worker Nodes (5 – scalable)

| Node Name | Role | Responsibilities |
|---|---|---|
| worker-1 | Worker | Application workloads |
| worker-2 | Worker | Application workloads |
| worker-3 | Worker | Application workloads |
| worker-4 | Worker | Application workloads |
| worker-5 | Worker | Application workloads |

**Notes**
- Worker count is **not fixed**
- Additional workers can be added or removed without impacting cluster control
- Workers are stateless by design

---

## API Server Access

All nodes communicate with the Kubernetes API via a **load-balanced endpoint**: