-- exercicio 01
SELECT * FROM Produto;


-- exercicio 02

SELECT id, nome, quantidade_minima, unidade_medida 
FROM Produto
ORDER BY quantidade_minima DESC


-- exercicio 03

select Cesta.codigo, Cesta.nome, Produto_cesta.quantidade, Produto.unidade_medida, Produto.nome
from Produto_cesta join Produto ON
Produto.id = Produto_cesta.produto_id
join Cesta on Cesta.codigo = Produto_cesta.cesta_codigo 
ORDER BY Cesta.codigo DESC, Produto.nome 



-- exercicio 04

select Produto.id, Produto.nome, Mercado.nome, Produto.quant_minima, Pesquisa.preco, Produto.quant_minima*Pesquisa.preco
from Pesquisa join Produto on
Produto.id = Pesquisa.produto_id
join Mercado on Mercado.id = Pesquisa.mercado_id
order by Produto.nome, Preco


-- exercicio 05

select Mercado.nome, Produto.id, Produto.nome, Produto.unidade_medida, Produto.quant_minima, Pesquisa.preco, Produto.quant_minima*Pesquisa.preco
from Pesquisa join Produto on
Produto.id = Pesquisa.produto_id
join Mercado on Mercado.id = Pesquisa.mercado_id
where Mercado.nome = 'Quitanda do Zé'
order by Produto.quant_minima*Pesquisa.preco desc


-- exercicio 06
 
select Cesta.nome, Produto.nome, Mercado.nome, Produto_cesta.quantidade, Pesquisa.preco, Produto_cesta.quantidade*Pesquisa.preco
from Produto join Pesquisa on Produto.id = Pesquisa.produto_id 
join Produto_cesta join Produto ON Produto.id = Produto_cesta.produto_id 
join Cesta on Cesta.codigo = Produto_cesta.cesta_codigo 
join Mercado on Mercado.id = Pesquisa.mercado_id
ORDER BY Cesta.nome, Produto.nome, Pesquisa.preco


 