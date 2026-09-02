-- cria o banco
create database if not exists campeonato;
-- utilizando o banco
use campeonato;
-- cria tabela equipe
create table equipe(

cod_equipe int primary key auto_increment,
nome_equipe varchar (47) not null,
sigla_equipe char(3) unique,
estado_equipe char(2)

);

create table jogador(

cod_jogador int primary key auto_increment,
nome varchar (50) not null,
nacionalidade varchar (50),
altura decimal (3,2), -- ex_decimal: 331.20
peso decimal (6,3),
numero_camisa int,
posicao enum("Goleiro", "Zagueiro", "Meio Campo", "Atacante"),
id_equipe int, 
foreign key (id_equipe) references equipe(cod_equipe)
);

-- crud no banco 
-- FORMA - 1.
insert into equipe(nome_equipe, sigla_equipe, estado)
-- AS INFORMACOES INSERIDAS DEVE RESPEITAR A ORDEM A CIMA.
values ("Gama", "GAM","DF");

-- FORMA - 2.
insert into equipe 
-- A ORDEM VAI SER DEFINIDA PELA ORDEM PADRAO DA TABELA DE ATRIBUTOS.
-- "DEFAULT" MANTEM A INFORMAÇÃO SEM ALTERAÇÃO.
values(default, "Vasco Da Gama", "VAS", "RJ");

-- R -- READ	
select * from equipe;

insert into equipe
values(default,"Fluminense", "FLU", "RJ"),
	  (default, "São Paulo", "SP", "SP"),
      (default, "Real Madrid", "RM", "PB");

-- U -- UPDATE
update equipe
set estado = "MD"





































































































































































































































































































