# Usa la imagen oficial de n8n
FROM n8nio/n8n:latest

# Ajustar permisos de archivos (opcional, pero recomendado)
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# ─────────────────────────────────────────────────────
# HABILITAR CORS
# ─────────────────────────────────────────────────────
ENV N8N_CORS_ENABLED=true
ENV N8N_CORS_ALLOWED_ORIGINS=https://factupos.co
ENV N8N_CORS_ALLOWED_METHODS=GET,POST,OPTIONS
ENV N8N_CORS_ALLOWED_HEADERS=Content-Type,Authorization
ENV N8N_CORS_ALLOW_CREDENTIALS=false

# ─────────────────────────────────────────────────────
# AUTENTICACIÓN BÁSICA
# ─────────────────────────────────────────────────────
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_USER_MANAGEMENT_DISABLED=true
ENV N8N_SKIP_WEBHOOK_DEREGISTRATION_SHUTDOWN=true

# ─────────────────────────────────────────────────────
# CONFIGURACIÓN DEL SERVIDOR
# ─────────────────────────────────────────────────────
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://n8n-docker-render-1.onrender.com
ENV N8N_ENDPOINT_WEBHOOK=/webhook
ENV N8N_ENDPOINT_WEBHOOK_TEST=/webhook-test

# Expone el puerto de n8n
EXPOSE 5678

# Inicia n8n (usando almacenamiento local por defecto)
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
