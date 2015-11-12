FROM ubuntu:15.10
MAINTAINER Christof Dorner (https://github.com/chdorner)

RUN apt-get update
RUN apt-get install -yq \
  sudo \
  tmux \
  git \
  vim

RUN useradd -m dev && echo "dev:dev" | chpasswd && adduser dev sudo
RUN sed -i.bkp -e \
  's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
  /etc/sudoers

USER dev
WORKDIR /home/dev
RUN touch ~/.sudo_as_admin_successful


ADD .tmux.conf .tmux.conf
ADD .bashrc /home/dev/.bashrc
ADD .inputrc /home/dev/.inputrc
ADD .gitconfig /home/dev/.gitconfig

CMD ["tmux"]
