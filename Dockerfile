FROM alpine:latest

# Mettre à jour les dépôts et installer les outils requis
RUN apk --no-cache update && apk --no-cache upgrade ** apk add --no-cache \
    bash \
    which \
    bind-tools \  # Pour dig et nslookup
    nmap \         # Pour le scan des réseaux
    whois \        # Pour les informations de domaine
    curl \         # Pour les requêtes HTTP comme crt.sh
    wget \         # Alternative à curl
    tar \          # Pour décompresser les archives
    && rm -rf /var/cache/apk/*

# Installer subfinder (outil externe)
RUN wget https://github.com/projectdiscovery/subfinder/releases/latest/download/subfinder-linux-amd64.tar.gz \
    && tar -xvzf subfinder-linux-amd64.tar.gz \
    && mv subfinder-linux-amd64 /usr/local/bin/subfinder \
    && chmod +x /usr/local/bin/subfinder \
    && rm subfinder-linux-amd64.tar.gz

# Définir le dossier de travail
WORKDIR /app

# Définir une commande par défaut (peut être modifiée)
CMD ["/bin/sh"]
