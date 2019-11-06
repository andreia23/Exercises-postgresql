###################### lista 4 subconsulta ##################

--1°

select idproduto,nome,venda
from produto
where venda = (select max(venda) from produto)


-- 2°
select ped.idpedido,ped.datapedid,
cl.nome,cl.idcidade,cl.fone
from pedido ped  join cliente cl 
on ped.idcliente = cl.idcliente
where cl.idcidade  in ('3','4')
order by cl.nome

OU

SELECT ped.idpedido,ped.datapedid,
cl.nome,cl.idcidade,cl.fone
from (select * from cliente where idcidade  in ('3','4')) cl
inner join pedido ped on ped.idcliente = cl.idcliente
order by cl.nome


-- 3°

select ped.idpedido,
cl.nome,cid.nome,cid.idpais
from pedido ped join cliente cl 
on ped.idcliente = cl.idcliente
join cidade cid
on cid.idcidade = cl.idcidade
where cid.idpais not in ('ALE','ING')
order by cid.nome

OU

select  cli.idpedido,cli.nome, cid.nome,
cid.idpais
from ( select * from pedido ped join cliente cl 
on ped.idcliente = cl.idcliente) as cli
inner join cidade cid
on cid.idcidade = cli.idcidade
where cid.idpais not in ('ALE','ING')



-- 4°

SELECT quant "Quantidade de mulheres",media Média,nome "Nome do setor"
from (select se.nome,avg(salario) Media,count(sexo) quant
from funcionario funci inner join setor se on funci.idsetor = se.idsetor  group by se.nome,sexo having sexo = 'F') as funci
where quant = (SELECT max(tot) total from (select sexo,idsetor,count(idsetor) as tot from funcionario where sexo = 'F' 
group By sexo,idsetor) totsub )

OU

SELECT quant "Quantidade de mulheres",media Média,nome "Nome do setor"
from (select se.nome,avg(salario) Media,count(sexo) quant
from funcionario funci inner join setor se on funci.idsetor = se.idsetor  group by se.nome,sexo having sexo = 'F') as funci
order by quant desc
limit 1;


-- 5°
select idfuncionario, nome, fone, datanasc, 
date_part('year',age(datanasc)) from funcionario
where date_part('year',age(datanasc)) = (select max(date_part('year',age(datanasc))) Idade from funcionario where sexo = 'M')


-- 6°
SELECT distinct se.nome,func.idsetor, func.Soma
FROM (select distinct idsetor,idfuncao, sum(salario) Soma from funcionario 
group by idfuncao,idsetor having idfuncao in (10,11,18)) func
inner join setor se on func.idsetor = se.idsetor
order by se.nome

OU

select se.nome, se.idsetor,sum(fu.salario) Total
from setor se join funcionario fu on se.idsetor = fu.idsetor
where fu.idfuncao in (select idfuncao from funcao
where nome like 'Vendedor%' or nome like 'Supervisor%')
group by se.nome, se.idsetor



7° 
select pe.via, count(idpedido),pe.idpedido,pe.datapedid,pe.datafatura, pe.nome "Nome do funcionario"
from (select *from pedido p, funcionario fu where p.idvendedor = fu.idfuncionario) pe
inner join cliente c on pe.idcliente = c.idcliente
group by pe.via,pe.idpedido,pe.datapedid,pe.datafatura, pe.nome,c.tipo,c.idcidade
having  c.tipo in ('J')  and  c.idcidade not in (1,73)


select pe.idpedido,pe.datapedid,pe.datafatura, pe.nome
from (select *from pedido p, cliente c where p.idcliente = c.idcliente where c.tipo = 
inner join cliente c on pe.idcliente = c.idcliente
where c.tipo = 'J'

select via, count(idpedido) from pedido group by via
