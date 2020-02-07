FROM python:3.6-slim

WORKDIR /app

# Copy files
RUN mkdir app
COPY ./app/requirements.txt ./requirements.txt
COPY ./app/api_classification.py ./api_classification.py
COPY ./app/xgboost_classifier.pickle ./xgboost_classifier.pickle
COPY ./app/test_api.py ./test_api.py

# Install requirements
RUN apt-get update
RUN	apt-get install -y gcc vim
RUN pip install -r ./requirements.txt

# Only the last command will be executed
CMD ["uvicorn", "api_classification:app", "--host", "0.0.0.0", "--port", "8001"]
# docker build . -t ml_docker
# docker run -p 8000:8001 ml_docker

