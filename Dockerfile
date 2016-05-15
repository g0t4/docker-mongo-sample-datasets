FROM mongo:latest
MAINTAINER Wes Higbee <wes.mcclure@gmail.com>

# procps as I'm tinkering with the bash sample-entrypoint.sh script to make sure mongod is PID 1
RUN apt-get update \ 
  && apt-get install -y --no-install-recommends wget ca-certificates procps \ 
  && update-ca-certificates \
  && rm -rf /var/lib/apt/lists/* 
  
RUN wget https://raw.githubusercontent.com/mongodb/docs-assets/primer-dataset/primer-dataset.json

ENV MONGO_SERVER= MONGO_PORT=27017 MONGO_DATABASE=test

ADD sample-entrypoint.sh /examples/sample-entrypoint.sh
ENTRYPOINT ["/examples/sample-entrypoint.sh"]
