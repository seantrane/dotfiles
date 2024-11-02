FROM node:lts

ENV DEBIAN_FRONTEND noninteractive

ARG CHROME_RELEASE
ENV CHROME_RELEASE "${CHROME_RELEASE:-117}"
ARG CHROMEDRIVER_DIR
ENV CHROMEDRIVER_DIR "${CHROMEDRIVER_DIR:-/usr/bin}"
ARG CHROMEDRIVER_VERSION
ENV CHROMEDRIVER_VERSION "${CHROMEDRIVER_VERSION:-117.0.5938.149}"
ARG DOCKER_COMPOSE_VERSION
ENV DOCKER_COMPOSE_VERSION "${DOCKER_COMPOSE_VERSION:-2.30.1}"

ENV PATH "${CHROMEDRIVER_DIR}:$PATH"

RUN echo "Installing system dependencies." \
  && apt-get update && apt-get install --no-install-recommends --no-install-suggests -yq \
    apt-transport-https \
    ca-certificates \
    curl \
    fonts-liberation \
    gnupg \
    groff \
    less \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libcurl3-gnutls \
    libdrm2 \
    libexpat1 \
    libgbm1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libu2f-udev \
    libvulkan1 \
    libx11-6 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    lsb-release \
    python3 \
    python3-pip \
    python3-setuptools \
    software-properties-common \
    unzip \
    xdg-utils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  \
  && pip3 --no-cache-dir install --upgrade pip \
  && pip3 --no-cache-dir install --upgrade awscli \
  ;

RUN echo "Finding latest release-version for Google Chrome v${CHROME_RELEASE}" \
  && CFT_VERSION="$(curl -o - https://googlechromelabs.github.io/chrome-for-testing/LATEST_RELEASE_${CHROME_RELEASE})" \
  && [ -n "$CFT_VERSION" ] && CHROMEDRIVER_VERSION="$CFT_VERSION" \
  \
  && echo "Installing Google Chrome ${CHROMEDRIVER_VERSION}" \
  && curl -LO "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROMEDRIVER_VERSION}/linux64/chrome-linux64.zip" \
  && unzip chrome-linux64.zip -d /opt \
  && rm -f chrome-linux64.zip \
  && ln -s /opt/chrome-linux64/chrome /usr/bin/chrome \
  \
  && echo "Installing Google ChromeDriver ${CHROMEDRIVER_VERSION}" \
  && curl -LO "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROMEDRIVER_VERSION}/linux64/chromedriver-linux64.zip" \
  && unzip chromedriver-linux64.zip -d /opt/selenium \
  && rm -f chromedriver-linux64.zip \
  && ln -s /opt/selenium/chromedriver-linux64/chromedriver /usr/bin/chromedriver \
  \
  && echo "Making files owned by root and executable." \
  && for i in /usr/bin/chrome /opt/chrome-linux64 /usr/bin/chromedriver /opt/selenium/chromedriver-linux64; do chown root:root "$i" && chmod +x "$i"; done \
  \
  && echo "Installing Docker Compose." \
  && curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose \
  ;
