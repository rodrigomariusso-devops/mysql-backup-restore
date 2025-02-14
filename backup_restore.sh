#!/bin/bash

SOURCE_DB=""
SOURCE_USER=""
SOURCE_PASS=""

BACKUP_DIR="./ras_cliente"
mkdir -p "$BACKUP_DIR"

TABLES=(
    ""
)

HOST=""
PORT="3306"

for TABLE in "${TABLES[@]}"; do
    echo "Exportando dados completos da tabela $TABLE do banco de dados $SOURCE_DB..."
    mysqldump -h "$HOST" -P "$PORT" -u "$SOURCE_USER" -p"$SOURCE_PASS" --no-create-info "$SOURCE_DB" "$TABLE" > "$BACKUP_DIR/$TABLE.sql"
done

echo "Processo de exportação concluído."
