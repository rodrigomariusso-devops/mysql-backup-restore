#!/bin/bash

HOST=""
PORT="3306"
USER=""
PASSWORD=""
DATABASE=""
TABLES=(
    ""
)

# Função para restaurar os dados
restore_table() {
    TABLE=$1
    SQL_FILE="./backup_rastreador/$TABLE.sql"
    
    if [ -f "$SQL_FILE" ]; then
        echo "Desativando verificação de chaves estrangeiras..."
        mysql -h "$HOST" -P "$PORT" -u "$USER" -p"$PASSWORD" "$DATABASE" -e "SET FOREIGN_KEY_CHECKS=0;"

        echo "Restaurando dados da tabela $TABLE..."
        mysql -h "$HOST" -P "$PORT" -u "$USER" -p"$PASSWORD" "$DATABASE" < "$SQL_FILE"

        echo "Reativando verificação de chaves estrangeiras..."
        mysql -h "$HOST" -P "$PORT" -u "$USER" -p"$PASSWORD" "$DATABASE" -e "SET FOREIGN_KEY_CHECKS=1;"
    else
        echo "Arquivo de backup $SQL_FILE não encontrado."
    fi
}

for TABLE in "${TABLES[@]}"; do
    # Restaura a tabela
    restore_table $TABLE
done

echo "Restauração concluída."
