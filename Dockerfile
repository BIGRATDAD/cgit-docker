FROM rockylinux:9
LABEL MAINTAINER="Lambda <lambda@disroot.org>"

# Update everything; install dependencies.
RUN dnf -y update && dnf -y upgrade \
    && dnf install -y git gcc make openssl-devel zlib-devel zip \
    highlight httpd \
    && dnf clean all

# Install cgit.
RUN git clone https://git.zx2c4.com/cgit
ADD cgit.conf cgit
RUN cd cgit \
    && git submodule init \
    && git submodule update \
    && make NO_LUA=1 \
    && make install \
    && cd .. \
    && rm -rf cgit

# Configure.
ADD etc/cgitrc /etc/cgitrc
ADD etc/httpd/httpd.conf /etc/httpd/conf/httpd.conf

# Add custom syntax highlighting.
COPY opt/highlight.sh  /opt/highlight.sh

# You SHOULD run this behind a reverse proxy.
# Thus, 443 isn't being exposed.
EXPOSE 80
CMD [ "httpd", "-DFOREGROUND" ]