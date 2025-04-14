FROM n8nio/n8n

# Establece permisos correctos automáticamente
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Autenticación básica
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123

# Configuración de host y puerto
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://n8n-docker-render-1.onrender.com/

# Asegúrate de que el binario sea accesible
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
EXPOSE 5678
ENV N8N_ALLOW_ORIGINS=https://factupos.co

