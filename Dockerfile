FROM node:20.11.1-bookworm-slim as builder
WORKDIR /app

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git -y

RUN git clone https://github.com/HeyPuter/puter

WORKDIR /app/puter
RUN npm install


FROM node:20.11.1-bookworm-slim
WORKDIR /app

COPY --from=builder /app/puter ./puter

RUN apt-get update
RUN apt-get upgrade -y

EXPOSE 4000

WORKDIR /app/puter
CMD ["npm", "run", "start"]  
