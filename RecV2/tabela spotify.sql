create database spotify;

use spotify;

create table top(
posicao int primary key auto_increment,
artista varchar(50),
musica varchar(255),
dias int,
top_vezes double,
maior_posicao int,
vezes_maior_posi1cao varchar(10),
pico_streams int,
total_streams int
);

select * from spotify.top;

-- FILTRANDO COLUNAS
select posicao, artista, musica
from top;

-- FILTRANDO COM WHERE
select artista = "Travis Scott"
from top;

-- FILTRANDO OPERADORES RELACIONAIS >,<,<>,<=,>=
select *
from top
where top_vezes > 100;

-- FILTRANDO COM OPERADORES LOGICOS - AND, OR, NOT 
select *
from top
where artista = "SZA" and maior_posicao = 5;

-- ORDENADO = ORDER BY, ASC = DE CIMA PRA BAIXO, DESC = DE BAIXO PRA CIMA
select artista, musica
from top
order by artista desc; 

-- ENTRE = BETWEEN
select *
from top
where artista between 'Adele' and 'Calvin Harris'
order by artista;

-- IN -- DENTRO DA LISTA
select *
from top
where artista in('Justin Bieber','Maroon 5','Quavo');

select *
from top
where artista in('20','30','40');

-- LIKE -- PESQUISA NOMES
select artista, musica
from top
where musica like '%Blue';

select artista, musica
from top
where musica like '%Boy%';

-- COUNT -- FAZ A CONTAGEM DE CARACTERISTICA "X"
select count(*) as contagem
from top; 

select count(*) as contagem
from top
where artista = 'Travis Scott';

-- DISTINCT -- CONTAGE DE ARTISTAS DIFERENTES
select count(distinct(artista)) as diferente
from top
order by artista;

-- AGRUPAR RESULTADOS 
select artista, count(artista) as vezes
from top
group by artista;

-- LIMIT - LIMITA OS RESULTADOS 
select*
from top
where maior_posicao = 7
limit 5;

-- SOMA DE RESULTADOS
select sum(total_streams) as total_streams
from top;

-- MEDIA DE RESULTADOS 
select avg(total_streams) as media_streams
from top;

-- VALOR MAXIMO DE RESULTADOS 
select max(total_streams) as maxima_streams
from top;

-- VALOR MINIMO DE RESULTADOS 
select min(total_streams) as minima_streams
from top;

-- VERIFICAR SE O VALOR E NULO
select*
from top
where artista is null;
