###########
# BUILDER #
###########
FROM python:{{cookiecutter.python_version}} AS builder

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY ./pyproject.toml ./poetry.lock /app/

RUN pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev

###########
## IMAGE ##
###########
FROM python:{{cookiecutter.python_version}}-slim

WORKDIR /home/appuser/app

RUN groupadd -r appgroup && \
    useradd -r -g appgroup appuser && \
    chown -R appuser:appgroup /home/appuser/app

COPY --from=builder /usr/local/lib/python{{cookiecutter.python_version}}/site-packages /usr/local/lib/python{{cookiecutter.python_version}}/site-packages

COPY . /home/appuser/app

RUN chmod +x /home/appuser/app/start.py

USER appuser

CMD ["sh", "./start.py"]
