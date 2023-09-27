FROM ubuntu:22.04

ENV NODE_MAJOR=20

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -yq --fix-missing --no-install-recommends \
    coreutils  \
    curl  \
    gnupg \
    gpg-agent  \
    software-properties-common  \
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
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN  curl -fsSL https://packages.microsoft.com/config/ubuntu/22.10/packages-microsoft-prod.deb -o packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb
RUN apt-add-repository ppa:swi-prolog/stable
RUN apt-get update
# install nodejs 18
RUN apt-get install -y nodejs
# install latest SWI prolog
RUN apt-get install -y swi-prolog
# install dotnet6 and dotnet7
RUN apt-get install -y dotnet-sdk-7.0 dotnet-sdk-6.0

#update git
RUN pip install --no-cache-dir --upgrade pip

ENV SHELL="/bin/bash"
RUN apt-get install -yq --fix-missing --no-install-recommends plantuml

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT=true \
    AWS_ACCESS_KEY_ID="AKIAQ644IWYLHB3NJVVC" \
    WS_SECRET_ACCESS_KEY="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"

ENV PROVIDER="aws"

RUN apt-get update
RUN apt-get install -yq --fix-missing --no-install-recommends gnupg software-properties-common gpg wget zip

RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

RUN apt-get update
RUN apt-get install -yq --fix-missing --no-install-recommends terraform

# RUN curl --output /usr/bin/terraformer -LO https://github.com/GoogleCloudPlatform/terraformer/releases/download/$(curl -s https://api.github.com/repos/GoogleCloudPlatform/terraformer/releases/latest | grep tag_name | cut -d '"' -f 4)/terraformer-${PROVIDER}-linux-amd64 \
#     && chmod +x /usr/bin/terraformer

RUN wget -U Mozilla/5.0 https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -O awscliv2.zip \
    && unzip awscliv2.zip \
    && ./aws/install

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.11 1 \
    && update-alternatives  --set python /usr/bin/python3.11

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 \
    && update-alternatives  --set python3 /usr/bin/python3.11

RUN adduser ubuntu --disabled-password
USER ubuntu

WORKDIR /home/ubuntu/
ENV PATH="/home/ubuntu/.local:/home/ubuntu/.local/bin:/home/ubuntu/.local/share:/home/ubuntu/.local/lib:/home/ubuntu/.dotnet/tools:${PATH}"

# RUN pip install --no-cache-dir --user "jupyterlab-github>=4.0.0" "jupyterlab_rise>=0.40.0" jupyterlab-git jupyterlab_code_formatter jupyterlab_latex sphinx sphinxcontrib-bibtex nbconvert RISE black isort pytest-cov pytest nbdime IPython jupyterlab_prolog_codemirror_extension prolog_kernel nbsphinx Sphinx pandoc ipykernel IPython
RUN pip install --no-cache-dir --user "jupyterlab-github<4.0.0" "jupyterlab_rise<0.40.0" dask-labextension jupyterlab_code_formatter jupyterlab-system-monitor jupyterlab-drawio jupyterlab_latex jupyterlab-git jupyterlab_code_formatter jupyterlab_latex sphinx sphinxcontrib-bibtex nbconvert RISE black isort pytest-cov pytest nbdime IPython jupyterlab_prolog_codemirror_extension prolog_kernel nbsphinx Sphinx pandoc ipykernel IPython

# RUN jupyter lab build  --dev-build=False --minimize=False

#RUN dotnet tool install --tool-path /home/ubuntu/.dotnet/tools Microsoft.dotnet-interactive
#RUN dotnet interactive jupyter install

RUN python -m prolog_kernel.install --user

ARG JUPYTER_PORT
ENV JUPYTER_PORT=${JUPYTER_PORT}

#RUN pip install --no-cache-dir --user pandoc-plantuml-filter

ENTRYPOINT jupyter lab --ServerApp.ip=0.0.0.0 --ServerApp.open_browser=False --ServerApp.token= --ServerApp.trust_xheaders=True --ServerApp.allow_origin=* --ServerApp.port=${JUPYTER_PORT}
