FROM nginx:latest

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
 
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1 
