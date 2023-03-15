-- Criação do banco de dados
CREATE DATABASE comercio;

-- Selecionando o banco de dados
USE comercio;
/*
-- Criação da tabela "clientes"
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefone VARCHAR(15)
);*/

CREATE TABLE clientes (
  number int NOT NULL PRIMARY KEY,
  gender varchar(6) NOT NULL,
  nameset varchar(25) NOT NULL,
  title varchar(6) NOT NULL,
  givenname varchar(20) NOT NULL,
  middleinitial varchar(1) NOT NULL,
  surname varchar(23) NOT NULL,
  streetaddress varchar(100) NOT NULL,
  city varchar(100) NOT NULL,
  state varchar(22) NOT NULL,
  statefull varchar(100) NOT NULL,
  zipcode varchar(15) NOT NULL,
  country varchar(2) NOT NULL,
  countryfull varchar(100) NOT NULL,
  emailaddress varchar(100) NOT NULL,
  username varchar(25) NOT NULL,
  password varchar(25) NOT NULL,
  browseruseragent varchar(255) NOT NULL,
  telephonenumber varchar(25) NOT NULL,
  telephonecountrycode int NOT NULL,
  maidenname varchar(20) NOT NULL,
  birthday varchar(10) NOT NULL,
  age int NOT NULL,
  tropicalzodiac varchar(11) NOT NULL,
  cctype varchar(10) NOT NULL,
  ccnumber varchar(16) NOT NULL,
  CVV2 varchar(3) NOT NULL,
  ccexpires varchar(10) NOT NULL,
  nationalid varchar(20) NOT NULL,
  upstracking varchar(24) NOT NULL,
  westernunionmtcn char(10) NOT NULL,
  moneygrammtcn char(8) NOT NULL,
  color varchar(6) NOT NULL,
  occupation varchar(70) NOT NULL,
  company varchar(70) NOT NULL,
  vehicle varchar(255) NOT NULL,
  domain varchar(70) NOT NULL,
  bloodtype varchar(3) NOT NULL,
  pounds varchar(5) NOT NULL,
  kilograms varchar(5) NOT NULL,
  feetinches varchar(6) NOT NULL,
  centimeters varchar(3) NOT NULL,
  guid varchar(36) NOT NULL,
  latitude numeric(10,6) NOT NULL,
  longitude numeric(10,6) NOT NULL
);


-- Importação de dados para a tabela "clientes"

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\fakenames.csv'
INTO TABLE clientes
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

/*
-- Criação da tabela "pedidos"
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Importação de dados para a tabela "pedidos"
LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\DataNasc.csv'
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
LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\produtos.csv'
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
LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\produtos.csv'
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
LOAD DATA INFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\estoque.csv'
INTO TABLE estoque
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
