drop table if exists Dados_ensino;
CREATE TABLE Dados_ensino(
	ID SERIAL PRIMARY KEY,
	NU_ANO_CENSO INT NOT NULL,
	NO_REGIAO varchar(100) NOT NULL,
	CO_REGIAO INT NOT NULL,
	NO_UF varchar(20) NOT NULL,
	SG_UF varchar(2) NOT NULL,
	CO_UF INT NOT NULL,
	NO_MUNICIPIO varchar(100) NOT NULL,
	CO_MUNICIPIO VARCHAR(8) NOT NULL,
	NO_MESORREGIAO varchar(40) NOT NULL,
	CO_MESORREGIAO INT NOT NULL,
	NO_MICRORREGIAO varchar(40) NOT NULL,
	CO_MICRORREGIAO INT NOT NULL,
	CO_DISTRITO VARCHAR(10) NOT NULL,
	CO_ENTIDADE VARCHAR(10) NOT NULL,
	NO_ENTIDADE varchar(200) NOT NULL,
	TP_DEPENDENCIA INT NOT NULL,
	TP_CATEGORIA_ESCOLA_PRIVADA INT NOT NULL,
	TP_LOCALIZACAO INT NOT NULL,
	TP_LOCALIZACAO_DIFERENCIADA INT NOT NULL,
	DS_ENDERECO varchar(70),
	NU_ENDERECO varchar(100),
	DS_COMPLEMENTO char(100),
	NO_BAIRRO varchar(100),
	CO_CEP varchar(100)
);


COPY Dados_ensino (NU_ANO_CENSO, NO_REGIAO, CO_REGIAO, NO_UF, SG_UF, CO_UF, NO_MUNICIPIO, CO_MUNICIPIO, 
			 NO_MESORREGIAO, CO_MESORREGIAO, NO_MICRORREGIAO, CO_MICRORREGIAO, CO_DISTRITO, CO_ENTIDADE, 
			 NO_ENTIDADE, TP_DEPENDENCIA, TP_CATEGORIA_ESCOLA_PRIVADA, TP_LOCALIZACAO, TP_LOCALIZACAO_DIFERENCIADA, 
			 DS_ENDERECO, NU_ENDERECO, DS_COMPLEMENTO, NO_BAIRRO, CO_CEP) FROM 'D:\trabalho_bd\microdados_ed_basica_2021 - Copia.csv' DELIMITER ',' CSV HEADER;
			 
			 
			 
/*------------------------*/

CREATE TABLE Regiao
(
   codigo serial PRIMARY KEY,
   nome varchar(100),
   cod_reg int
);

INSERT INTO Regiao (nome, cod_reg)
SELECT DISTINCT NO_REGIAO, CO_REGIAO
FROM Dados_ensino
ORDER BY 1;

select * from Dados_ensino;

ALTER TABLE Dados_ensino ADD COLUMN regiao int REFERENCES Regiao(codigo);

UPDATE Dados_ensino SET regiao = Regiao.codigo
FROM Regiao
WHERE NO_REGIAO = Regiao.nome;

ALTER TABLE Dados_ensino drop column NO_REGIAO;
ALTER TABLE Dados_ensino drop column CO_REGIAO;

/*------------------------*/

CREATE TABLE Uf
(
   codigo serial PRIMARY KEY,
   nome varchar(100),
   sigla varchar (2),
   cod_uf int 
);

INSERT INTO Uf (nome, sigla, cod_uf)
SELECT DISTINCT NO_UF, SG_UF, CO_UF
FROM Dados_ensino
ORDER BY 1;

select * from Dados_ensino;

ALTER TABLE Dados_ensino ADD COLUMN uf int REFERENCES Uf(codigo);

UPDATE Dados_ensino SET uf = Uf.codigo
FROM Uf
WHERE NO_UF = Uf.nome;

ALTER TABLE Dados_ensino drop column NO_UF;
ALTER TABLE Dados_ensino drop column CO_UF;
ALTER TABLE Dados_ensino drop column SG_UF;

/*------------------------*/

CREATE TABLE Municipio
(
   codigo serial PRIMARY KEY,
   nome varchar(100),
   cod_muni varchar(100)
);

INSERT INTO Municipio (nome, cod_muni)
SELECT DISTINCT NO_MUNICIPIO, CO_MUNICIPIO
FROM Dados_ensino
ORDER BY 1;

select * from Municipio;

ALTER TABLE Dados_ensino ADD COLUMN municipio int REFERENCES Municipio(codigo);

UPDATE Dados_ensino SET municipio = Municipio.codigo
FROM Municipio
WHERE NO_MUNICIPIO = Municipio.nome;

ALTER TABLE Dados_ensino drop column NO_MUNICIPIO;
ALTER TABLE Dados_ensino drop column CO_MUNICIPIO;

/*------------------------*/

CREATE TABLE Mesorregiao
(
   codigo serial PRIMARY KEY,
   nome varchar(100),
   cod_mesorregiao int
);

INSERT INTO Mesorregiao (nome, cod_mesorregiao)
SELECT DISTINCT NO_MESORREGIAO, CO_MESORREGIAO
FROM Dados_ensino
ORDER BY 1;

select * from Mesorregiao;

ALTER TABLE Dados_ensino ADD COLUMN mesorregiao int REFERENCES Mesorregiao(codigo);

UPDATE Dados_ensino SET mesorregiao = Mesorregiao.codigo
FROM Mesorregiao
WHERE NO_MESORREGIAO = Mesorregiao.nome;

ALTER TABLE Dados_ensino drop column NO_MESORREGIAO;
ALTER TABLE Dados_ensino drop column CO_MESORREGIAO;

/*------------------------*/

CREATE TABLE Microregiao
(
   codigo serial PRIMARY KEY,
   nome varchar(100),
   distrito VARCHAR(10),
   cod_microregiao int
);

INSERT INTO Microregiao (nome, distrito, cod_microregiao)
SELECT DISTINCT NO_MICROREGIAO, CO_DISTRITO, CO_MICROREGIAO
FROM Dados_ensino
ORDER BY 1;

select * from Microregiao;

ALTER TABLE Dados_ensino ADD COLUMN microregiao int REFERENCES Microregiao(codigo);

UPDATE Dados_ensino SET microregiao = Microregiao.codigo
FROM Microregiao
WHERE NO_MICROREGIAO = Microregiao.nome;

ALTER TABLE Dados_ensino drop column NO_MICROREGIAO;
ALTER TABLE Dados_ensino drop column CO_MICROREGIAO;
ALTER TABLE Dados_ensino drop column CO_DISTRITO;

/*------------------------*/

CREATE TABLE Entidade
(
   codigo serial PRIMARY KEY,
   nome varchar(100),
   cod_entidade varchar(20)
);

INSERT INTO Entidade (nome, cod_entidade)
SELECT DISTINCT NO_ENTIDADE, CO_ENTIDADE
FROM Dados_ensino
ORDER BY 1;

select * from Entidade;

ALTER TABLE Dados_ensino ADD COLUMN entidade int REFERENCES Entidade(codigo);

UPDATE Dados_ensino SET entidade = Entidade.codigo
FROM Entidade
WHERE NO_ENTIDADE = Entidade.nome;

ALTER TABLE Dados_ensino drop column NO_ENTIDADE;
ALTER TABLE Dados_ensino drop column CO_ENTIDADE;

/*------------------------*/
