FROM debian:bookworm

RUN apt-get update -y && \
	apt-get install nginx openssl -y && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/certs

RUN openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout /usr/certs/nginx-selfsigned.key \
    -out /usr/certs/nginx-selfsigned.crt \
    -subj "/C=TH/ST=BK/L=TH/O=42, Inc./OU=DevOps/CN=nchencha.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx","-g" ,"daemon off;"]