FROM mongo:3.4
RUN mkdir /scripts

COPY ./first_mongo_run.js /scripts/first_mongo_run.js
COPY ./custom_entrypoint.sh /scripts/custom_entrypoint.sh

RUN apt-get update -y && apt-get install netcat -y && apt-get clean && chmod +x /scripts/custom_entrypoint.sh

ENTRYPOINT ["/scripts/custom_entrypoint.sh"]
