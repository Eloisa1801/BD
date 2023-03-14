-- Criação do banco de dados
CREATE DATABASE meu_banco_de_dados;

-- Selecionando o banco de dados
USE meu_banco_de_dados;

-- Criação da tabela "clientes"
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefone VARCHAR(15)
);

-- Importação de dados para a tabela "clientes"
LOAD DATA INFILE '"C:\Users\Aluno\Documents\sergio\mini_PostgreSQL\fakenames.csv"'
INTO TABLE clientes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Criação da tabela "pedidos"
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Importação de dados para a tabela "pedidos"
LOAD DATA INFILE 'C:\Users\Aluno\Documents\sergio\mini_PostgreSQL\DataNasc.csv'
INTO TABLE pedidos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Criação da tabela "itens_pedido"
CREATE TABLE itens_pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    produto VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

-- Importação de dados para a tabela "itens_pedido"
LOAD DATA INFILE 'C:\Users\Aluno\Documents\sergio\mini_PostgreSQL\produtos.csv'
INTO TABLE itens_pedido
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Criação da tabela "produtos"
CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL
);

-- Importação de dados para a tabela "produtos"
LOAD DATA INFILE 'C:\Users\Aluno\Documents\sergio\mini_PostgreSQL\produtos.csv'
INTO TABLE produtos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Criação da tabela "estoque"
CREATE TABLE estoque (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Importação de dados para a tabela "estoque"
LOAD DATA INFILE '/caminho/para/arquivo/estoque.csv'
INTO TABLE estoque
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;