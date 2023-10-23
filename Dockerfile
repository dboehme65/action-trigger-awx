#FROM ghcr.io/freenet-actions/awxkit_base:latest
FROM ghcr.io/freenet-actions/awxkit_base_alpine:latest
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
