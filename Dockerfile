# docker build -t docker-ctf .
# If using Windows
      # docker run --rm -v %cd%:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i docker-ctf
# If using Linux    
      # docker run --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i docker-ctf
# docker exec -it container-id /bin/bash

FROM ubuntu:latest
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get upgrade && apt-get update && \
apt-get install -y build-essential pngtools jq emacs strace cmake libssl-dev libffi-dev ltrace curl wget rubygems gcc dnsutils netcat net-tools gdb gdb-multiarch python python3 python3-pip python3-dev wget git make procps && \
pip install capstone requests pwntools r2pipe ropper && \
mkdir tools && cd tools && \
git clone https://github.com/JonathanSalwan/ROPgadget && \
git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh && \
cd .. && git clone https://github.com/niklasb/libc-database && cd libc-database && ./get ubuntu && \
gem install one_gadget