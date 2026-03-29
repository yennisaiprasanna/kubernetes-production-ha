# Kubernetes Cluster Initialization (kubeadm – Production)

## Purpose
This document describes the initialization of a **highly available Kubernetes control plane**
using `kubeadm`, following enterprise production best practices.

---

## Control Plane Design

- **Number of control plane nodes:** 3 (odd number for etcd quorum)
- **etcd topology:** Stacked etcd (runs on control plane nodes)
- **API access:** Load-balanced endpoint
- **Worker nodes:** Isolated from control plane responsibilities

---

## Prerequisites (ALL NODES)

### System Requirements
- OS: Ubuntu 20.04+ / RHEL 8+
- CPU: ≥ 2 cores
- Memory: ≥ 4 GB
- Swap: Disabled
- Time sync: Enabled (chrony / ntpd)

```bash
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab
