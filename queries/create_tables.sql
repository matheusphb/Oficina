-- Criar o banco de dados
CREATE DATABASE Oficina;
USE Oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    TipoCliente ENUM('PF', 'PJ') NOT NULL
);

-- Tabela PessoaFisica
CREATE TABLE PessoaFisica (
    ClienteID INT PRIMARY KEY,
    CPF VARCHAR(11) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

-- Tabela PessoaJuridica
CREATE TABLE PessoaJuridica (
    ClienteID INT PRIMARY KEY,
    CNPJ VARCHAR(14) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20),
    Endereco TEXT
);

-- Tabela Produto
CREATE TABLE Produto (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    FornecedorID INT,
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedor(ID)
);

-- Tabela StatusPedido
CREATE TABLE StatusPedido (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL
);

-- Tabela MetodoPagamento
CREATE TABLE MetodoPagamento (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(255) NOT NULL,
    Numero VARCHAR(255),
    DataExpiracao DATE
);

-- Tabela Pedido
CREATE TABLE Pedido (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE NOT NULL,
    DataEntrega DATE,
    MotivoCancelamento TEXT,
    ClienteID INT,
    StatusID INT,
    CodigoRastreio VARCHAR(255),
    MetodoPagamentoID INT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ID),
    FOREIGN KEY (StatusID) REFERENCES StatusPedido(ID),
    FOREIGN KEY (MetodoPagamentoID) REFERENCES MetodoPagamento(ID)
);

-- Tabela ItemPedido
CREATE TABLE ItemPedido (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedido(ID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ID)
);

-- Tabela Estoque
CREATE TABLE Estoque (
    ProdutoID INT PRIMARY KEY,
    Quantidade INT NOT NULL,
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ID)
);
