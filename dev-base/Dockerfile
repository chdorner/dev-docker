FROM ubuntu:15.10
MAINTAINER Christof Dorner (https://github.com/chdorner)

RUN apt-get update && apt-get install -yq \
  sudo \
  git \
  curl \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m dev && echo "dev:dev" | chpasswd && \
  adduser dev sudo && touch /home/dev/.sudo_as_admin_successful && \
  sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

USER dev
WORKDIR /home/dev

ADD .bashrc /home/dev/.bashrc
ADD .inputrc /home/dev/.inputrc
ADD .gitconfig /home/dev/.gitconfig

RUN sudo chown dev:dev -R /home/dev

CMD ["bash"]
