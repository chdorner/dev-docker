FROM chdorner/dev-base:latest
MAINTAINER Christof Dorner (https://github.com/chdorner)

RUN sudo bash -c "apt-get update && apt-get install -yq \
  silversearcher-ag \
  vim \
  && rm -rf /var/lib/apt/lists/*"

ADD .vimrc* /home/dev/

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  git -C ~/.vim/bundle/Vundle.vim checkout -qf 5f70ae6025e951f0154e3940d123138adffa4c88 && \
  vim -u /home/dev/.vimrc.vundle +PluginInstall +qall

ENV PATH /opt/go/bin:$PATH
RUN curl -o /tmp/go.tar.gz https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz && \
  sudo mkdir -p /opt && \
  sudo tar -xzf /tmp/go.tar.gz -C /opt/ && \
  sudo chown -R dev:dev /opt/go && \
  rm /tmp/go.tar.gz

RUN sudo chown dev:dev -R /home/dev

CMD ["bash"]
