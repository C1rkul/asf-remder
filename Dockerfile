FROM justarchi/archisteamfarm:latest

COPY config /app/config
COPY entrypoint.sh /app/entrypoint.sh

# Фикс CRLF + права на выполнение
RUN sed -i 's/\r$//' /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh && \
    ls -la /app/entrypoint.sh

EXPOSE 1242

ENTRYPOINT ["/app/entrypoint.sh"]
