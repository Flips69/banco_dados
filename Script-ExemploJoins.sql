drop database if exists tipos_joins;

create database tipos_joins;

use tipos_joins;

create table cores (
	id int auto_increment,
	cor varchar(50),
	primary key(id)
);

create table frutas (
	id int auto_increment primary key,
	fruta varchar(50)
);

create table cores_frutas (
	frutas_id int not null,
	cores_id int not null,
	primary key(frutas_id, cores_id),
	constraint fk_cores_frutas_cores
		foreign key (cores_id)
		references cores(id),
	constraint fk_cores_frutas_frutas
		foreign key (frutas_id)
		references frutas(id)
);

INSERT INTO tipos_joins.cores
(cor)
VALUES('vermelho'),
('amarelo'),
('verde');

select id, cor from cores;

insert into frutas (fruta) values
('maça'),
('banana'),
('maracuja'),
('jaca'),
('limão'),
('goiaba');

select id, fruta from frutas;
/*
* CROSS JOIN é um tipo especial de junção em que cada linha de uma tabela 
* é combinada com todas as linhas de outras tablea. Isso reulta em um produto
* cartesiano entre as duas tabelas, ou seja, todas as combinações possíveis de
* linhas são produzidas.
* Por exemplo: temos duas tabelas, uma chamada cores e outra chamada frutas,
* e queremos encontrar todas as combinações possíveis de cores e frutas.
*/
select c.id, c.cor, f.id, f.fruta
from cores c cross join frutas f ;

insert into cores_frutas (cores_id, frutas_id)
select c.id as cores_id, f.id as fruta_id
from cores c cross join frutas f;

select frutas_id, cores_id from cores_frutas cf;

create table clientes (
	id int,
	nome varchar(50),
	primary key (id)
);

create table pedidos (
	id int,
	cliente_id int,
	data_pedido date,
	primary key(id),
	constraint fk_pedidos_clientes
		foreign key (cliente_id)
		references clientes(id)
);

insert into clientes (id, nome) values
(1, 'João'),
(2, 'Maria'),
(3, 'Pedro'),
(4, 'Juvenal'),
(5, 'Carlos'),
(6, 'Marcos');

insert into pedidos (id, cliente_id, data_pedido) values
(101, 1, '2024-03-01'),
(102, 1, '2024-03-05'),
(103, 2, '2024-03-02'),
(104, 3, '2024-03-03'),
(105, 3, '2024-03-07'),
(106, 4, '2024-03-06'),
(107, 2, '2024-03-08'),
(108, 5, '2024-03-09'),
(109, 5, '2024-03-10');

insert into pedidos (id, data_pedido) values (110, '2024-03-11');

select id, nome from clientes;
select id, cliente_id, data_pedido from pedidos;

/*INNER JOIN: Retorna registros quando há pelo menos uma correspondência 
 em ambas as tabelas */

select c.id, c.nome, p.id, p.data_pedido, p.cliente_id
	from clientes c
	inner join pedidos p on c.id = p.cliente_id;
	/* neste exemplo, estamos selecionando todas as colunas das tabelas  (clientes e pedido)
	 * onde há uma correspondência entre o id na tabela clientes e o cliente_id na
	 * tabela pedidos */

	/* LEFT JOIN: Retorna todos os registros da tabela da esquerda (prieira tabela
	 *mencionada) e os registros correspondentes da tabela da direita (segunda tabela 
	 *mencionada). */
	select c.id, c.nome, p.id, p.data_pedido, p.cliente_id
		from clientes c
		left join pedidos p on c.id = p.cliente_id;
	/* aqui, estamos selecionando todos os registros da tabela clientes e os registros
	 * correspondentes da tabela pedidos, se houver, com base na correspondência de
	 * id e cliente_id */
	
	/* RIGHT JOIN: Retorna todos os registros da tabela da direita (segunda tabela
	 * mencionada) e os registros correspondentes da tabela da esquerda (primeira tabela
	 * mencionada).*/
	
	select c.id, c.nome, p.id, p.data_pedido, p.cliente_id
		from clientes c
		right join pedidos p on c.id = p.cliente_id;
		/* este comando retorna todos os registros da tablea pedidos e os registros
		*  correspondentes da tabela clientes, se houver, com base na correspondência
		*  de id e cliente_id */