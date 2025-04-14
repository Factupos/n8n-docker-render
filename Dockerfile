FROM n8nio/n8n:latest


# Aplica permisos correctos automáticamente y configura autenticación básica
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=admin123
ENV N8N_USER_MANAGEMENT_DISABLED=true
ENV N8N_SKIP_WEBHOOK_DEREGISTRATION_SHUTDOWN=true

# Configuración de host, puerto y URLs (asegúrate de que la URL pública sea la correcta)
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV WEBHOOK_URL=https://n8n-docker-render-1.onrender.com/
ENV N8N_ALLOW_ORIGINS=https://factupos.co

# Configuración de conexión a la base de datos PostgreSQL
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_HOST=dpg-cvuf0eq4d50c73au6ma0-a.oregon-postgres.render.com
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_DATABASE=n8n_data_3vbl
ENV DB_POSTGRESDB_USER=n8nuser
ENV DB_POSTGRESDB_PASSWORD=tFpfmTSvsik91mUSWHQhh8552W0qYD2N
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# Configuración de inicio del contenedor
COPY n8n-config.json /home/node/.n8n/config
ENTRYPOINT ["tini", "--"]
CMD ["n8n"]
EXPOSE 5678
