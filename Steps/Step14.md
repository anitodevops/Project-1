# Steps for Monitor Phase

## Step 1: Setup Prometheus Targets in Local Workspace Server

### Add Prometheus targets to yaml file to monitor Docker container health

#### Node exporter – Application Server Metrics

  ```
  sudo vi /etc/prometheus/prometheus.yml 
   - job_name: "node_exporter"
  
   # metrics_path defaults to '/metrics'
     # scheme defaults to 'http'.
  
   static_configs:
       - targets: ["52.66.255.233:9100"]         
        # The label name is added as a label `label_name=<label_value>` to any timeseries scraped from this config.
         labels:
           app: "node_exporter" 
  ```

#### Blackbox exporter – frontend metrics of the website

  ```
  sudo vi /etc/prometheus/prometheus.yml
    - job_name: "OnlineShop-Health"
      metrics_path: /probe
      params:
        module: [http_2xx]
      static_configs:
        - targets:
            - http://3.109.108.249:80
      relabel_configs:
        - source_labels: [__address__]
          target_label: __param_target
        - source_labels: [__param_target]
          target_label: instance
        - target_label: __address__
          replacement: localhost:9115 
  ```

-	Restart the prometheus service 

    `sudo systemctl restart prometheus`
 	
-	Verify service status 

    `sudo systemctl status prometheus`
 	
-	Browser Verification of prometheus Targets 

    `http://<localhost-ip>:9090/targets`


