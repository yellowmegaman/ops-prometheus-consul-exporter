job "prometheus-consul-exporter" {
  datacenters = ["[[env "DC"]]"]
  type = "system"
  group "prometheus-consul-exporter" {
    task "prometheus-consul-exporter" {
      artifact {
        source = "https://github.com/prometheus/consul_exporter/releases/download/v[[.prometheus-consul-exporter.version]]/consul_exporter-[[.prometheus-consul-exporter.version]].linux-amd64.tar.gz"
      }
      driver = "raw_exec"
      config {
        command = "consul_exporter-[[.prometheus-consul-exporter.version]].linux-amd64/consul_exporter"
      }
      resources {
        cpu    = 50
        memory = [[.prometheus-consul-exporter.ram]]
        network {
          mbits = 10
          port "healthcheck" { static = [[.prometheus-consul-exporter.port]] }
        }
      }
      service {
        name = "prometheus-consul-exporter"
        tags = ["[[.prometheus-consul-exporter.version]]"]
        port = "healthcheck"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        } # check
      } # service
    } # task
  } # group
} # job
