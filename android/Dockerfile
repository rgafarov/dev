FROM dev-nvim

# java
RUN curl -LO https://download.oracle.com/java/23/latest/jdk-23_linux-x64_bin.deb && \
    dpkg -i jdk-23_linux-x64_bin.deb && \
    rm jdk-23_linux-x64_bin.deb && \
    curl -LO https://services.gradle.org/distributions/gradle-8.12-bin.zip && \
    unzip -d /opt/gradle gradle-8.12-bin.zip && \
    rm gradle-8.12-bin.zip && \
    apt remove -y cmake
ENV PATH=$PATH:/opt/gradle/gradle-8.12/bin


# android
ENV ANDROID_SDK_URL=https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip
ENV ANDROID_VERSION=33
ENV ANDROID_NDK_VERSION=21.4.7075529
ENV ANDROID_API_LEVEL=android-${ANDROID_VERSION}
ENV ANDROID_BUILD_TOOLS_VERSION=${ANDROID_VERSION}.0.0
ENV ANDROID_HOME=/usr/local/android-sdk-linux
ENV ANDROID_NDK_HOME=${ANDROID_HOME}/ndk/${ANDROID_NDK_VERSION}/

ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
ENV PATH=${ANDROID_NDK_HOME}:${ANDROID_NDK_HOME}/prebuilt/linux-x86_64/bin/:$PATH

RUN mkdir .android "$ANDROID_HOME"  && cd "$ANDROID_HOME" && \
    curl -o sdk.zip $ANDROID_SDK_URL && unzip sdk.zip && \
    rm sdk.zip

RUN yes | ${ANDROID_HOME}/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_HOME --licenses
RUN $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_HOME --update
RUN $ANDROID_HOME/cmdline-tools/bin/sdkmanager --sdk_root=$ANDROID_HOME "build-tools;30.0.3" \
    "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools" \
    "ndk;$ANDROID_NDK_VERSION"

RUN cp $ANDROID_HOME/build-tools/30.0.3/dx $ANDROID_HOME/build-tools/33.0.0/dx && \
    cp $ANDROID_HOME/build-tools/30.0.3/lib/dx.jar $ANDROID_HOME/build-tools/33.0.0/lib/dx.jar

RUN chown -R dev:dev "/opt/gradle" && chmod -R 755 "/opt/gradle" && \
    chown -R dev:dev "$ANDROID_HOME" && chmod -R 755 "$ANDROID_HOME"

USER dev:dev
