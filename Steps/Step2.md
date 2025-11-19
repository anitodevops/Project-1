# Steps for Pre-Build Phase

## Step 2: Create & Configure Application-Production Server

### Production Server Creation

- Launch a t2.micro Ubuntu 22.04 EC2 instance in AWS

![App-Server](https://github.com/anitodevops/Project-1/blob/dev/Images/Application%20Server%20.png)

-	Open port 22 (SSH) for local/workspace IP only, and port 80 (HTTP) for Anywhere.

|  Protocol  | Port |   Source  |
|------------|------|-----------|
|   SSH      | 22   | 0.0.0.0/0 |
|   HTTP     | 80   | 0.0.0.0/0 |

### Install Node Exporter

-	Download Node Exporter
  ```
  cd /opt
  mkdir node_exporter
  cd node_exporter
  wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz
  tar -xvzf node_exporter-1.8.2.linux-amd64.tar.gz
  mv node_exporter-1.9.1.linux-amd64/* .
   ```
-	 Create Node Exporter User
  
  `sudo useradd --no-create-home --shell /bin/false nodeusr`
 
-	 Move Binary files
  ```
  sudo cp /opt/node_exporter/node_exporter /usr/local/bin/
  sudo chown nodeusr:nodeusr /usr/local/bin/node_exporter
   ```
-	 Create systemd Unit File

Create file:

  `sudo vi /etc/systemd/system/node_exporter.service`

Paste the below code
  ```
  [Unit]
  Description=Node Exporter
  Wants=network-online.target
  After=network-online.target
  
  [Service]
  User=nodeusr
  Group=nodeusr
  Type=simple
  ExecStart=/usr/local/bin/node_exporter \
           --web.listen-address=:9100
  
  [Install]
  WantedBy=multi-user.target
  ```

-	Start Node Exporter Service
  
  ```
  sudo systemctl daemon-reload
  sudo systemctl enable node_exporter
  sudo systemctl start node_exporter
  ```

-	Verify if node_exporter service are active & running
  
  `sudo systemctl status node_exporter`

-	Update SG rules with Node_Exporter Port

  |  Protocol  | Port |   Source  |
  |------------|------|-----------|
  | Custom TCP | 9100| 172.31.8.23/32 |

![App-Server-SG](https://github.com/anitodevops/Project-1/blob/dev/Images/App%20Server-%20SG%20Rules.png)
