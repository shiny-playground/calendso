FROM node:14-buster

RUN apt-get install -y libc6 git
WORKDIR /shiny
RUN git clone https://github.com/sneub/calendso .
RUN git checkout shinycal

# If we need to revert to a known working version
# RUN git reset --hard 7998b6248deb00edc2174dfeea643ac846b54bbc

COPY shiny/start.sh ./start.sh
RUN yarn
RUN yarn build

ENV NODE_ENV production
EXPOSE 3000
CMD ["bash", "/shiny/shiny/start.sh"]
