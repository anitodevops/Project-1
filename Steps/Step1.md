# Steps for Pre-Build Phase

## Step 1: Local Workspace Configuration 

###	Install Git.

  `sudo apt install -y git`

-	Configure git identity.

```
git config --global user.name "an*****ps"
git config --global user.email "an****ps@gmail.com"
git config --list
```
### Install Docker, Docker Compose Packages.

- Install Certs & Packages
  
```sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update 
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose 
```

-	Start Docker Service
```
sudo systemctl enable docker 
sudo systemctl start docker
```
-	Verify if Docker service is active & running
```
docker -v
sudo systemctl status docker
```
-	Add user to the Docker group 

  ` sudo usermod -aG docker ubuntu`

  *Close and reopen terminal to see changes.*

-	Copy Paste the Private Key of App-Server to the Local Workspace  current directory

    *File name: **newtestkey.pem***

-	Update file permissions
  
  `chmod 600 newtestkey.pem`

-	Verify SSH Connection into the instance from workspace 

  `ssh -i <newtestkey.pem> ubuntu@<public-ip>`
  
![ssh](https://github.com/anitodevops/Project-1/blob/dev/Images/SSH%20login%20to%20App%20Server%20verification.png)

-	Connect to DockerHub registry.

  `docker login`

-	Open link & paste the one-time password to complete login.

###	Install Java & Jenkins

- Install Packages

  `sudo apt install fontconfig openjdk-21-jre -y`

  ```
   sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  
   sudo apt-get update
   sudo apt-get install jenkins -y
  ```
  
-	Integrate docker with jenkins group

  `sudo usermod -aG docker jenkins`              

-	Start Jenkins service.
  ```
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  ```
-	Verify if Jenkins service is active & running.

  `sudo systemctl status jenkins`

### Install Prometheus , Grafana, Blackbox_exporter  as standalone binaries.
#### Prometheus installation
-	Download Prometheus
  ```
  sudo su 
  cd /opt
  mkdir prometheus
  cd /prometheus 
  wget https://github.com/prometheus/prometheus/releases/download/v3.7.0-rc.0/prometheus-3.7.0-rc.0.linux-amd64.tar.gz
  tar -xvf prometheus*
  rm -rf prometheus*tar*
  ls prome*amd64/
  mv prometheus*amd64/* .
  ```
-	Create Prometheus User
  
`sudo useradd --no-create-home --shell /bin/false prometheus`

-	Move Binaries & Configs
```
sudo mkdir /etc/prometheus /var/lib/prometheus
sudo cp /opt/prometheus/prometheus /usr/local/bin/
sudo cp /opt/prometheus/promtool /usr/local/bin/
sudo cp /opt/prometheus/prometheus.yml /etc/prometheus/
 ```
-	Set ownership
  ```
  sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus
  sudo chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool
  ```
 
-	Create systemd service Unit File

Create file:

  `sudo vi /etc/systemd/system/prometheus.service`

Paste the below code:
  ```
  [Unit]
  Description=Prometheus Monitoring
  Wants=network-online.target
  After=network-online.target
  
  [Service]
  User=prometheus
  Group=prometheus
  Type=simple
  ExecStart=/usr/local/bin/prometheus \
       --config.file=/etc/prometheus/prometheus.yml \
       --storage.tsdb.path=/var/lib/prometheus \
  
  [Install]
  WantedBy=multi-user.target
  ```

#### Grafana Installation

-	Download Grafana 
  ```
  cd /opt
  mkdir grafana 
  cd grafana/ 
  wget https://dl.grafana.com/grafanaenterprise/release/12.2.0/grafanaenterprise_12.2.0_17949786146_Linux_amd64.tar-gz
  tar -xvf grafana-enterprise_12.2.1_17949786146_Linux_amd64.tar-gz >> tar. Log
  ls grafana-12.2.1
  rm -rf grafana-enterprise_12.2.1_17949786146_Linux_amd64.tar-gz tar. log 
  ls grafana-12.2.1/
  Dockerfile  NOTICE. md. VERSION conf packaging. LICENSE. README.md bin. docs plugins-bundled. public tools
  mv grafana-12.2.1/* . 
  ```
-	Create Grafana User
  
  `sudo useradd --no-create-home --shell /bin/false Grafana`

-	Move Binaries & Configs
  
  ```
  sudo mkdir /etc/grafana /var/lib/grafana /var/log/grafana 
  sudo cp /opt/grafana/bin/grafana-server /usr/local/bin/ 
  sudo cp /opt/grafana/bin/grafana-cli /usr/local/bin/ 
  sudo cp /opt/grafana/bin/grafana /usr/local/bin/ 
  sudo cp /opt/grafana/conf/sample.ini /etc/grafana/grafana.ini 
  ```

-	Set ownership
  
  ```
  sudo chown -R grafana:grafana /opt/grafana
  sudo chown grafana:grafana /usr/local/bin/grafana-server /usr/local/bin/grafana-cli /usr/local/bin/grafana
  sudo chown -R grafana:grafana /var/lib/grafana /var/log/grafana /etc/grafana
   ```
-	Create systemd service Unit File
  
Create file:

  `sudo vi /etc/systemd/system/grafana.service`

-	Paste the below code:
  ```
  [Unit]
  Description=Grafana Service
  After=network-online.target
  
  [Service]
  User=grafana
  Group=grafana
  Type=simple
  ExecStart=/usr/local/bin/grafana-server \
   --config=/etc/grafana/grafana.ini \
   --homepath=/opt/grafana \
   --packaging=tar \
  
  Restart=on-failure
  RestartSec=5
  
  [Install]
  WantedBy=multi-user.target
  ```
#### Blackbox_exporter Installation

- Download blackbox_exporter
  
  ```
  cd /opt
  mkdir blackbox_exporter
  cd blackbox_exporter
  wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.25.0/blackbox_exporter-0.25.0.linux-amd64.tar.gz
  tar -xvf blackbox_exporter-*.tar.gz
  rm -rf blackbox_exporter-*.tar.gz
  mv blackbox_exporter-0.25.0.linux-amd64/* .
  ```
  
-	Create blackbox User
  
  `sudo useradd --no-create-home --shell /bin/false blackbox`

-	Move Binaries & Configs
  
  ```
  sudo mkdir /etc/blackbox_exporter
  sudo cp /opt/blackbox_exporter/blackbox.yml /etc/blackbox_exporter/
  sudo cp /opt/blackbox_exporter/blackbox_exporter /usr/local/bin/
  ```
-	Set ownership
  
  ```
  sudo chown -R blackbox:blackbox /etc/blackbox_exporter
  sudo chown blackbox:blackbox /usr/local/bin/blackbox_exporter
  ```
-	Create systemd service Unit File
  
-	Create file

  `sudo vi /etc/systemd/system/blackbox_exporter.service`

Paste this:
  ```
  [Unit]
  Description=Prometheus Blackbox Exporter
  Wants=network-online.target
  After=network-online.target
  
  [Service]
  User=blackbox
  Group=blackbox
  Type=simple
  ExecStart=/usr/local/bin/blackbox_exporter \
    --config.file=/etc/blackbox_exporter/blackbox.yml \
    --web.listen-address=":9115"
  Restart=always
  
  [Install]
  WantedBy=multi-user.target
  ```

#### Start Prometheus, Grafana, Blackbox Services in local workspace 
  ```
  sudo systemctl daemon-reload
  sudo systemctl enable prometheus
  sudo systemctl start prometheus
  sudo systemctl enable Grafana
  sudo systemctl start Grafana
  sudo systemctl enable blackbox_exporter
  sudo systemctl start blackbox_exporter
  
  ```

#### Verify Prometheus, Grafana & Blackbox  Services are Active & Running.
  ```
  sudo systemctl status prometheus
  sudo systemctl status Grafana
  sudo systemctl status blackbox-exporter
  ```
#### Update Local Workspace Security Group Inbound rules 
  
  |  Protocol  | Port |   Source  |
  |------------|------|-----------|
  |   SSH      | 22   | 0.0.0.0/0 |
  |   HTTP     | 80   | 0.0.0.0/0 |
  | Custom TCP | 8080 | 0.0.0.0/0 |
  | Custom TCP | 3000 | 0.0.0.0/0 |
  | Custom TCP | 9090 | 0.0.0.0/0 |
  | Custom TCP | 9115 | 0.0.0.0/0 |

![workspaceSG](https://github.com/anitodevops/Project-1/blob/dev/Images/Local%20Workstation%20-%20SG%20Rules.png)
