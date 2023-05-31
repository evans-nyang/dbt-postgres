# Top level build args
ARG build_for=linux/amd64

##
# base image (abstract)
##
FROM --platform=$build_for python:3.11.2-slim-bullseye as base

# System setup
RUN apt-get update --fix-missing \
    && apt-get dist-upgrade -y \
    && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    ssh-client \
    software-properties-common \
    make \
    ca-certificates \
    libpq-dev \
    # && apt-get install --fix-broken \
    && apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

# Env vars
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

# Update python
RUN python3 -m pip install --upgrade pip setuptools wheel --no-cache-dir

# Set docker basics
WORKDIR /usr/app/dbt/
VOLUME /usr/app
ENTRYPOINT ["dbt"]

# dbt-postgres
FROM base as dbt-postgres
ARG dbt_postgres_ref=dbt-core@v1.6.0b2
RUN python3 -m pip install --no-cache-dir "git+https://github.com/dbt-labs/${dbt_postgres_ref}#egg=dbt-postgres&subdirectory=plugins/postgres"
