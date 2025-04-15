FROM n8nio/n8n:latest

# Desactivar validación de permisos para evitar errores (Render no permite chmod)
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV N8N_SKIP_WEBHOOK_DEREGISTRATION_SHUTDOWN=true

# Configuración de autenticación y gestión de usuarios
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_USER_MANAGEMENT_DISABLED=true

# Configuración del servidor (host, puerto y webhook URL)
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://n8n-docker-render-1.onrender.com/

# Configuración de la conexión a la base de datos PostgreSQL
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_HOST=dpg-cvuf0eq4d50c73au6ma0-a.oregon-postgres.render.com
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_DATABASE=n8n_data_3vbl
ENV DB_POSTGRESDB_USER=n8nuser
ENV DB_POSTGRESDB_PASSWORD=tFpfmTSvsik91mUSWHQhh8552W0qYD2N
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# Copiar el archivo de configuración avanzado (con CORS, etc.)
COPY n8n-config.json /home/node/.n8n/config

ENTRYPOINT ["tini", "--"]
# Usa el comando por defecto del contenedor (no añadas "start")
CMD ["n8n"]
EXPOSE 5678
