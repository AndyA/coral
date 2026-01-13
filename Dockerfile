FROM debian:10

WORKDIR /home
ENV HOME=/home
RUN cd ~

RUN echo "deb http://archive.debian.org/debian buster main" \
  > /etc/apt/sources.list
RUN echo "deb http://archive.debian.org/debian-security buster/updates main" \
  >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y \
  gnupg2               \
  vim-tiny             \
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

RUN git clone https://github.com/google-coral/pycoral.git
RUN cd pycoral && bash examples/install_requirements.sh classify_image.py
COPY robin.jpg /home/pycoral/test_data/robin.jpg
