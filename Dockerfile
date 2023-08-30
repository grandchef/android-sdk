FROM azabost/android-sdk:jdk17-sdk33

ENV ANDROID_SDK_ROOT=/opt/android-sdk-linux

RUN sdkmanager 'build-tools;33.0.2'

RUN apt update -yq \
  && apt -yq install jq curl unzip dirmngr apt-transport-https lsb-release ca-certificates \
  && curl -sL https://deb.nodesource.com/setup_18.x | bash \
  && apt install -yq nodejs \
  && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt update -yq && apt install -yq yarn \
  && mkdir /opt/gradle \
  && wget -nv https://services.gradle.org/distributions/gradle-7.6-bin.zip -O /opt/gradle/gradle-7.6-bin.zip \
  && unzip -q -d /opt/gradle /opt/gradle/gradle-7.6-bin.zip && rm /opt/gradle/gradle-7.6-bin.zip \
  && ln -s /opt/gradle/gradle-7.6/bin/gradle /usr/bin/gradle \
  && rm -rf /var/lib/apt/lists/*
