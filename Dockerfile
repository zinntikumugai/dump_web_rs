FROM rust:1.78.0-bookworm as base

WORKDIR /src
COPY ./src/Cargo.lock ./src/Cargo.toml ./

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN set -x \
    && echo "fn main(){}" > main.rs \
    && cargo build
