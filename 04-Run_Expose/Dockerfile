FROM nginx:alpine-slim

COPY nginx-conf/*.conf /etc/nginx/conf.d/

COPY nginx-html/*.html /usr/share/nginx/html/

# Install curl using RUN
RUN apk --no-cache add curl

EXPOSE 8081 8082 8083