#################3/*Lista 02 – SQL Avançado - SCP*/#######################

/*23*/
SELECT idfuncionario, nome
FROM funcionario
WHERE sexo = 'M' and nome not like '(AM)%' ;


/*24*/
SELECT * FROM pedido
where via = 'A' and frete >= '300'
ORDER BY idpedido;

/*25*/
SELECT count(idcliente) FROM cliente;

/*26*/
SELECT count(idcliente) 
FROM cliente
WHERE idcidade = '14';

/*27*/
SELECT count(idcidade)
FROM cidade 
where idpais <> 'BRA';

/*28*/
SELECT count(idfuncionario)
from funcionario
where email is not null

/*29*/
select count(*) FROM cidade

/*30*/ 
select sum(salario) FROM funcionario

/*31*/
select sum(quantest * venda) from produto

/*32*/
select sum(frete)
FROM pedido
where via = 'M'


/*33*/
select sum(salario)
from funcionario
where sexo = 'M' and idfuncao <> 10 and idfuncao <> 11

/*41*/

select date_part('month', min(datapedid)) ||'/'|| date_part('year', min(datapedid)) "Mês/Data"
from pedido
where via = 'A';
select * from pedido;

/*42*/
select pe.idpedido, count(pr.idproduto) quant
from pedido pe, produto pr
GROUP BY pe.idpedido



/*43*/
SELECT idsetor, sum(salario) as total
FROM funcionario 
GROUP BY idsetor 
HAVING sum(salario) > 5.000

/*44*/
SELECT idtipo, avg(custo) PMC, avg(venda) PMV, avg(custo) - avg(venda) Diferença
FROM produto
GROUP BY idtipo

/*45*/
SELECT idproduto, count(idpedido)
FROM itens
GROUP BY idproduto
HAVING count(idpedido) > 20

SELECT * from itens

/*46*/
SELECT idsetor,sexo, AVG(date_part('year',age(dataNasc))) Media
FROM funcionario
GROUP BY idsetor, sexo
having AVG(date_part('year',age(dataNasc))) <40

/*47*/
SELECT idnasceu, count(sexo) Quantidade
from funcionario
GROUP BY idnasceu
HAVING count(sexo) >= 3;

/*48*/
SELECT idpais, count(idcidade) Quantidade
from cidade
group by idpais 
having count(idcidade) > 5;


/*49*/
SELECT idcliente ,count(idpedido)
FROM pedido
group by idcliente;

/*50*/
select idtipo, avg(custo) PMV, avg(venda) PMV, avg(custo) - avg(venda) / 100
FROM produto
group by idtipo;
