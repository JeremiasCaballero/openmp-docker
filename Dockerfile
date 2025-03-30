FROM debian:bullseye-slim

RUN dpkg --add-architecture i386 && \
    apt update -y && \
    apt install -y libc6:i386 wget unzip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /samp-server


RUN wget -O omp-server.tar.gz https://github.com/openmultiplayer/open.mp/releases/download/v1.4.0.2779/open.mp-linux-x86.tar.gz


RUN tar -xvzf omp-server.tar.gz && ls -l /samp-server 


RUN rm omp-server.tar.gz && chmod +x Server/omp-server

EXPOSE 7777/udp

CMD ["./Server/omp-server"]
