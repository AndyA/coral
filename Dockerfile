FROM debian:11

WORKDIR /home/coral
ENV HOME=/home/coral

RUN apt-get update
RUN apt-get install -y \
  gnupg2               \
  vim                  \
  python3              \
  pkg-config           \
  usbutils             \
  python3-dev          \
  python3-pil          \
  python3-numpy        \
  apt-transport-https  \
  curl                 \
  strace               \
  git                  \
  wget

RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" \
  > /etc/apt/sources.list.d/coral-edgetpu.list

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  
RUN apt-get update
RUN apt-get install -y \
  libedgetpu1-std      \
  python3-pycoral

RUN apt-get upgrade -y
