FROM python:3.9-slim

# defined in docker-compose

ARG workdir
ARG port

ENV PYTHONUNBUFFERED=1 
ENV PYTHONDONTWRITEBYTECODE=1
ENV PORT=${port}


# set work directory
WORKDIR ${workdir}

RUN apt-get update && apt-get install -y -qq \
    build-essential \
    libpq-dev \
    # pipenv
    && python -m pip install --upgrade pip pipenv

COPY ./Pipfile* ./

RUN python -m pipenv lock --keep-outdated --requirements > requirements.txt
RUN pip install -r requirements.txt
# RUN python -m pipenv install --system --deploy --ignore-pipfile

COPY ./compose/server/start.sh /start.sh
RUN sed -i 's/\r$//g' /start.sh
RUN chmod +x /start.sh

COPY ./compose/server/entrypoint /entrypoint
RUN sed -i 's/\r$//g' /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT ["/entrypoint"]
