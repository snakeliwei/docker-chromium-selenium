FROM alpine:3.8
LABEL maintainer="lyndon <snakeliwei@gmail.com>"

ENV LANG C.UTF-8
ENV CHROMEDRIVER_VERSION 2.42

COPY ./xvfb-chromium /usr/bin/xvfb-chromium
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main "freetype>2.8" "harfbuzz>1.6" && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community udev ttf-freefont chromium chromium-chromedriver nss && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing ratpoison && \
    apk add --no-cache --update 'su-exec>=0.2' tzdata bash curl xvfb python3 unzip x11vnc xterm && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    pip3 install selenium && \
    rm -rf /var/cache/apk/* && \
    ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
    # ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser 
EXPOSE 5900
CMD ["xvfb-chromium"]
