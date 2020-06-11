FROM ciptahub/laravelserver:latest

MAINTAINER Cipta Ageung Mahdiar <cipta_ageung@yahoo.co.id>

COPY . /var/www/

RUN chmod -Rf 777 /var/www/storage/ /var/www/resources/ /var/www/bootstrap/ /var/www/public/

RUN php artisan route:clear

RUN php artisan config:clear

RUN php artisan view:clear

RUN php artisan cache:clear

RUN ln -sf /var/www/storage/app/public /var/www/public/storage