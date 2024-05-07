drop database if exists escola;

create database if not exists escola;

use escola;

create table alunos(
	id int auto_increment, 
	nome varchar(50),
	idade int,
	primary key(id)
);

insert into alunos (nome, idade) values ('joão', 20);
insert into alunos (nome, idade) values ('maria', 22);
insert into alunos (nome, idade) values ('carlos', 19);

-- VIEW
-- view é uma representação virtual de uma tabela baseada em uma consulta sql.
-- ela permite simplificar consultas complexas e reutilizar a lógica de consulta
-- create view <nome> as <pesquisa>;

create view alunosMaioresDe20 as 
select nome, idade from alunos where idade > 20;

alter view alunosmaioresde20 as
select nome, idade, year(now()) - idade as ano_nascimento from alunos where idade > 20;

select * from alunosmaioresde20;

-- FUNCTION
-- São blocos de códigos reutilizáveis que realizam  uma tarefa específica.
-- Pode-se usá-las para simplificar consultas, cálcular ou manipulação de dados
DELIMITER //
create function calculaMediaIdade()
returns decimal(5,2)
begin
		declare media decimal(5,2);
		select avg(idade) into media from alunos;
		return media;
end//
delimiter ;

select calculaMediaIdade() as mediaIdade;
select id, nome, idade, calculaMediaIdade() as mediaIdade from alunos;

delimiter //
create function calcular_idade(data_nascimento date)
returns int
begin
	declare idade int;
	declare data_atual date;
	set data_atual = curdate();
	set idade = year(data_atual) - year(data_nascimento);
	if month(data_atual) < month(data_nascimento) or (
		month(data_atual) = month(data_nascimento) and 
		day(data_atual) < day(data_nascimento)
) then
	set idade = idade - 1;
	end if;
	return idade;
end//
delimiter ;

select calcular_idade('2007-09-09');

-- Procedure
-- Procedimentos são conjuntos de instruções sql armazenados no banco de dados.
-- Eles podem aceitar parâmetros e executar uma serie de comandos.
delimiter //
create procedure adicionaAlunos(x_nome varchar(50), x_idade int)
begin
	insert into alunos (nome, idade) values (x_nome, x_idade);
end//
delimiter ;

call adicionaAlunos('Ana', 30);

-- Diferença entre Function e Procedure
-- Function -> retorna um valor. Pode ser usado em expressão sql. exemplo Select calcularMediaIdade();
-- Procedure -> Não retorna um valor diretamente. Pode ser efeitos colaterais, como modificar dados no banco de dados. exemplo: Call adicionaAluno('Ana', 30);
