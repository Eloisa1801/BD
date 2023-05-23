
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
(
   codigo int primary key,
   nome varchar(100),
   sigla varchar(2)
);

INSERT INTO Uf
SELECT DISTINCT CO_UF, NO_UF, SG_UF, 
FROM Dados_ensino
ORDER BY 1;

select * from Uf;

ALTER TABLE Dados_ensino drop column NO_UF;
ALTER TABLE Dados_ensino drop column SG_UF;

/*------------------------*/

CREATE TABLE Municipio
(
   codigo varchar(20) primary key,
   nome varchar(100)
);

INSERT INTO Municipio
SELECT DISTINCT CO_MUNICIPIO, NO_MUNICIPIO
FROM Dados_ensino
ORDER BY 1;

select * from Municipio;

ALTER TABLE Dados_ensino drop column NO_MUNICIPIO;

/*------------------------*/



