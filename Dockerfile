FROM node:14-buster

RUN apt-get install -y libc6 git
WORKDIR /calcom

COPY . ./
RUN bash ./shiny/setupenv.sh

RUN yarn
RUN yarn build

ENV NODE_ENV production
EXPOSE 3000
CMD ["bash", "/calcom/shiny/start.sh"]
