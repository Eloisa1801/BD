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

create table Regiao
(
   codigo int primary key,
   nome varchar(30) not null
);

INSERT INTO Regiao 
SELECT DISTINCT CO_REGIAO, NO_REGIAO  
FROM Dados_Ensino
order by 1;

select * from Regiao;

ALTER TABLE Dados_ensino drop column NO_REGIAO;

/*------------------------*/

CREATE TABLE Uf
(  codigo int primary key,
   nome varchar(100),
   sigla varchar(2)
);

INSERT INTO Uf
SELECT DISTINCT CO_UF, NO_UF, SG_UF
FROM Dados_ensino
ORDER BY 1;

select * from Uf;

ALTER TABLE Dados_ensino drop column NO_UF;
ALTER TABLE Dados_ensino drop column SG_UF;

/*------------------------*/

CREATE TABLE Municipio
(
	codigo VARCHAR(8) primary key,
	nome varchar(100)
);

INSERT INTO Municipio
SELECT DISTINCT CO_MUNICIPIO, NO_MUNICIPIO
FROM Dados_ensino
ORDER BY 1;

select * from Municipio;

ALTER TABLE Dados_ensino drop column NO_MUNICIPIO;

/*------------------------*/

CREATE TABLE Mesorregiao
(
	codigo int PRIMARY KEY,
	nome varchar(100)
);

INSERT INTO Mesorregiao
SELECT DISTINCT CO_MESORREGIAO, NO_MESORREGIAO
FROM Dados_ensino
ORDER BY 1;

select * from Mesorregiao;

ALTER TABLE Dados_ensino drop column NO_MESORREGIAO;

/*------------------------*/

CREATE TABLE Microregiao
(
	codigo int PRIMARY KEY,
	nome varchar(100)
);

INSERT INTO Microregiao
SELECT DISTINCT CO_MICRORREGIAO, NO_MICRORREGIAO
FROM Dados_ensino
ORDER BY 1;

select * from Microregiao;

ALTER TABLE Dados_ensino drop column NO_MICROREGIAO;

/*------------------------*/

CREATE TABLE Entidade
(
	codigo VARCHAR(10) PRIMARY KEY,
	nome varchar(100)
);

INSERT INTO Entidade
SELECT DISTINCT CO_ENTIDADE, NO_ENTIDADE
FROM Dados_ensino
ORDER BY 1;

select * from Entidade;

ALTER TABLE Dados_ensino drop column NO_ENTIDADE;

/*------------------------*/
