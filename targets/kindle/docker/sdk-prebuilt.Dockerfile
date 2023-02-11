FROM debian:stretch

RUN apt update

WORKDIR /app

COPY docker/compile.sh /app/compile.sh

ENTRYPOINT ["./compile.sh"]

COPY sdks/koxtoolchain-2021.12.tar.gz /app/koxtoolchain-2021.12.tar.gz


RUN tar -zxvf koxtoolchain-2021.12.tar.gz && rm -rf koxtoolchain-2021.12.tar.gz

RUN apt install -y wget build-essential crossbuild-essential-armel cmake patchelf git libncurses5 libbz2-dev libncurses5-dev libgdbm-dev liblzma-dev libsqlite3-dev uuid-dev libreadline-dev zlib1g-dev libffi-dev libssl-dev libfreetype6-dev libtag1-dev libjsoncpp-dev libgtk2.0-dev libcurl4-openssl-dev libjson-c-dev xterm mc libjpeg-dev libjpeg62 strace libdbus-1-dev libnss3-dev libxml2-dev libpcre3 libpcre3-dev

RUN wget https://www.openssl.org/source/openssl-1.1.1l.tar.gz && tar xzf openssl-1.1.1l.tar.gz && cd openssl-1.1.1l && ./config shared --prefix=/usr/local/ && make -j$(nproc) && make install && cd .. && rm -rf openssl-1.1.1l.tar.gz && rm -rf openssl-1.1.1l
RUN wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tgz && tar xzf Python-3.9.16.tgz && cd Python-3.9.16 && export LDFLAGS="-L/usr/local/lib/ -Wl,-rpath,/usr/local/lib" && export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib/" && export CPPFLAGS="-I/usr/local/include -I/usr/local/include/openssl" && ./configure --prefix=/usr/local/ --with-openssl=/usr/local/ -enable-optimizations --with-ensurepip=install && make -j$(nproc) && make install && cd .. && rm -rf Python-3.9.16.tgz && python3.9 -V && rm -rf Python-3.9.16
