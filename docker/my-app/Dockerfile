FROM ubuntu

RUN apt-get update 

RUN apt-get install nginx -y

COPY . /var/www/html/

ADD start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]

#CMD [“nginx” , "-g" , "daemon off;"]




