FROM justarchi/archisteamfarm:latest

COPY entrypoint.sh /asf/entrypoint.sh

RUN sed -i 's/\r$//' /asf/entrypoint.sh && \
    chmod +x /asf/entrypoint.sh

EXPOSE 1242

ENTRYPOINT ["/asf/entrypoint.sh"]
