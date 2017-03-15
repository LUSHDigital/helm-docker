FROM google/cloud-sdk

MAINTAINER Simon Ince <simon.ince@lush.co.uk>

ENV VERSION v2.2.2
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz

WORKDIR /

ADD https://storage.googleapis.com/kubernetes-helm/${FILENAME} /tmp

COPY helm_install_or_upgrade /bin/

RUN tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp
