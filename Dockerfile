FROM alpine:latest
LABEL maintainer="cmartorella@edge-security.com"

ENV PACKAGES curl openssl python3 openblas libstdc++ libpng freetype
ENV BUILD_ESSENTIAL make gcc g++ python3-dev openblas-dev libpng-dev freetype-dev
ENV PIP_PACKAGE  matplotlib pandas pandas-datareader jupyter censys datetime pprint requests jira

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

RUN apk add --no-cache --update ${PACKAGES} ${BUILD_ESSENTIAL} \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && python3 -m venv /env/ \
    && /env/bin/pip install --upgrade pip \
    && /env/bin/pip install numpy \
    && /env/bin/pip install ${PIP_PACKAGE} \
    && apk del ${BUILD_ESSENTIAL} \
    && rm -rf /var/cache/apk/* \
    && rm -rf /root/.cache/pip/*

RUN /env/bin/pip install jupyter_dashboards
RUN /env/bin/jupyter dashboards quick-setup --sys-prefix

VOLUME /opt/
EXPOSE 8888

CMD ["/env/bin/jupyter", "dashboards", "quick-setup", "--sys-prefix"]

CMD ["/env/bin/jupyter", "notebook", "--allow-root"]
