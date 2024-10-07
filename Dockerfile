FROM almalinux:latest

# Set environment variables (optional)
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# Update the package repository and install any necessary packages
RUN dnf -y update && \
    dnf -y install vim curl && \
    dnf clean all

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.13.4-linux-x86_64.tar.gz && \
    tar xzvf elastic-agent-8.13.4-linux-x86_64.tar.gz && \
    cd elastic-agent-8.13.4-linux-x86_64 && \
    sudo ./elastic-agent install \
      --fleet-server-es=http://10.20.20.125:9200 \
      --fleet-server-service-token=AAEAAWVsYXN0aWMvZmxlZXQtc2VydmVyL3Rva2VuLTE3MjgyODU3OTIwMjg6V2p3N0ctTTVUZEs0X0lVQURybGRHZw \
      --fleet-server-policy=fleet-server-policy \
      --fleet-server-port=8220


    #   curl -L -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-8.13.4-linux-x86_64.tar.gz
    #   tar xzvf elastic-agent-8.13.4-linux-x86_64.tar.gz
    #   cd elastic-agent-8.13.4-linux-x86_64
    #   sudo ./elastic-agent install \
    #     --fleet-server-es=http://10.20.20.125:9200 \
    #     --fleet-server-service-token=AAEAAWVsYXN0aWMvZmxlZXQtc2VydmVyL3Rva2VuLTE3MjgyODU3OTIwMjg6V2p3N0ctTTVUZEs0X0lVQURybGRHZw \
    #     --fleet-server-policy=119a875e-706c-4641-8135-96a3e3f53ed0 \
    #     --fleet-server-port=8220