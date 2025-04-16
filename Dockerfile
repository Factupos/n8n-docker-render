# ─────────────────────────────────────────────────────
# Imagen base oficial de n8n
# ─────────────────────────────────────────────────────
FROM n8nio/n8n:latest

# Asegurar permisos correctos en settings
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# ─────────────────────────────────────────────────────
# Clave de cifrado (imprescindible para credenciales)
# ─────────────────────────────────────────────────────
ENV N8N_ENCRYPTION_KEY=fA7t9kV!x83pGdS62rBQzMTY*LrA1u!v

# ─────────────────────────────────────────────────────
# HABILITAR CORS
# ─────────────────────────────────────────────────────
ENV N8N_CORS_ENABLED=true
# varias URLs separadas por coma
ENV N8N_CORS_ALLOWED_ORIGINS=https://factupos.co,https://factupos-landing.vercel.app
ENV N8N_CORS_ALLOWED_METHODS=GET,POST,OPTIONS
ENV N8N_CORS_ALLOWED_HEADERS=Content-Type,Authorization
ENV N8N_CORS_ALLOW_CREDENTIALS=false

# ─────────────────────────────────────────────────────
# AUTENTICACIÓN BÁSICA global
# ─────────────────────────────────────────────────────
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
# Deshabilitar el sistema de usuarios (solo Basic Auth)
ENV N8N_USER_MANAGEMENT_DISABLED=true

# Evita que n8n tarde en cerrar al intentar deregistrar webhooks
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
# (Render inyectará las mismas variables: quedan aquí como fallback)
# ─────────────────────────────────────────────────────
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_HOST=dpg-cvuf0eq4d50c73au6ma0-a.oregon-postgres.render.com
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_DATABASE=n8n_data_3vbl
ENV DB_POSTGRESDB_USER=n8nuser
ENV DB_POSTGRESDB_PASSWORD=tFpfmTSvsik91mUSWHQhh8552W0qYD2N
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# ─────────────────────────────────────────────────────
# Exponer puerto y arrancar
# ─────────────────────────────────────────────────────
EXPOSE 5678

ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
