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

RUN adduser ubuntu --disabled-password
USER ubuntu

WORKDIR /home/ubuntu/
ENV PATH="/home/ubuntu/.local:/home/ubuntu/.local/bin:/home/ubuntu/.local/share:/home/ubuntu/.local/lib:/home/ubuntu/.dotnet/tools:${PATH}"

# RUN pip install --no-cache-dir --user "jupyterlab-github>=4.0.0" "jupyterlab_rise>=0.40.0" jupyterlab-git jupyterlab_code_formatter jupyterlab_latex sphinx sphinxcontrib-bibtex nbconvert RISE black isort pytest-cov pytest nbdime IPython jupyterlab_prolog_codemirror_extension prolog_kernel nbsphinx Sphinx pandoc ipykernel IPython
RUN pip install --no-cache-dir --user "jupyterlab-github<4.0.0" "jupyterlab_rise<0.40.0" dask-labextension jupyterlab_code_formatter jupyterlab-system-monitor jupyterlab-drawio jupyterlab_latex jupyterlab-git jupyterlab_code_formatter jupyterlab_latex sphinx sphinxcontrib-bibtex nbconvert RISE black isort pytest-cov pytest nbdime IPython jupyterlab_prolog_codemirror_extension prolog_kernel nbsphinx Sphinx pandoc ipykernel IPython pandoc-plantuml-filter
RUN python -m prolog_kernel.install --user

ENV JUPYTER_PORT=8888

ENTRYPOINT jupyter lab --ServerApp.ip=0.0.0.0 --ServerApp.open_browser=False --ServerApp.token= --ServerApp.trust_xheaders=True --ServerApp.allow_origin=* --ServerApp.port=${JUPYTER_PORT}
