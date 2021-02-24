FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# A second "FROM" means new block (you don't need the "as" keyword)
FROM nginx
#COPY will only keep app/build dir & ditch every other file from "builder"
COPY --from=builder /app/build /usr/share/nginx/html