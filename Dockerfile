FROM alpine:latest

RUN apk update --no-cache --quiet --no-progress && apk upgrade --no-cache --quiet --no-progress

# Mettre à jour les dépôts et installer les outils requis
RUN apk add --no-cache --quiet --no-progress bash \
    which \
    bind-tools \
    nmap \
    whois \
    curl \
    wget \
    tar

RUN rm -rf /var/cache/apk/*

# Installer subfinder (outil externe)
RUN wget https://github.com/projectdiscovery/subfinder/releases/download/v2.6.7/subfinder_2.6.7_linux_amd64.zip \
    && tar -xvzf subfinder-linux-amd64.tar.gz \
    && mv subfinder-linux-amd64 /usr/local/bin/subfinder \
    && chmod +x /usr/local/bin/subfinder \
    && rm subfinder-linux-amd64.tar.gz

# Définir le dossier de travail
WORKDIR /app

# Définir une commande par défaut (peut être modifiée)
CMD ["/bin/sh"]
