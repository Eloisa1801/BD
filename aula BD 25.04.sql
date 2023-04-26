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

select number, givenname, city, state, statefull, cidade from fake2
