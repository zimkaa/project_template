FROM python:3.13-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY ./pyproject.toml ./uv.lock /app/

RUN uv sync --frozen

COPY . /app

RUN chmod +x /app/start.py

CMD ["uv", "run", "./start.py"]
