# Use Nginx image to serve the application
FROM nginx:alpine

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Add your custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d

# Copy the built app to the Nginx serve directory
COPY dist/vuexy /usr/share/nginx/html

# Expose port 80 to the Docker host, so we can access it from the outside.
EXPOSE 7132

# The command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]
