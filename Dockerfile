# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy only the necessary files to the container
COPY . .

# Copy the custom Apache configuration
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Enable mod_rewrite for .htaccess files
RUN a2enmod rewrite

# Install any needed packages specified in requirements.txt
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
    # Add your necessary dependencies here

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Start Apache
CMD ["apache2-foreground"]

