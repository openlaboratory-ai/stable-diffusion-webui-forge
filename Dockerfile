FROM openlaboratory/community
WORKDIR /usr/local/app

# Copy config file and scripts.
COPY openlab.yaml /usr/local/app/openlab.yaml
COPY scripts /usr/local/app/scripts

# Run setup scripts
RUN labkit install

# Run start script
CMD labkit start