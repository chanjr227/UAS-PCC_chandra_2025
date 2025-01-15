FROM alpine

LABEL maintainer="chandra" \
      email="chandra@gmail.com" \
      version="1.0"

# Install Apache2
RUN apk update && apk add --no-cache apache2

# Membuat direktori untuk website
RUN mkdir -p /var/www/localhost/htdocs

# Menyalin isi folder UAS-PCC-YANYAN-2025 saja (tanpa foldernya)
COPY /WEB/assets /var/www/localhost/htdocs/
COPY /WEB/images /var/www/localhost/htdocs/
COPY /WEB/elements.html /var/www/localhost/htdocs/
COPY /WEB/generic.html /var/www/localhost/htdocs/
COPY /WEB/index.html /var/www/localhost/htdocs/
COPY /WEB/landing.html /var/www/localhost/htdocs/


# Menyediakan file teks sebagai demonstrasi
RUN touch UAS-PCCM-YANYAN-2025.txt && \
    echo "UAS" > UAS-PCC-YANYAN-2025.txt

# Expose port 80 untuk Apache
EXPOSE 80

# Jalankan Apache di foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]