# 1 - Quais os produtos campeões de vendas?

SELECT
	p.product_name,
    SUM(oi.quantity) as total_vendido
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
order by total_vendido DESC;

# 2 - Qual o faturamento mensal?
SELECT
	DATE_FORMAT(o.order_date, '%y-%m') AS mes,
	SUM(oi.quantity * oi.price) AS faturamento
FROM orders o
JOIN order_items oi on o.order_id = oi.order_id
GROUP BY mes
ORDER BY mes;

# 3 - Quanto tempo em média demora para um cliente voltar a comprar?

-- ETAPA 1: Criar uma Tabela Virtual (CTE) para preparar os dados
-- Motivo: Precisamos calcular a "data anterior" antes de fazer a conta da média.
WITH historico_compras AS (
	SELECT
		user_id,
        order_date AS data_atual,
        -- 1. LAG(order_date): "Olhe para a coluna de data na linha de cima (anterior)"
        -- 2. OVER: "Aplique essa regra SOBRE a seguinte janela de dados:"
        -- 3. PARTITION BY user_id: "Separe os cálculos por cliente (não misture datas do Cliente A com Cliente B)"
        -- 4. ORDER BY order_date: "Organize as datas do mais antigo para o mais novo para saber o que veio antes"
		LAG(order_date) OVER (PARTITION BY user_id ORDER BY order_date) AS data_anterior
	FROM orders
)
SELECT
	ROUND(AVG(DATEDIFF(data_atual, data_anterior)), 0) AS media_para_retorno  
FROM historico_compras
WHERE data_anterior IS NOT NULL #Filtro importante: "Remove" a 1ª compra de cada cliente (pois não existe compra anterior a ela)
GROUP BY user_id;