ARG BUILD_DATE=foo
ARG VCS_REF=foo
ARG VERSION=foo

FROM alpine:3.8

ENV POSTFIX_VERSION=3.3.0-r4 \

EXPOSE=2525

WORKDIR /etc/postfix

ADD ./resources /resources

RUN /resources/build && rm -rf resources

ENTRYPOINT ["postfix","start-fg"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="postfix" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.8" \
      "org.label-schema.description"="Postfix in a container" \
      "org.label-schema.url"="" \
      "org.label-schema.vcs-url"="https://bitbucket.org/fxadmin/public-common-docker-postfix" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.postfix.version"=$POSTFIX_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="https://bitbucket.org/fxadmin/public-common-docker-postfix"
