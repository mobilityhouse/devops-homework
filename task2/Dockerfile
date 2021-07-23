# Your Dockerfile
FROM ubuntu

ARG PORT=80

# Make the debian environment non interactive
ENV DEBIAN_FRONTEND=noninteractive

# install the required apache2 packages
RUN apt-get update; \
    apt-get install -y \
    apache2 apache2-utils curl; \
    apt-get clean

# Make /opt/html as the source directory
RUN if [[ -d /opt/html ]] ; then mkdir /opt/html ; fi; \ 
    sed -i "s/Directory \/var\/www\//Directory \/opt\//g" /etc/apache2/apache2.conf; \
    sed -i "s/DocumentRoot \/var\/www\/html/DocumentRoot \/opt\/html/g" /etc/apache2/sites-available/000-default.conf

# copy custom index.html to the filesystem
COPY index.html /opt/html/

# Start apache web server 
CMD ["apache2ctl", "-D", "FOREGROUND"]

# expose the tcp port that can be configured 
EXPOSE ${PORT}

# Run docker container as non-root user
# Was unable to get the apache process started if I run the conatiner as non-root user, hence commenting the below code.
# RUN groupadd -g 999 testuser 
# RUN useradd -r -u 999 -g testuser testuser
# USER testuser   
