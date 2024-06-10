-- Inserir dados na tabela Cliente
INSERT INTO Cliente (Nome, Email, TipoCliente) VALUES
('João Silva', 'joao@gmail.com', 'PF'),
('Empresa XYZ', 'contato@xyz.com', 'PJ');

-- Inserir dados na tabela PessoaFisica
INSERT INTO PessoaFisica (ClienteID, CPF) VALUES
(1, '12345678901');

-- Inserir dados na tabela PessoaJuridica
INSERT INTO PessoaJuridica (ClienteID, CNPJ) VALUES
(2, '12345678000199');

-- Inserir dados na tabela Fornecedor
INSERT INTO Fornecedor (Nome, Email, Telefone, Endereco) VALUES
('Fornecedor A', 'fornecedorA@gmail.com', '123456789', 'Rua A, 123'),
('Fornecedor B', 'fornecedorB@gmail.com', '987654321', 'Rua B, 456');

-- Inserir dados na tabela Produto
INSERT INTO Produto (Nome, Descricao, Preco, FornecedorID) VALUES
('Produto 1', 'Descricao do Produto 1', 50.00, 1),
('Produto 2', 'Descricao do Produto 2', 150.00, 2);

-- Inserir dados na tabela StatusPedido
INSERT INTO StatusPedido (Nome) VALUES
('Pendente'),
('Concluído'),
('Cancelado');

-- Inserir dados na tabela MetodoPagamento
INSERT INTO MetodoPagamento (Tipo, Numero, DataExpiracao) VALUES
('Cartão de Crédito', '1234123412341234', '2025-12-31'),
('Boleto', NULL, NULL);

-- Inserir dados na tabela Pedido
INSERT INTO Pedido (Data, DataEntrega, MotivoCancelamento, ClienteID, StatusID, CodigoRastreio, MetodoPagamentoID) VALUES
('2024-05-01', '2024-05-05', NULL, 1, 1, 'AB123456789CD', 1),
('2024-05-02', NULL, 'Cliente solicitou', 2, 3, 'EF987654321GH', 2);

-- Inserir dados na tabela ItemPedido
INSERT INTO ItemPedido (PedidoID, ProdutoID, Quantidade, Subtotal) VALUES
(1, 1, 2, 100.00),
(1, 2, 1, 150.00);

-- Inserir dados na tabela Estoque
INSERT INTO Estoque (ProdutoID, Quantidade) VALUES
(1, 20),
(2, 5);
