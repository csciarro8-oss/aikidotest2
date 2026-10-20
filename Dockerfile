# Misconfigurations a container/IaC scanner (Trivy, Checkov, etc.) should flag.
FROM ubuntu:latest

# Hardcoded secret baked into the image
ENV DB_PASSWORD=SuperSecret123!

# ADD from remote URL, no checksum
ADD https://example.com/install.sh /tmp/install.sh
RUN chmod 777 /tmp/install.sh && sh /tmp/install.sh

# Runs as root, no USER directive, no HEALTHCHECK
EXPOSE 22 80
CMD ["bash"]
