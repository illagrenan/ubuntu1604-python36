FROM ubuntu:16.04
LABEL authors="Vašek Dohnal <vaclav.dohnal@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends software-properties-common && add-apt-repository ppa:jonathonf/python-3.6 -y
RUN apt-get update && apt-get install -y --no-install-recommends \
    libopenblas-dev \
    python3.6 \
    python3.6-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py | python3.6
RUN pip3.6 install --isolated --no-input --compile --exists-action=a --disable-pip-version-check --use-wheel --no-cache-dir --upgrade pip setuptools wheel
