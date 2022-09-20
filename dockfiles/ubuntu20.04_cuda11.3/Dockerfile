FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

ENV TZ=Asiz/Seoul
ENV TERM=xterm-256color

RUN ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime

#RUN apt update
RUN apt-get -y update && apt-get install -y git wget curl

#### 1. Terminal setting ####

RUN apt-get install zsh -y
RUN chsh -s $(which zsh)

# install oh-my-zsh and powerlevel10k
RUN curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
RUN git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# zsh autosuggestion
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# copy fonts and install
COPY font/*.ttf /root/.fonts/
RUN apt install fontconfig -y
RUN fc-cache -f -v

# copy custom configuration files
COPY zsh_config/.zshrc /root/.zshrc
COPY zsh_config/.p10k.zsh /root/.p10k.zsh

#### 2. Install python and pip
RUN apt-get update
RUN apt-get upgrade python3 -y
RUN apt-get install python3-pip -y
RUN alias python=python3



#### 3. Install Pytorch
RUN pip install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113
