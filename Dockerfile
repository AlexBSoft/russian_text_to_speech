FROM python:3.10

WORKDIR /src
COPY requirements.txt /src

RUN apt-get update && \
    apt-get install -y gcc python3-dev libasound2-dev
RUN pip install -r requirements.txt

COPY . /src

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--workers", "1", "--proxy-headers"]