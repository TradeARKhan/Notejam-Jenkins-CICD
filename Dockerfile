#pullrequ
FROM node:10.13.0

ENV NOTEJAM_PORT=3000

EXPOSE $NOTEJAM_PORT/tcp
USER root
WORKDIR /home/root/app/

COPY --chown=root:root /notejam-mysql/notejam/ /home/root/app

RUN npm install &&\
    curl -s https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /home/root/app//wait-for-it.sh &&\
    chmod 0755 /home/root/app//wait-for-it.sh

CMD [ "/home/root/app//start-notejam.sh" ]
