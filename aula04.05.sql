DROP VIEW IF EXISTS VFake;
drop table IF EXISTS Fake2;
drop table IF EXISTS Cidade2;
drop table IF EXISTS UF;
drop table IF EXISTS Ocupacao;

SELECT * INTO Fake2
FROM Fakenames;

create table UF 
(
    sigla char(2) PRIMARY KEY,
    nome varchar(19) NOT NULL
);

INSERT INTO UF
SELECT DISTINCT state sigla, statefull nome
FROM fakenames
ORDER BY state;

CREATE TABLE Cidade2
(
    codigo serial PRIMARY KEY,
	nome varchar(100) NOT NULL,
	sigla_estado char(2) NOT NULL REFERENCES UF(Sigla)
);

INSERT INTO Cidade2 (nome, sigla_estado)
select DISTINCT city, state
from fake2
order by state, city;

--SELECT * FROM Cidade2;

ALTER TABLE fake2
ADD COLUMN cidade int REFERENCES Cidade2 (Codigo);

--ALTER TABLE fake2
--ADD CONSTRAINT FK_Fake_Cidade FOREIGN KEY (cidade) REFERENCES Cidade2 (Codigo);

select number, givenname, city, state, statefull, cidade from fake2;

Update FAKE2 SET cidade = Cidade2.Codigo
FROM Cidade2 
WHERE city = Cidade2.nome AND state = sigla_estado;

select number, givenname, city, state, statefull, cidade from fake2
order by number;

select * from cidade2 where codigo in (326, 329, 105);

ALTER TABLE Fake2 DROP COLUMN city;
ALTER TABLE Fake2 DROP COLUMN state;
ALTER TABLE Fake2 DROP COLUMN statefull;

select number, givenname, cidade from fake2
ORDER BY number;

CREATE TABLE Ocupacao
(
   codigo serial PRIMARY KEY, 
   nome varchar(70) NOT NULL
);

INSERT INTO Ocupacao (nome)
SELECT DISTINCT occupation
FROM Fake2
ORDER BY 1;

select * from Ocupacao;

ALTER TABLE Fake2 ADD COLUMN ocupacao int REFERENCES Ocupacao(codigo);

UPDATE fake2 SET ocupacao = Ocupacao.codigo
FROM Ocupacao
WHERE occupation = Ocupacao.nome;

ALTER TABLE FAKE2 drop column occupation;


CREATE OR REPLACE VIEW VFake AS
SELECT number codigo,
   givenname nome,
   surname sobrenome,
   Cidade2.codigo cidade_codigo, 
   Cidade2.nome cidade_nome,
   Cidade2.sigla_estado,
   UF.nome estado,
   Fake2.ocupacao ocupacao_codigo,
   ocupacao.nome ocupacao
   
FROM Fake2 JOIN Cidade2 ON Fake2.cidade = Cidade2.codigo
   JOIN UF ON Cidade2.sigla_estado = UF.sigla
   JOIN Ocupacao ON Fake2.ocupacao = Ocupacao.codigo
ORDER BY number;

select * from vfake;

-- EXERCÍCIO: Continuar a normalização dos dados para os seguintes campos:
	--company
	--ccttype 
	--tropicalzodiac
	--color
	--domain
	
CREATE TABLE Empresa
(
   codigo serial PRIMARY KEY, 
   nome varchar(70) NOT NULL
);

INSERT INTO Empresa (nome)
SELECT DISTINCT company
FROM Fake2
ORDER BY 1;

select * from fake2;

ALTER TABLE Fake2 ADD COLUMN empresa int REFERENCES Empresa(codigo);

UPDATE fake2 SET empresa = Empresa.codigo
FROM Empresa
WHERE company = Empresa.nome;

ALTER TABLE FAKE2 drop column company;

--ALTER TABLE FAKE2 add column company varchar(70);

--select company, * from fake2 order by number limit 5

--UPDATE fake2 SET company = fakenames.company
--FROM fakenames
--WHERE fake2.number = fakenames.number;


CREATE TABLE Tipo
(
   codigo serial PRIMARY KEY, 
   nome varchar(70) NOT NULL
);

INSERT INTO Tipo (nome)
SELECT DISTINCT cctype
FROM Fake2
ORDER BY 1;

select * from tipo;

ALTER TABLE Fake2 ADD COLUMN tipo int REFERENCES Tipo(codigo);

UPDATE fake2 SET tipo = Tipo.codigo
FROM Tipo
WHERE cctype = Tipo.nome;

ALTER TABLE FAKE2 drop column cctype;

	
	
CREATE TABLE Tropical
(
   codigo serial PRIMARY KEY, 
   nome varchar(70) NOT NULL
);

INSERT INTO Tropical (nome)
SELECT DISTINCT tropicalzodiac
FROM Fake2
ORDER BY 1;

select * from fake2;

ALTER TABLE Fake2 ADD COLUMN tropical int REFERENCES Tropical(codigo);

UPDATE fake2 SET tropical = Tropical.codigo
FROM Tropical
WHERE tropicalzodiac = Tropical.nome;

ALTER TABLE FAKE2 drop column tropicalzodiac;
	
	


	
	
	
	
	
	
