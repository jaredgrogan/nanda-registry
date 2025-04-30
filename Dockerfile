FROM nginx:alpine

# Create a test HTML file
RUN echo '<html><body><h1>NANDA Registry Test</h1><p>Deployment works!</p></body></html>' > /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]