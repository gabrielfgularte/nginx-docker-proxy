# Nginx Proxy Docker

A lightweight and configurable Nginx proxy setup using Docker and Docker Compose. This project simplifies local development by enabling custom domain resolution with SSL support.

## Dependencies

- [Docker & Docker Compose](https://docs.docker.com/)
- [make](https://www.gnu.org/software/make/#download)

## Usage

1. Edit your `hosts` file and add the following line at the end:

    ```bash
    127.0.0.1 your.domain.com
    ```

2. Copy `.env.tpl` to `.env` and update the environment variables as needed.
3. Run `make up`.

## Tips & Gotchas

- If you're using Windows or macOS, or if you don't have `make` installed, you'll need to manually:
    1. Run `openssl.sh` to generate the certificates.
    2. Start the container with `docker-compose up --build -d`.
    3. [Optional] View logs in real-time with `docker-compose logs -f nginx`.

- The default value for the `PORT` environment variable is `9000`.
- The domain specified in the `hosts` file (e.g., `127.0.0.1 your.domain.com`) must match the `DOMAIN` environment variable.
- By default, Nginx runs with: `worker_processes auto;`. This means it will spawn one worker process per CPU core. To change this behavior, set `WORKERS=N` in your `.env` file, where `N` is the desired number of workers.
