FROM debian:bookworm

# Install Dependencies
#TODO Delete php-cli late just for testing we use php-fpm
RUN apt-get update && \
	apt-get install -y \
	curl \
	unzip \
	php8.2 \
	php-fpm \
	php-cli \
	php-mysql \
	vim && \
	rm -rf /var/lib/apt/lists/*

# Install WP-CLI 

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp
	
COPY /tool/wordpress_setup.sh /etc/

RUN chmod 777 /etc/wordpress_setup.sh

WORKDIR /var/www/html

EXPOSE 7000

ENTRYPOINT [ "/etc/wordpress_setup.sh" ]
