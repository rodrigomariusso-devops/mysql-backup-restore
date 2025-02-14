# mysql-backup-restore
# Projeto: MySQL Backup & Restore Scripts

Este repositório contém um conjunto de scripts bash para realizar backup e restauração de tabelas de um banco de dados MySQL.

## Estrutura do Projeto

- `backup_restore.sh`: Script responsável por exportar os dados das tabelas especificadas.
- `check_table_data.sh`: Script que restaura os dados das tabelas a partir dos arquivos de backup.
- `insert_restore.sh`: Similar ao `check_table_data.sh`, mas inclui verificações adicionais e mensagens de erro para maior robustez.

## Como Usar

### 1. Configuração
Antes de executar os scripts, edite as variáveis dentro de cada arquivo para refletir as credenciais e detalhes do seu banco de dados.

**Exemplo:**
```bash
SOURCE_DB="meu_banco"
SOURCE_USER="meu_usuario"
SOURCE_PASS="minha_senha"
HOST="meu_host"
PORT="3306"
TABLES=("tabela1" "tabela2")
```

### 2. Executando o Backup
Para exportar os dados das tabelas:
```bash
chmod +x backup_restore.sh
./backup_restore.sh
```
Os arquivos SQL serão armazenados no diretório `./ras_cliente/`.

### 3. Restaurando os Dados
Para restaurar os dados exportados:
```bash
chmod +x check_table_data.sh
./check_table_data.sh
```
Ou, para a versão com validação extra:
```bash
chmod +x insert_restore.sh
./insert_restore.sh
```

## Considerações
- Certifique-se de ter permissão para acessar o banco de dados e executar comandos `mysqldump` e `mysql`.
- O script `insert_restore.sh` adiciona verificações extras para evitar erros durante a restauração.
- Os backups **não** incluem estrutura de tabelas, apenas os dados.

