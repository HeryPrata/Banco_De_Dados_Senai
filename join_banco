create database livraria;

use livraria;
 
select * 
from autores;
 
select * 
from generos;
  
select * 
from livros;

-- INNER JOIN
select * 
from autores as a
join livros as l
on a.autor_id = l.autor_id
;

-- INNER JOIN com filtro de colunas
select l.titulo, a.name as autor
from autores as a
join livros as l
on a.autor_id = l.autor_id
;

-- LEFT JOIN
select l.titulo, a.name as autor
from autores as a 
left join livros as l
on a.autor_id = l.autor_id;


-- RIGHT JOIN
select l.titulo, a.name as autor
from autores as a 
right join livros as l
on a.autor_id = l.autor_id;

-- LEFT EXLUDING JOIN
-- MOSTRA SÓ O QUE ESTA NA TABELA DO LEFT
-- NESSE CASO, MOSTRA SO OS AUTORES QUE NÃO TEM LIVRO ASSOCIADO
select l.titulo, a.name as autor
from autores as a 
left join livros as l
on a.autor_id = l.autor_id
where l.livro_id is null;

-- RIGHT EXLUDING JOIN
-- MOSTRA SÓ O QUE ESTA NA TABELA DO RIGHT
select l.titulo, a.name as autor
from autores as a 
right join livros as l
on a.autor_id = l.autor_id
where a.autor_id is null;	

-- OUTER JOIN
-- JUNÇÃO DE DOIS OU MAIS JOIN
select l.titulo, a.name as autor
from autores as a 
right join livros as l
on a.autor_id = l.autor_id

-- OPERADOR DE UNIÃO
	UNION

select l.titulo, a.name as autor
from autores as a 
left join livros as l
on a.autor_id = l.autor_id;


-- OUTER EXCLUDING JOIN
-- FAZ O RIGHT JOIN COM EXCLUSÃO
select l.titulo, a.name as autor
from autores as a 
right join livros as l
on a.autor_id = l.autor_id
where a.autor_id is null
	
-- OPERADOR DE UNIÃO
	UNION
    
-- FAZ O LEFT JOIN COM EXCLUSÃO
select l.titulo, a.name as autor
from autores as a 
left join livros as l
on a.autor_id = l.autor_id
where l.livro_id is null;

-- JOIN MAIS TOP
-- JOIN COM TRES TABELAS
-- SELECIONE A PRIMEIRA TABELA
select *
from livros as l
-- FAÇO A JUÇÃO COM A PRIMEIRA E RELACIONANDO AS CHAVES
join autores as a
on a.autor_id = l.autor_id
-- FAÇO A JUNÇÃO COM A SEGUNDA E RELACIONANDO AS CHAVES
join generos as g
on g.genero_id = l.genero_id;
