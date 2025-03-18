FROM python:{{cookiecutter.python_version}}-bookworm AS builder

RUN apt-get update && apt-get install --no-install-recommends -y \
build-essential && \
apt-get clean && rm -rf /var/lib/apt/lists/*

ADD https://astral.sh/uv/install.sh /install.sh
RUN chmod -R 655 /install.sh && /install.sh && rm /install.sh

ENV PATH="/root/.local/bin:${PATH}"

WORKDIR /app

COPY ./pyproject.toml .

RUN uv sync --no-dev

FROM python:{{cookiecutter.python_version}}-slim-bookworm AS production

RUN useradd --create-home appuser
USER appuser

WORKDIR /app

COPY --from=builder /app/.venv .venv

ENV PATH="/app/.venv/bin:$PATH"

COPY /{{cookiecutter.pkg_folder}} {{cookiecutter.pkg_folder}}

CMD ["python", "-m", "src"]
