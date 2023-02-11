FROM debian:stretch

RUN apt update

RUN apt install -y build-essential autoconf automake bison flex gawk libtool libtool-bin libncurses-dev curl file git gperf help2man texinfo unzip wget

RUN useradd -ms /bin/bash sdk

WORKDIR /home/sdk

USER sdk

COPY ./build.sh .

ENTRYPOINT ["./build.sh"]