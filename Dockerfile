FROM ubuntu:18.04

WORKDIR /home/proxy

RUN apt update -y
RUN apt install -y git wget build-essential gcc binutils --fix-missing

RUN apt install -y python2.7-dev python2.7
RUN python2.7 -V
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python2.7 get-pip.py
RUN python2.7 -m pip install virtualenv

RUN git clone https://github.com/djkabutar/stratum-mining-proxy.git && \
    git clone https://github.com/djkabutar/stratum.git

RUN pip2 install --user ./stratum

RUN alias python2="python2.7"

EXPOSE 3333
EXPOSE 8332

ENTRYPOINT ["python2.7", "stratum-mining-proxy/mining_proxy.py", "--enable-stratum-extensions"]
