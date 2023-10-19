FROM ghcr.io/freenet-actions/awxkit_base:latest
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
