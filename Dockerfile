dockerfile 

# Usa la imagen oficial de n8n (puede ser "latest" u otra versión específica)
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
# AUTENTICACIÓN BÁSICA (puedes desactivarla si no deseas proteger toda la instancia)
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

# Endpoints de webhook (puedes ajustarlos si lo deseas)
ENV N8N_ENDPOINT_WEBHOOK=/webhook
ENV N8N_ENDPOINT_WEBHOOK_TEST=/webhook-test

# ─────────────────────────────────────────────────────
# CONFIGURACIÓN DE BASE DE DATOS POSTGRES
# ─────────────────────────────────────────────────────
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_HOST=dpg-cvuf0eq4d50c73au6ma0-a.oregon-postgres.render.com
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_DATABASE=n8n_data_3vbl
ENV DB_POSTGRESDB_USER=n8nuser
ENV DB_POSTGRESDB_PASSWORD=tFpfmTSvsik91mUSWHQhh8552W0qYD2N
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# Expone el puerto de n8n
EXPOSE 5678

# Inicia n8n
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
