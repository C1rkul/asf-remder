FROM justarchi/archisteamfarm:latest

COPY config /app/config
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

EXPOSE 1242

ENTRYPOINT ["/app/entrypoint.sh"]