FROM node:20.11.1

ENV YARN_VERSION 1.22.19
RUN yarn policies set-version $YARN_VERSION

WORKDIR /home/sample-app-nextjs