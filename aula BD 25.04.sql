SELECT * INTO fake2 from fakenames
select * from fakenames;
CREATE TABLE UF(
	sigla char(2) primary key,
	nome varchar(19) not null
);
insert into UF
select distinct state sigla, statefull nome 
from fakenames
order by state;

select * from UF

create table cidade2(
	codigo serial primary key,
	nome varchar(100) not null,
	sigla_estado char(2) not null references UF(sigla)
);
insert into cidade2(nome, sigla_estado)
select distinct city, state
from fake2
order by state, city;

SELECT * FROM cidade2
alter table fake2
add column cidade int references cidade2(codigo);

select number, givenname, city, state, statefull, cidade from fake2;
update fake2 set cidade = cidade2.codigo
from cidade2
where city = cidade2.nome and state = sigla_estado;

select number, givenname, city, state, statefull, cidade from fake2
order by number;
select * from cidade2 where codigo in (32, 329, 105);

ALTER TABLE Fake2 DROP COLUMN city;
ALTER TABLE Fake2 DROP COLUMN state;
ALTER TABLE Fake2 DROP COLUMN statefull;





-------------------------------------------------------------------------------

select * into P2 from pessoa  limit 100;

select * from P2;

alter TABLE P2 add constraint PK_P2 PRIMARY key(id);

insert into P2 (ID) values (615);



select max (id) from p2;

CREATE SEQUENCE tabelap2_id_seq START 29136;


Alter table P2
	alter COLUMN id
	set default nextval('tabelap2_id_seq');

insert into p2 (nome) values ('Eduardo Pavanelli');

alter sequence tabelap2_id_seq INCREMENT 100;

insert into p2 (nome) values ('Joao Marques');


select max(id) from p2;


select id from p2;

order by id DESC
limit 10;

create table Etnia 
 (
 sigla char(3) PRIMARY KEY,
	 nome VARCHAR(9)
 );
INSERT INTO Etnia values('B','Branco');
INSERT INTO Etnia values ('N','Negro');
INSERT INTO Etnia values('I','Indigena');
INSERT INTO Etnia values ('P','Pardo');
INSERT INTO Etnia values ('M','Mulato');
INSERT INTO Etnia values ('Cab','Caboclo');
INSERT INTO Etnia values ('Caf','Cafuzo');

Branco
Negro
Indigena
Pardo
Mulato
Caboclo
Cafuzo


alter table p2 add column etnia varchar(3) DEFAULT;

alter table p2 add column etnia char(3);

ALTER TABLE P2 ADD constraint FK_P2_Etnia
	FOREign key (etnia) --campo da tabela P2
	REFERENCES Etnia(sigla);
	
	insert into P2 (nome,etnia) VALUES ('sergio luis','p')
	
	
	
	
-----------------------------------------------------

SELECT * from nomesfalsos
limit 15;

CREATE TABLE UF(
	sigla char(2) PRIMARY KEY,
	nome varchar (19) NOT NULL
);

INSERT INTO UF
SELECT DISTINCT state sigla, statefull nome 
from fakenames
ORDER by state;


select * from UF


select * INTO NomesFalsos
from fakenames;


CREATE TABLE Cidade2(
	codigo serial PRIMARY key,
	nome VARCHAR(100) NOT NULL,
	sigla_estado char(2) NOT NULL REFERENCES UF(sigla)
);


INsert INTO cidade2(nome,sigla_estado)
SELECT DISTINCT city,state 
from nomesfalsos
order by state,city;


alter TABLE nomesfalsos
add column cidade int REFERENCES cidade(codigo);

-- alter table nomesfalsos
-- add CONSTRAINT FK_FAke_Cidades FOREIGN KEY (cidade) references Cidade2(codigo)

select number, givenname,city,state,statefull, cidade from nomesfalsos
order by cidade;


UPDATE nomesfalsos SET cidade = cidade2.Codigo
from cidade2
where city = cidade2.nome AND state = sigla_estado;

select * from cidade WHERE codigo in (326,329,105)

alter table nomesfalsos drop column city;
alter table nomesfalsos drop column state;
alter table nomesfalsos drop column statefull;


select number, givenname, cidade


CREATE or REPLACE VIEW VFake AS
select number codigo,
	givenname nome,
	surname sobrenome,
	cidade2.codigo cidade_codigo,
	cidade2.nome cidade_nome,
	cidade2.sigla_estado,
	UF.nome estado
from nomesfalsos 
	JOIN cidade2 on nomesfalsos.cidade = cidade2.codigo
	join UF on cidade2.sigla_estado = UF.sigla
ORDER by number;


select estado, count(*)
from VFake
group by estado
order by count(*) desc;


update cidade2 set nome = 'SÃO PAULO' WHERE codigo = 329;

occupation
company
ccttype
tropicalzodiac
color
domain
