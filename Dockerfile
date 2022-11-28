FROM azabost/android-sdk:jdk11-sdk32

ENV ANDROID_SDK_ROOT=/opt/android-sdk-linux

RUN apt update -yq \
  && apt -yq install jq curl dirmngr apt-transport-https lsb-release ca-certificates \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash \
  && apt install -yq nodejs \
  && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt update -yq && apt install -yq yarn \
  && mkdir /opt/gradle \
  && wget -nv https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -O /opt/gradle/gradle-7.4.2-bin.zip \
  && unzip -q -d /opt/gradle /opt/gradle/gradle-7.4.2-bin.zip && rm /opt/gradle/gradle-7.4.2-bin.zip \
  && ln -s /opt/gradle/gradle-7.4.2/bin/gradle /usr/bin/gradle \
  && curl -sSL https://rvm.io/mpapis.asc | gpg --import - \
  && curl -sSL https://rvm.io/pkuczynski.asc | gpg --import - \
  && curl -sSL https://get.rvm.io | bash -s stable --ruby \
  && bash -c "source /usr/local/rvm/scripts/rvm && gem install bundler" \
  && rm -rf /var/lib/apt/lists/*
