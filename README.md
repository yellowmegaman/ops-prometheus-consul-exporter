# ops-prometheus-consul-exporter

Allows you to deploy prometheus-consul-exporter via Nomad

Expects "DC" env variable.

Example:

```
levant deploy -address=http://your-nomad-installation-or-cluster:4646 -var-file=vars.yaml ops-prometheus-consul-exporter.nomad
```
