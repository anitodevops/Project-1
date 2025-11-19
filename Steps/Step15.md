# Steps for Monitor Phase

## Step 2: Create Dashboards in Grafana

### Login to Grafana 

Link - `http://<localhost-public-id>:3000`

### Credentials 

- username : admin 
- password : admin

### Setup Data Source for Grafana 

- Add Connections -> Data Source -> Choose Prometheus
  
    - Payload URL : http://<localhost>:9090
    - Save & Test
    - Displays Output msg: Data source is working

### Import Dashboard 

- Application Server Metrics - Dashboard ID -  1860 – choose Source - Prometheus -> import

- Website health Dashboard ID – 7587 – choose Source - Prometheus -> click import 

### Visualize Application Metrics in Grafana Dashboard.

### Prometheus Dashboard 

![prometheus](https://github.com/anitodevops/Project-1/blob/dev/Images/Prometheus%20Dashboard.png)

### Application Server Metrics

![App-Server](https://github.com/anitodevops/Project-1/blob/dev/Images/Application%20Server%20Metrics.png)

### OnlineShop Website Health

![website](https://github.com/anitodevops/Project-1/blob/dev/Images/OnlineShop%20-%20Health.png)

