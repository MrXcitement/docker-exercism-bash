FROM debian:9
LABEL maintainer="mike@thebarkers.com" \
      description="An exercism 'bash' track image." \
      version="0.1.1"

# Install git, process tools
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git procps tree vim wget 

# Install exercism tool
RUN cd /tmp \
    && wget https://github.com/exercism/cli/releases/download/v3.0.11/exercism-linux-64bit.tgz \
    && tar xzf exercism-linux-64bit.tgz \
    && mv exercism /usr/local/bin/

# Install bash dev tools
RUN apt-get install -y bats shellcheck

# Clean up apt repo
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/exercism

CMD ["bash", "--login"]
