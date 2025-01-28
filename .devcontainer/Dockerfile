FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
make \
procps \
&& rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir sphinx sphinx-book-theme myst-parser linkify-it-py