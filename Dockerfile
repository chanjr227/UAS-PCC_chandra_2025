FROM alpine

LABEL maintainer="chandra" \
      email="chandra@gmail.com" \
      version="1.0"

# Install Apache2
RUN apk update && apk add --no-cache apache2

# Membuat direktori untuk website
RUN mkdir -p /var/www/localhost/htdocs

# Menyalin isi folder UAS-PCC-CHANDRA saja
COPY ./WEB/assets /var/www/localhost/htdocs/assets
COPY ./WEB/images /var/www/localhost/htdocs/images
COPY ./WEB/elements.html /var/www/localhost/htdocs/elements.html
COPY ./WEB/generic.html /var/www/localhost/htdocs/generic.html
COPY ./WEB/index.html /var/www/localhost/htdocs/index.html
COPY ./WEB/landing.html /var/www/localhost/htdocs/landing.html


# Menyediakan file teks sebagai demonstrasi
RUN touch UAS-PCCM-CHANDRA-2025.txt && \
    echo "UAS" > UAS-PCC-CHANDRA-2025.txt

# Expose port 80 untuk Apache
EXPOSE 80

# Jalankan Apache di foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]