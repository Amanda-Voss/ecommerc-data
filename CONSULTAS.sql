-- #######################################
-- CONSULTAS SQL - ECOMMERCE
-- #######################################

-- ==============================
-- 📌 CONSULTAS BÁSICAS
-- ==============================

-- 1. Listar todos os clientes
SELECT * FROM cliente;

-- 2. Listar todos os pedidos com seus valores totais
SELECT numero_pedido, valor_total FROM pedido;

-- 3. Buscar produtos da categoria 'laticínios'
SELECT p.nome, p.preco
FROM produto p
JOIN categoria c ON p.codigo_categoria = c.codigo_categoria
WHERE c.nome_categoria = 'laticínios';

-- 4. Listar produtos com preço maior que R$10,00
SELECT * FROM produto WHERE preco > 10.00;

-- 5. Contar quantos produtos existem em cada categoria
SELECT c.nome_categoria, COUNT(*) AS total_produtos
FROM produto p
JOIN categoria c ON p.codigo_categoria = c.codigo_categoria
GROUP BY c.nome_categoria;

-- ==============================
-- 📌 CONSULTAS INTERMEDIÁRIAS
-- ==============================

-- 6. Pedidos com status 'pago' e valor acima de R$30,00
SELECT * FROM pedido
WHERE status = 'pago' AND valor_total > 30;

-- 7. Produtos mais vendidos (quantidade total)
SELECT p.nome, SUM(i.quantidade) AS total_vendido
FROM itempedido i
JOIN produto p ON i.codigo_produto = p.codigo_produto
GROUP BY p.nome
ORDER BY total_vendido DESC;

-- 8. Total gasto por cliente
SELECT cl.nome_completo, SUM(p.valor_total) AS total_gasto
FROM pedido p
JOIN cliente cl ON p.codigo_cliente = cl.codigo_cliente
GROUP BY cl.nome_completo
ORDER BY total_gasto DESC;

-- 9. Categorias com mais de 2 produtos
SELECT c.nome_categoria, COUNT(*) AS total_produtos
FROM produto p
JOIN categoria c ON p.codigo_categoria = c.codigo_categoria
GROUP BY c.nome_categoria
HAVING total_produtos > 2;

-- 10. Pedidos feitos na data '2025-05-12'
SELECT * FROM pedido WHERE data_pedido = '2025-05-12';

-- ==============================
-- 📌 CONSULTAS AVANÇADAS
-- ==============================

-- 11. Top 3 clientes que mais gastaram
SELECT cl.nome_completo, SUM(p.valor_total) AS total_gasto
FROM pedido p
JOIN cliente cl ON p.codigo_cliente = cl.codigo_cliente
GROUP BY cl.nome_completo
ORDER BY total_gasto DESC
LIMIT 3;

-- 12. Faturamento total por mês
SELECT DATE_FORMAT(data_pedido, '%Y-%m') AS mes, SUM(valor_total) AS faturamento
FROM pedido
GROUP BY mes
ORDER BY mes;

-- 13. Produtos que nunca foram vendidos
SELECT p.nome
FROM produto p
LEFT JOIN itempedido i ON p.codigo_produto = i.codigo_produto
WHERE i.codigo_produto IS NULL;

-- 14. Pedido com maior valor total
SELECT * FROM pedido
ORDER BY valor_total DESC
LIMIT 1;

-- 15. Junção entre produtos, categorias e pedidos com agrupamento
SELECT c.nome_categoria, COUNT(DISTINCT p.codigo_produto) AS produtos_vendidos
FROM categoria c
JOIN produto p ON c.codigo_categoria = p.codigo_categoria
JOIN itempedido i ON p.codigo_produto = i.codigo_produto
GROUP BY c.nome_categoria
ORDER BY produtos_vendidos DESC;