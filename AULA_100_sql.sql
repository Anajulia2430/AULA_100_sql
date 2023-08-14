-- Criação do banco de dados
create database ibge_ispa;

-- Ativação do Bando de dados
use ibge_ispa;

-- Criação da tabela produtos
create table produtos (
cod_produto INT,
nome_produto VARCHAR(45),
PRIMARY KEY (cod_produto)
);

-- Criação da tabela safra
create table safra (
cod_safra INT,
cod_produto INT,
volume INT,
ano INT,
mes INT,
primary key (cod_safra),
FOREIGN KEY (cod_produto)
references produtos (cod_produto)
);

drop table produto;
drop table safra;
 
 -- Listar todos os produtos e suas safras correspondentes
select s.volume, p.nome_produto from safra s 
inner join produtos p
 on s.cod_produto=p.cod_produto;

-- Listar o nome do produto, volume e ano da safra para um
-- produto específico (por exemplo, código do produto 1)
select p.nome_produto,s.volume,s.ano from produtos p 
inner join safra s
 on p.cod_produto=p.cod_produto
 where p.cod_produto=5;
 
 -- Calcular o volume total de safras para cada produtoCalcular o
-- volume total de safras para cada produto
 SELECT p.cod_produto, p.nome_produto, SUM(s.volume) AS volume_total
FROM produtos p
inner join safra s ON p.cod_produto = s.cod_produto
GROUP BY p.cod_produto, p.nome_produto;

-- Listar os produtos que tiveram safras no ano de 2023
select p.nome_produto,s.ano from produtos p
inner join safra s 
on p.cod_produto=s.cod_produto 
where s.ano=2023;

-- Listar o nome do produto e o volume médio das safras para
-- produtos com volume médio superior a 100 milhões de toneladas
SELECT p.nome_produto, AVG(s.volume) AS volume_medio
FROM produtos p
INNER JOIN safra s ON p.cod_produto = s.cod_produto
GROUP BY p.nome_produto
HAVING AVG(s.volume) > 100000000;

-- Listar os produtos e suas safras ordenados pelo ano e mês da safra
select p.nome_produto, s.cod_safra, s.ano, s.mes from produtos p
inner join safra s
on p.cod_produto=s.cod_produto
order by s.ano and s.mes;

-- Calcular o total de volume de safras agrupados por produtos no
-- ano de 2023
select p.cod_produto,p.nome_produto, sum(s.volume) as volume_total from 
produtos p inner join safra s
on p.cod_produto=s.cod_produto
group by s.ano=2023;

-- Calcular volume de safras do produto com código 2 no ano de
-- 2023 no mês de Junho
select p.cod_produto,p.nome_produto, sum(s.volume) as volume_total 
from produtos p 
inner join safra s on p.cod_produto=s.cod_produto
 where p.cod_produto=2 and s.ano=2023 and s.mes=6;
 
 SELECT * FROM produtos p INNER JOIN safra s ON p.cod_produto =
s.cod_produto;

