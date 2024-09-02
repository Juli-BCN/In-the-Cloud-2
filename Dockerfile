# Image and Labels
FROM httpd:latest
LABEL maintainer="JuliBCN <julibcn@gmail.com>"

# Environment Variables
ENV TZ=Europe/Dublin

# Copy files for the new site
COPY src/ /usr/local/apache2/htdocs/

# Port for site
EXPOSE 80
