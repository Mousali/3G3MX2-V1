FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT=true 

ENV NODE_MAJOR=20

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -yq --fix-missing --no-install-recommends \
    gnupg \
    software-properties-common \
    gpg \
    wget \
    zip \
    curl  \
    coreutils  \
    gpg-agent \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-add-repository ppa:swi-prolog/stable
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -yq --fix-missing --no-install-recommends \
    openssl  \
    libssl-dev  \
    build-essential  \
    libsqlite3-dev \
    python3-pip  \
    python3.11 \
    python3.11-dev \
    libpython3.11 \
    git \
    libcairo2-dev \
    pkg-config \
    graphviz \
    iputils-ping \
    netcat \
    nmap \
    apt-utils \
    ca-certificates \
    texlive-base \
    texlive-xetex \
    pandoc \
    nodejs \
    plantuml \
    swi-prolog \
    terraform \
    pkg-config \
    libssl-dev \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN wget -U Mozilla/5.0 https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -O awscliv2.zip \
    && unzip awscliv2.zip \
    && ./aws/install

#update git
RUN pip install --no-cache-dir --upgrade pip

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1 \
    && update-alternatives  --set python /usr/bin/python3.11

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 \
    && update-alternatives  --set python3 /usr/bin/python3.11

ENV RUSTUP_HOME=/usr/local
ENV CARGO_HOME=$RUSTUP_HOME
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  -s -- -y
RUN cargo install nu

RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
RUN chmod +x /usr/local/bin/oh-my-posh
RUN mkdir /etc/poshthemes
RUN wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /etc/poshthemes/themes.zip
RUN unzip /etc/poshthemes/themes.zip -d /etc/poshthemes
RUN chmod u+rw /etc/poshthemes/*.json
RUN rm /etc/poshthemes/themes.zip


# RUN chmod u+rw /home/ubuntu/.config/nushell/*

RUN adduser ubuntu --disabled-password --shell /usr/local/bin/nu
USER ubuntu
WORKDIR /home/ubuntu/
RUN oh-my-posh init nu --config /etc/poshthemes/powerlevel10k_rainbow.omp.json

ENTRYPOINT nu