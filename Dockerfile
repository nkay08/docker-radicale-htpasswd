FROM tomsquest/docker-radicale

RUN apk \
    --update \
    --no-cache \
    --virtual build-dependencies \
    add \
    apache2-utils


#  Make a htpasswd directory and make it writable for htpasswd file
RUN mkdir -p /htpasswd && chmod -R 770 /htpasswd
VOLUME /htpasswd

# Make /tmp a volume, since htpasswd uses this directory when updating a htpasswd file, so it has to be writable
RUN mkdir -p /tmp
VOLUME /tmp

COPY config /config/config
COPY rights /config/rights

COPY docker-entrypoint.extended.sh /usr/local/bin
COPY setup_htpasswd.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.extended.sh"]
CMD ["radicale", "--config", "/config/config"]
