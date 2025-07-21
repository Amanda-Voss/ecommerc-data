# 💾 Banco de Dados - Sistema de E-commerce

Este projeto simula a estrutura de um banco de dados para um sistema de e-commerce, modelando clientes, produtos, categorias, pedidos e itens de pedido.

## 📁 Arquivos

- `BANCO_DE_DADOS.sql`: script de criação e inserção de dados no banco.
- `CONSULTAS.sql`: script com consultas SQL organizadas por nível de complexidade.

## 🗃️ Estrutura do Banco

### Tabelas

#### `cliente`
- Armazena os dados pessoais dos clientes.
- Chave primária: `codigo_cliente`

#### `categoria`
- Define categorias de produtos (ex: doces, laticínios etc.)
- Chave primária: `codigo_categoria`

#### `produto`
- Armazena informações dos produtos vendidos.
- Chave estrangeira: `codigo_categoria`

#### `pedido`
- Representa os pedidos feitos por clientes.
- Chave estrangeira: `codigo_cliente`

#### `itempedido`
- Tabela associativa entre pedidos e produtos.
- Chaves estrangeiras: `numero_pedido`, `codigo_produto`

## 🔗 Relacionamentos

- `cliente` 1:N `pedido`
- `pedido` 1:N `itempedido`
- `produto` 1:N `itempedido`
- `produto` N:1 `categoria`

## 🧠 Consultas

Veja o arquivo `CONSULTAS.sql` para exemplos de uso com `SELECT`, `JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT` e funções agregadas.

---

Projeto criado para fins educacionais.