-- 1. Nome dos funcionários;
select Pessoa.nome
from Pessoa join Funcionario ON
Funcionario.pessoa_id = Pessoa.id;


--2. Data de nascimento dos pilotos;
select Pessoa.data_nasc
from Piloto join Pessoa on
Piloto.pessoa_id = Pessoa.id;

--3. Nome e salário das pilotos do sexo feminino;
select Pessoa.nome, Funcionario.salario
from Piloto join Pessoa on
Piloto.pessoa_id = Pessoa.id
join Funcionario on Funcionario.pessoa_id = Pessoa.id
where Pessoa.sexo = 'F';

--4. CPF das aeromoças;
select Pessoa.cpf
from Aeromoca join Pessoa on
Aeromoca.pessoa_id = Pessoa.id;

--5. Idade em anos das pessoas;
select Pessoa.data_nasc, age(data_nasc), date_part('year', age(data_nasc)), date_part('year', data_nasc) 
from Pessoa;

--6. Funcionários com idade menor que 50 anos;
select Pessoa.data_nasc, age(data_nasc), date_part('year', age(data_nasc)), date_part('year', data_nasc) 
from Pessoa join Funcionario ON
Funcionario.pessoa_id = Pessoa.id
where date_part('year', age(data_nasc)) < 50;

-- 7. Lista de todos os pilotos ordenada por suas idades;
select Pessoa.nome, Pessoa.data_nasc, age(data_nasc), date_part('year', age(data_nasc)), date_part('year', data_nasc)
from Piloto join Pessoa on
Piloto.pessoa_id = Pessoa.id
order by date_part('year', age(data_nasc));

-- 8. Aeromoças com idade inferior a 40 anos com nome iniciando em A;
select Pessoa.nome, date_part('year', age(data_nasc))
from Aeromoca join Pessoa on
Aeromoca.pessoa_id = Pessoa.id
where date_part('year', age(data_nasc)) < 40 and Pessoa.nome like 'A%';

-- 9. CPF dos pilotos cujo nome iniciam em C;
select Pessoa.nome, Pessoa.cpf
from Piloto join Pessoa on
Piloto.pessoa_id = Pessoa.id
WHERE Pessoa.nome like 'C%';

-- 10. Nome e idade das aeromoças na época que fizeram o curso da ANAC;



-- 11. Aeromoças com mais que 5 anos de formação;
-- 12. Funcionários com telefones com prefixo 11;
-- 13. Funcionários com telefones com prefixo 64;
-- 14. Todos os domínios dos e-mails das pessoas;
-- 15. Todos os domínios dos e-mails dos funcionários;
-- 16. Domínios de e-mail finalizados em .com (sem repetição);
-- 17. Nomes, idades e e-mails dos funcionários com e-mail .com, com mais de 45 anos, morados de MS
-- e com salário superior a R$5000,00;
-- 18. E-mails que contém a palavra souza;
-- 19. Prenome dos pilotos com DDD 69 com CPF final par;
-- 20. Aeromoças (ou comissários) que também são pilotos;
-- 21. Aeromoças com mais de 50 anos que fizeram curso da ANAC a mais que 3 anos;
-- 22. Nome das aeromoças e idiomas por elas falados;
-- 23. Pilotos com mais que 50 anos que não moram no estado de SP;
-- 24. Funcionários com idade menor do que 45 anos que moram no estado de SP;
-- 25. Aeromoças com menos de 50 anos residentes no estado de SP;
-- 26. Quantidade de pessoas com mesmo prenome;
-- 27. Quantidade de pessoas com mesmo sobrenome;
-- 28. Média das idades das pessoas da família Pereira;
-- 29. Menor e maior idade de nascimento das pessoas com sobrenome Lima;
-- 30. Quantidade de pessoas que possuem telefone e CPF terminados com o mesmo dígito;
-- 31. Quantidade de pilotos do sexo feminino, moradoras em cada Estado;
-- 32. Estados que concentram mais do que 10 funcionários;
-- 33. Média salarial por cargo e sexo;
-- 34. Média de idade das aeromoças;
-- 35. Média de idade dos pilotos que moram no estado de SP;
-- 36. Nome das três cidades com o maior número de aeromoças;
-- 37. Quantidade de aeromoças moradoras em cada Cidade;
-- 38. Domínios de e-mail com maior frequência (aparecem mais);
