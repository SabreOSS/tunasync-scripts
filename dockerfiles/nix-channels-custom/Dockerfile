FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y python3-dev python3-pip python3-pyquery python3-requests curl lsb-release

RUN if [ "$(uname -m)" != "x86_64" -a "$(uname -m)" != "i386" ]; then \
      apt-get install -y libxml2-dev libxslt1-dev zlib1g-dev ;\
    fi
RUN pip3 install minio==5.0.10 --break-system-packages

## Download and install Fuse
RUN export GCSFUSE_REPO=gcsfuse-$(lsb_release -c -s) && \
    echo ${GCSFUSE_REPO} && \
    ( echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt ${GCSFUSE_REPO} main" \
    | tee /etc/apt/sources.list.d/gcsfuse.list ) && \
    ( curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | tee /usr/share/keyrings/cloud.google.asc )

RUN apt-get update && apt-get -y install gcsfuse

# Download nix. Nix store is configured once PVC is mounted
RUN mkdir -p /tmp/nix.unpack && \
    curl -L https://mirrors.tuna.tsinghua.edu.cn/nix/nix-2.3.2/nix-2.3.2-$(arch)-linux.tar.xz | tar -xpJ -C /tmp/nix.unpack && \
    mkdir -p /nix

COPY nix-channels.py /tmp
CMD /bin/bash
