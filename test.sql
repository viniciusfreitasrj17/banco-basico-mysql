-- Basic SQL
create database test;

use test;

create table estados (
	id int(10) unsigned not null auto_increment,
	nome varchar(45) not null,
	sigla varchar(2) not null,
	primary key (id)
);

insert into estados (
	nome, sigla
) values ('Rio de Janeiro', 'RJ'), 
	('São Paulo', 'SP'), 
	('Minas Gerais', 'MG'), 
	('Espírito Santo', 'ES');

create table cidades (
	id int(10) unsigned not null auto_increment, 
	nome varchar(255) not null, 
	estados_id int(10) unsigned not null, 
	primary key (id), 
	foreign key (estados_id) references estados (id)
);

insert into cidades (
	nome, estados_id
) values ('Belo Horizonte', 3), 
	('Santos', 2), 
	('Niterói', 1), 
	('Vitória', 4), 
	('Vila Velha', 4), 
	('Rio de Janeiro', 1), 
	('São Paulo', 2);

insert into cidades (nome, estados_id) 
values ('Ouro Preto', (select id from estados where sigla = 'MG'));


select 
	c.nome as Cidade, 
	e.nome as Estados, 
	sigla as 'Região' 
from 
	estados e, 
	cidades c 
where e.id = c.estados_id 
order by c.nome;

