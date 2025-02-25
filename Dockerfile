FROM rust:latest AS builder 

WORKDIR /usr/src/app

COPY . .

RUN cargo build --release

FROM gcr.io/distroless/cc

COPY --from=builder /usr/src/app/target/release/rust-tokenizers-api /usr/local/bin/rust-tokenizers-api
CMD ["rust-tokenizers-api"]
