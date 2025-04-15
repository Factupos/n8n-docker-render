FROM n8nio/n8n:latest

# Variables de entorno críticas para CORS:
ENV N8N_CORS_ENABLED=true
ENV N8N_CORS_ALLOWED_ORIGINS=https://factupos.co
ENV N8N_CORS_ALLOWED_METHODS=GET,POST,OPTIONS
ENV N8N_CORS_ALLOWED_HEADERS=Content-Type,Authorization
ENV N8N_CORS_ALLOW_CREDENTIALS=false

# (Si tu versión solo reconoce N8N_ALLOW_ORIGINS, repite con esa variable)
# ENV N8N_ALLOW_ORIGINS=https://factupos.co

# Resto de config:
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_SKIP_WEBHOOK_DEREGISTRATION_SHUTDOWN=true
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://n8n-docker-render-1.onrender.com/

# Base de datos, etc. ...
EXPOSE 5678
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
