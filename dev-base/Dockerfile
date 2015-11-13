FROM ubuntu:15.10
MAINTAINER Christof Dorner (https://github.com/chdorner)

RUN apt-get update
RUN apt-get install -yq \
  sudo \
  git \
  silversearcher-ag \
  vim

RUN useradd -m dev && echo "dev:dev" | chpasswd && adduser dev sudo
RUN sed -i.bkp -e \
  's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' \
  /etc/sudoers

USER dev
WORKDIR /home/dev
RUN touch ~/.sudo_as_admin_successful

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  git -C ~/.vim/bundle/Vundle.vim checkout -qf 5f70ae6025e951f0154e3940d123138adffa4c88

ADD .bashrc /home/dev/.bashrc
ADD .inputrc /home/dev/.inputrc
ADD .gitconfig /home/dev/.gitconfig
ADD .vimrc* /home/dev/

RUN vim -u /home/dev/.vimrc.vundle +PluginInstall +qall

CMD ["bash"]
