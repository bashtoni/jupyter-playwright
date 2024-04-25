ARG REGISTRY=quay.io
ARG OWNER=jupyter
ARG BASE_CONTAINER=$REGISTRY/$OWNER/minimal-notebook
FROM $BASE_CONTAINER
LABEL maintainer="Sam Bashton <sam@correctedcloud.au>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# playwright prerequisites
RUN apt-get update --yes && \
      apt-get install --yes --no-install-recommends \
      libasound2\
      libatk1.0-0\
      libatk-bridge2.0-0\
      libatomic1\
      libatspi2.0-0\
      libcairo-gobject2\
      libcups2\
      libdbus-1-3\
      libdrm2\
      libenchant-2-2\
      libevent-2.1-7\
      libflite1\
      libgbm1\
      libgdk-pixbuf-2.0-0\
      libgles2\
      libgstreamer1.0-0\
      libgstreamer-gl1.0-0\
      libgstreamer-plugins-bad1.0-0\
      libgstreamer-plugins-base1.0-0\
      libgtk-3-0\
      libharfbuzz-icu0\
      libhyphen0\
      libmanette-0.2-0\
      libnspr4\
      libnss3\
      libopus0\
      libpango-1.0-0\
      libpangocairo-1.0-0\
      libsecret-1-0\
      libvpx7\
      libwebpdemux2\
      libwoff1\
      libx11-xcb1\
      libx264-163\
      libxcomposite1\
      libxcursor1\
      libxdamage1\
      libxfixes3\
      libxkbcommon0\
      libxrandr2\
      libxslt1.1\
      && apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# Install playwright, dependencies and browsers
RUN pip install --no-cache-dir playwright && \
    python -m playwright install
