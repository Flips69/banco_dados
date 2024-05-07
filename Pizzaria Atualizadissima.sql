
-- show databases;

drop database if exists pizzaria;

create database pizzaria;

use pizzaria;

-- Tabela CLIENTE
 CREATE TABLE Cliente (
 cliente_id INTEGER AUTO_INCREMENT,
 telefone VARCHAR(10),
 nome VARCHAR(30),
 logradouro VARCHAR(30),
 numero DECIMAL(5,0),
 complemento VARCHAR(30),
 bairro VARCHAR(30),
 referencia VARCHAR(30),
 PRIMARY KEY (cliente_id)
 );
 
 -- Tabela PIZZA
 CREATE TABLE pizza (
    pizza_id INTEGER AUTO_INCREMENT,
    nome VARCHAR(30),
    descricao VARCHAR(30),
    valor DECIMAL(4 , 2 ),
    PRIMARY KEY (pizza_id)
 );
 
 -- Tabela PEDIDO
 CREATE TABLE pedido (
    pedido_id INTEGER AUTO_INCREMENT,
    cliente_id INTEGER,
    data DATETIME,
    valor DECIMAL(4 , 2 ),
        PRIMARY KEY (pedido_id),
    FOREIGN KEY (cliente_id)
        REFERENCES Cliente (cliente_id)
 );
 
 -- Tabela ITEM_PEDIDO
 CREATE TABLE item_pedido (
    pedido_id INTEGER,
    pizza_id INTEGER,
    quantidade DECIMAL(2 , 0 ),
    valor DECIMAL(5 , 2 ),
    FOREIGN KEY (pizza_id)
        REFERENCES Pizza (pizza_id),
    FOREIGN KEY (pedido_id)
        REFERENCES Pedido (pedido_id)
 );
 
-- show tables;
-- DESCRIBE cliente;
-- alter table cliente drop telefone;
-- alter table cliente add telefone varchar(12);
alter table cliente modify telefone varchar(14);

INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, NULL, 'Bela Vista', 'Em frente a escola');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(22) 2222-2222','Bruna Dantas', 'Rua das Rosas',222,NULL,'Cantareira',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(33) 3333-3333','Bruno Vieira', 'Rua das Avencas',333,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(44) 4444-4444','Giulia Silva', 'Rua dos Cravos',444,NULL,'Cantareira','Esquina do mercado');
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(55) 5555-5555','José Silva', 'Rua das Acácias',555,NULL,'Bela Vista',NULL);
INSERT INTO cliente (telefone, nome, logradouro, numero, complemento, bairro, referencia) VALUES ('(66) 6666-6666','Laura Madureira','Rua das Gardências',666,NULL,'Cantareira',NULL);

-- select * from cliente c 

INSERT INTO pizza (nome, valor) VALUES ('Portuguesa', 15);
INSERT INTO pizza (nome, valor) VALUES ('Provolone', 17);
INSERT INTO pizza (nome, valor) VALUES ('4 Queijos', 20);
INSERT INTO pizza (nome, valor) VALUES ('Calabresa', 17);
INSERT INTO pizza (nome) VALUES ('Escarola');

-- describe pizza;
-- alter table pizza modify valor decimal(4,2) default 99;
-- INSERT INTO pizza (nome) VALUES ('Moda da Casa');
-- select * from pizza p ;


-- delete from pedido;
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (1, 1, '2016-12-15 20:30:00', 32.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (2, 2, '2016-12-15 20:38:00', 40.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (3, 3, '2016-12-15 20:59:00', 22.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (4, 1, '2016-12-17 22:00:00', 42.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (5, 2, '2016-12-18 19:00:00', 45.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (6, 3, '2016-12-18 21:12:00', 44.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (7, 4, '2016-12-19 22:22:00', 72.00);
INSERT INTO pedido (pedido_id, cliente_id, data, valor) VALUES (8, 6, '2016-12-19 22:26:00', 34.0);

-- delete from item_pedido ;
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 1, 1, 15.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (1, 4, 1, 17.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (2, 3, 2, 40.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (3, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (4, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (5, 1, 3, 45.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (6, 5, 2, 44.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 1, 2, 30.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 3, 1, 20.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (7, 5, 1, 22.00);
INSERT INTO item_pedido (pedido_id, pizza_id, quantidade, valor) VALUES (8, 4, 2, 34.00);


-- view
create view pizza_sem_movimento as
select i.pedido_id as pedido, p.nome as pizza, i.quantidade as qtde,
	(i.valor / i.quantidade) as valor_unitario, i.valor as total
from pizza p
left join item_pedido i on p.pizza_id = i.pizza_id
where i.pedido_id is null;

select * from pizza_sem_movimento;

create table estados_brasil (
	id int auto_increment primary key,
	nome varchar(50)
);

insert into estados_brasil (nome) values
('Acre'),
('Alagoas'),
('Amapá'),
('Amazonas'),
('Bahia'),
('Ceará'),
('Distrito Federal'),
('Espirito Santo'),
('Goiás'),
('Maranhão'),
('Mato Grosso'),
('Mato Grosso do Sul'),
('Minas Gerais'),
('Pará'),
('Paraná'),
('Paraíba'),
('Pernambuco'),
('Piauí'),
('Rio de Janeiro'),
('Rio Grande do Norte'),
('Rio Grande do Sul'),
('Rondônia'),
('Roraima'),
('Santa Catarina'),
('São Paulo'),
('Sergipe'),
('Tocantins');

create table exemplo (
	id int auto_increment primary key,
	nome varchar(50),
	estado varchar(50)
);

delimiter //
create procedure popular_tabela()
begin
	declare i int default 1;
	declare estado_aleatorio int;
	while i <= 1000000 do
		set estado_aleatorio = floor(rand() * 27) +1;
		insert into exemplo (nome, estado) values (concat('Nome', i ),
			(select nome from estados_brasil where id = estado_aleatorio));
		set i = i + 1;
	end while;
end//
delimiter ;

call popular_tabela();