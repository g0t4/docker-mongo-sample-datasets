FROM buildpack-deps:curl AS download-env
RUN wget https://raw.githubusercontent.com/mongodb/docs-assets/primer-dataset/primer-dataset.json

# note: could parameterize FROM so jenkins can inject pushed image that trigged the build, but this is fine too and is explicit which can be nice!
FROM vetted-registry:5000/mongo:latest AS runtime-env
ENV MONGO_SERVER= MONGO_PORT=27017 MONGO_DATABASE=test
COPY --from=download-env primer-dataset.json .
ADD sample-entrypoint.sh /examples/sample-entrypoint.sh
ENTRYPOINT ["/examples/sample-entrypoint.sh"]
