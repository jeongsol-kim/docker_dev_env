From python:3.10-slim

RUN apt-get update
# install neovim
RUN apt-get -y install ninja-build gettext cmake unzip curl git
RUN git clone https://github.com/neovim/neovim
RUN cd neovim && git checkout stable && make CMAKE_BUILE_TYPE=RelWithDebInfo && make install

# install neovim vim-plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# create and clone neovim config file
RUN mkdir -p ~/.config/nvim/
RUN git clone https://github.com/jeongsol-kim/docker_dev_env.git docker_env
RUN cp docker_env/dockfiles/python_nvim/init.vim ~/.config/nvim/init.vim && rm -r docker_env

# install provider
RUN pip install --upgrade pip
RUN pip install neovim
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs

# install vim plugins
RUN nvim --headless +PlugInstall +qall

#RUN pip install --upgrade pip
#RUN pip install numpy
#RUN pip install matplotlib
#RUN pip install scipy
#RUN pip install scikit-image

WORKDIR /usr/src/app
