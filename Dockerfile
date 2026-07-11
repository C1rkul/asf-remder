FROM justarchi/archisteamfarm:latest

# Копируем конфиги в правильную папку
COPY config /asf/config
COPY entrypoint.sh /asf/entrypoint.sh

RUN sed -i 's/\r$//' /asf/entrypoint.sh && \
    chmod +x /asf/entrypoint.sh

EXPOSE 1242

ENTRYPOINT ["/asf/entrypoint.sh"]