FROM mrbarker/exercism-base:0.1.1
LABEL maintainer="mike@thebarkers.com" \
      description="An exercism 'bash' track image." \
      version="0.1.1"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y bats shellcheck

WORKDIR /root/exercism

ENTRYPOINT ["bash"]
CMD ["--login"]
