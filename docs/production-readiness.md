# Production Readiness Checklist

## Purpose
This document defines the **production readiness standards** for the Kubernetes cluster
implemented in this repository.

It serves as an operational baseline to ensure the cluster is **highly available,
secure, observable, and maintainable** before hosting critical workloads.

---

## 1. High Availability (HA)

### Control Plane
- ✔ 3 control plane nodes (odd number for etcd quorum)
- ✔ Stacked etcd running on each control plane node
- ✔ External load-balanced API endpoint
- ✔ Control plane components distributed across nodes

### Fault Tolerance
- Tolerates failure of **1 control plane node**
- No single point of failure at API or etcd layer
- Worker node failures do not impact cluster control

---

## 2. etcd Reliability & Safety

### Topology
- etcd runs as **stacked members** on control plane nodes
- Quorum requirement: **2 of 3 members**

### Operational Requirements
- ✔ Regular etcd snapshots (scheduled)
- ✔ Snapshots stored outside the cluster
- ✔ Disk I/O monitored on control plane nodes
- ✔ etcd leader election monitored

> etcd data integrity is critical — no workloads are scheduled on control plane nodes.

---

## 3. Networking & Connectivity

### Cluster Networking
- Pod network CIDR defined during bootstrap
- CNI installed cluster-wide before workloads
- Service networking isolated from pod networking

### API Server Access
- API server accessed only via:
