FROM ui-base-docker:latest

ARG username

USER root

RUN apt update && \
    apt install -y \
    git \
    gcc-8 \
    g++-8 \
    cmake \
    unzip \
    ninja-build \
    gettext \
    libtool \
    libtool-bin \
    autoconf \
    automake \
    pkg-config

RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 50 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 50 && \
    update-alternatives --install /usr/bin/cpp cpp-bin /usr/bin/cpp-8 50 && \
    update-alternatives --set g++ /usr/bin/g++-8 && \
    update-alternatives --set gcc /usr/bin/gcc-8 && \
    update-alternatives --set cpp-bin /usr/bin/cpp-8 && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-8 50

RUN apt update && \
    wget https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init -O rustup-init && \
    chmod +x rustup-init

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER $username

RUN ./rustup-init -y

COPY .bashrc .bashrc

RUN /home/$username/.cargo/bin/rustup component add rust-analysis --toolchain stable-x86_64-unknown-linux-gnu && \
    /home/$username/.cargo/bin/rustup component add rust-src --toolchain stable-x86_64-unknown-linux-gnu && \
    /home/$username/.cargo/bin/rustup component add rls --toolchain stable-x86_64-unknown-linux-gnu

USER root
RUN git clone https://github.com/neovim/neovim && \
    cd ~/neovim && \
    make CMAKE_BUILD_TYPE=Release && \
    make install
USER $username

CMD ["/bin/bash", "--login"]
