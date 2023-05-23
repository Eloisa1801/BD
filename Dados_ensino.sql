
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


