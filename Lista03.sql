##########-- Lista de exercicio: Dominando funções agregadas e uso da clásula group by- having ####################

--1°
select al.nome, count(m.idmusica) "Quantidade de musica"
from album al, musica m
where al.codalbum = m.codalbum
group by al.nome
having count(m.idmusica) > 10

-- 2°
RESPOSTA incompletas

select al.nome, max(m.idmusica) "Quanti"
from album al, musica m
where al.codalbum = m.codalbum
group by al.nome
having count(m.idmusica) = max(count(m.idmusica))

OU

select  al.nome,cast (count('nome') as integer) qtdMus,max(distinct numtrilha) NumFaixas
from album al join musica mu 
on al.codalbum =  mu.codalbum
group by al.nome

OU

select al.nome, max(tb.quant)
from  (select codalbum,count(distinct(idmusica)) quant from musica group by codalbum) tb inner join album al
on al.codalbum = tb.codalbum
group by al.nome


-- 3°
select a.nome, count(al.codalbum)
from artista a, album al
where al.codartista = a.codartista
group by a.nome,al.codgenero 
having al.codgenero in(1,2)

-- 4°

SELECT u.nome, count(r.idmens)
FROM si_usuario u, si_receptor r
WHERE u.login = r.destinatario
GROUP BY u.nome,u.login
ORDER BY u.login

OU

select login,cast(count('destinario') as integer)
from si_usuario  join si_receptor 
on si_usuario.login = si_receptor.destinatario
group by login 
order by login 


-- 5°

-- 6°
SELECT u.nome, count(r.idmens)
FROM si_usuario u, si_receptor r
WHERE u.login = r.destinatario
GROUP BY u.nome,u.login,r.lida
having r.lida <> 1


/*7*/
select rec.destinatario,axe.nome,count(*)
from si_receptor rec join si_anexo axe
on rec.idmens = axe.idmens
join si_mensagem men
on men.idmens = axe.idmens 
group by rec.destinatario,axe.nome
having rec.destinatario Ilike '%Alex'

OU

select a.idmens,re.destinatario,cast(count('a.nome') as integer) 
from si_anexo a, si_receptor re
where a.idmens = re.idmens
group by a.idmens,re.destinatario
having re.destinatario like '%alex'


/*8*/

select men.texto,axe.tamanho,count(*)
from si_mensagem men join si_anexo axe
on men.idmens = axe.idmens 
group by men.texto,axe.tamanho 
having axe.tamanho > 5120

