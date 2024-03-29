FROM python:latest
ENV POETRY_VERSION=1.1.13

RUN apt-get -y update && apt-get -y install git

RUN pip install poetry==$POETRY_VERSION

WORKDIR /app

COPY pyproject.toml  .
COPY poetry.lock .

RUN poetry install --no-dev

COPY . .

ENV PYTHONPATH=$PYTHONPATH:/app/src

ENTRYPOINT ["poetry", "run", "python", "src/main.py"]
