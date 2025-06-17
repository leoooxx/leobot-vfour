FROM fedora:37

RUN dnf -y update && \
    dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                   https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm && \
    dnf install -y git ffmpeg ImageMagick nodejs libwebp yarn && \
    dnf clean all -y

WORKDIR /zimbot

COPY . /zimbot

RUN yarn install

CMD ["node", "."]
