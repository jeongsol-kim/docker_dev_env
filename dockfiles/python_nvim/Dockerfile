From python:3.10-slim

RUN apt-get update
# install neovim
RUN apt-get -y install ninja-build gettext cmake unzip curl git
RUN git clone https://github.com/neovim/neovim
RUN cd neovim && git checkout stable && make CMAKE_BUILE_TYPE=RelWithDebInfo && make install

# install neovim vim-plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# create and write neovim config file
RUN mkdir -p ~/.config/nvim/init.vim


#RUN pip install --upgrade pip
#RUN pip install numpy
#RUN pip install matplotlib
#RUN pip install scipy
#RUN pip install scikit-image

WORKDIR /usr/src/app
