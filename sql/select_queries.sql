-- Recuperar todos os clientes
SELECT * FROM Cliente;

-- Recuperar todos os produtos
SELECT * FROM Produto;

-- Recuperar todos os pedidos
SELECT * FROM Pedido;

-- Recuperar informações de um cliente específico pelo ID
SELECT * FROM Cliente WHERE ID = 1;

-- Recuperar produtos com preço superior a $100
SELECT * FROM Produto WHERE Preco > 100;

-- Recuperar pedidos realizados após uma determinada data
SELECT * FROM Pedido WHERE Data > '2024-01-01';

-- Calcular o total de cada item do pedido
SELECT Quantidade, Preco, Quantidade * Preco AS Total FROM ItemPedido;

-- Calcular o valor total de cada pedido
SELECT PedidoID, SUM(Subtotal) AS Total FROM ItemPedido GROUP BY PedidoID;

-- Listar todos os clientes em ordem alfabética
SELECT * FROM Cliente ORDER BY Nome ASC;

-- Listar produtos em ordem decrescente de preço
SELECT * FROM Produto ORDER BY Preco DESC;

-- Listar apenas os produtos que têm mais de 10 unidades em estoque
SELECT ProdutoID, SUM(Quantidade) AS Total FROM Estoque GROUP BY ProdutoID HAVING Total > 10;

-- Recuperar informações detalhadas do pedido, incluindo o nome do cliente e o status do pedido
SELECT Pedido.ID, Cliente.Nome AS Cliente, StatusPedido.Nome AS Status
FROM Pedido
INNER JOIN Cliente ON Pedido.ClienteID = Cliente.ID
INNER JOIN StatusPedido ON Pedido.StatusID = StatusPedido.ID;
