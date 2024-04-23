-- Apagar base de dados caso exista
drop database if exists escola;

-- Criar base de dados
create database escola;

-- Selecionar a base de dados que deseja trabalhar
use escola;

-- Criar tabela de alunos
create table alunos (
	id_aluno int not null auto_increment,
	nome varchar(100) not null,
	data_nascimento date,
	endereco varchar(255),
	primary key (id_aluno)
);

-- Criar tabela de professores
create table professores (
	id_professor int not null auto_increment,
	nome varchar(100) not null,
	especialidade varchar(100),
	grau_academico varchar(100),
	primary key (id_professor)
);

-- Criar tabela de disciplinas
create table disciplinas (
	id_disciplina int not null auto_increment,
	nome varchar(100) not null,
	id_professor int,
	primary key (id_disciplina),
	foreign key (id_professor) references professores(id_professor)
);

-- Criar table de notas
create table notas (
	id_nota int not null auto_increment,
	id_aluno int not null,
	id_disciplina int not null,
	nota decimal(4,2) not null,	
	primary key (id_nota),
	foreign key (id_aluno) references alunos(id_aluno),
	foreign key (id_disciplina) references disciplinas(id_disciplina)
);

-- Criar tabela de matriculas
create table matriculas (
	ano int not null,
	id_aluno int not null,
	id_disciplina int not null,
	primary key (ano, id_aluno, id_disciplina),
	foreign key (id_aluno) references alunos(id_aluno),
	foreign key (id_disciplina) references disciplinas(id_disciplina)
);

-- Inserir alunos
insert into alunos (nome, data_nascimento, endereco) values
('João Silva', '2000-05-10', 'Rua A, 123'),
('Maria Oliveira', '2001-08-20', 'Rua B, 456'),
('Pedro Santos', '1999-03-15', 'Rua C, 789'),
('Ana Souza', '2002-01-30', 'Rua D, 321'),
('Lucas Fernandes', '2003-07-05', 'Rua E, 654'),
('Juliana Lima', '2000-11-12', 'Rua F, 987'),
('Carlos Pereira', '1998-09-25', 'Rua G, 1234'),
('Fernanda Costa', '2002-04-03', 'Rua H, 5678'),
('Rafaela Santos', '2001-12-08', 'Rua I, 9012'),
('Bruno Oliveira', '1999-06-17', 'Rua J, 3456'),
('Amanda Silva', '2003-02-14', 'Rua K, 7890'),
('Rodrigo Almeida', '2000-10-21', 'Rua L, 12345'),
('Patrícia Costa', '1998-08-02', 'Rua M, 67890'),
('Marcelo Souza', '2002-03-19', 'Rua N, 123456'),
('Carolina Oliveira', '2001-09-27', 'Rua O, 789012'),
('Gustavo Santos', '1999-05-15', 'Rua P, 1234567'),
('Aline Fernandes', '2003-01-11', 'Rua Q, 890123'),
('Daniel Lima', '2000-07-23', 'Rua R, 2345678'),
('Larissa Silva', '1998-04-18', 'Rua S, 901234'),
('Roberto Almeida', '2002-11-09', 'Rua T, 3456789');

-- Inserir professores
insert into professores (nome, especialidade, grau_academico) values
('Ana Souza', 'Matemática', 'Mestrado'),
('Luciana Fernandes', 'Física', 'Doutorado'),
('Carlos Pereira', 'História', 'Doutorado'),
('João Silva', 'Matemática', 'Doutorado'),
('Maria Oliveira', 'Biologia', 'Mestrado'),
('Pedro Santos', 'Química', 'Doutorado');

-- Inserir disciplinas
insert into disciplinas (nome, id_professor) values
('MAT101', 1),
('Física', 2),
('História', 3),
('Matemática Avançada', 4),
('Biologia', 5),
('Química', 6);

-- Inserir matricula
insert into matriculas (ano, id_aluno, id_disciplina)
select year(now()), id_aluno, id_disciplina from alunos a cross join disciplinas d ;

insert into disciplinas (nome) values ('Teste');

INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (1,1,9.24),
	 (1,1,2.89),
	 (1,2,6.73),
	 (1,2,4.97),
	 (1,3,4.69),
	 (1,3,8.52),
	 (1,4,8.56),
	 (1,4,7.21),
	 (1,5,0.36),
	 (1,5,0.19);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (1,6,9.85),
	 (1,6,8.69),
	 (2,1,3.88),
	 (2,1,3.36),
	 (2,2,5.17),
	 (2,2,5.75),
	 (2,3,3.24),
	 (2,3,8.95),
	 (2,4,5.02),
	 (2,4,8.26);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (2,5,6.23),
	 (2,5,6.38),
	 (2,6,3.19),
	 (2,6,6.81),
	 (3,1,4.48),
	 (3,1,1.97),
	 (3,2,6.41),
	 (3,2,6.15),
	 (3,3,1.51),
	 (3,3,9.11);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (3,4,1.03),
	 (3,4,7.81),
	 (3,5,5.95),
	 (3,5,6.31),
	 (3,6,3.73),
	 (3,6,9.71),
	 (4,1,7.36),
	 (4,1,7.68),
	 (4,2,6.31),
	 (4,2,8.51);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (4,3,3.63),
	 (4,3,2.61),
	 (4,4,2.17),
	 (4,4,3.01),
	 (4,5,8.52),
	 (4,5,3.60),
	 (4,6,2.43),
	 (4,6,1.36),
	 (5,1,9.50),
	 (5,1,3.40);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (5,2,8.54),
	 (5,2,2.47),
	 (5,3,6.74),
	 (5,3,6.27),
	 (5,4,1.14),
	 (5,4,6.88),
	 (5,5,0.99),
	 (5,5,4.29),
	 (5,6,8.51),
	 (5,6,9.67);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (6,1,2.82),
	 (6,1,5.08),
	 (6,2,6.93),
	 (6,2,9.41),
	 (6,3,6.28),
	 (6,3,3.16),
	 (6,4,6.94),
	 (6,4,5.24),
	 (6,5,5.38),
	 (6,5,1.19);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (6,6,9.82),
	 (6,6,5.50),
	 (7,1,8.04),
	 (7,1,3.70),
	 (7,2,4.37),
	 (7,2,0.77),
	 (7,3,0.75),
	 (7,3,1.42),
	 (7,4,4.84),
	 (7,4,9.94);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (7,5,5.17),
	 (7,5,6.06),
	 (7,6,4.77),
	 (7,6,5.68),
	 (8,1,4.08),
	 (8,1,3.35),
	 (8,2,4.51),
	 (8,2,2.51),
	 (8,3,9.02),
	 (8,3,7.55);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (8,4,0.70),
	 (8,4,0.86),
	 (8,5,2.19),
	 (8,5,8.38),
	 (8,6,5.32),
	 (8,6,1.46),
	 (9,1,1.35),
	 (9,1,2.38),
	 (9,2,7.83),
	 (9,2,2.01);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (9,3,6.58),
	 (9,3,6.87),
	 (9,4,4.59),
	 (9,4,2.36),
	 (9,5,8.03),
	 (9,5,3.07),
	 (9,6,1.24),
	 (9,6,7.00),
	 (10,1,1.28),
	 (10,1,5.40);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (10,2,3.15),
	 (10,2,9.55),
	 (10,3,8.30),
	 (10,3,2.85),
	 (10,4,9.37),
	 (10,4,8.29),
	 (10,5,3.35),
	 (10,5,1.86),
	 (10,6,9.24),
	 (10,6,0.65);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (11,1,5.51),
	 (11,1,5.62),
	 (11,2,1.58),
	 (11,2,1.01),
	 (11,3,0.31),
	 (11,3,8.54),
	 (11,4,1.78),
	 (11,4,3.25),
	 (11,5,0.92),
	 (11,5,4.85);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (11,6,1.49),
	 (11,6,2.90),
	 (12,1,0.03),
	 (12,1,1.45),
	 (12,2,7.15),
	 (12,2,1.43),
	 (12,3,5.67),
	 (12,3,4.06),
	 (12,4,3.29),
	 (12,4,4.27);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (12,5,1.47),
	 (12,5,4.55),
	 (12,6,8.32),
	 (12,6,7.97),
	 (13,1,4.87),
	 (13,1,0.46),
	 (13,2,7.67),
	 (13,2,6.99),
	 (13,3,1.94),
	 (13,3,8.74);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (13,4,7.85),
	 (13,4,3.04),
	 (13,5,1.66),
	 (13,5,9.20),
	 (13,6,0.98),
	 (13,6,7.32),
	 (14,1,3.66),
	 (14,1,6.32),
	 (14,2,0.63),
	 (14,2,4.21);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (14,3,9.14),
	 (14,3,3.08),
	 (14,4,7.99),
	 (14,4,0.71),
	 (14,5,9.57),
	 (14,5,5.73),
	 (14,6,9.95),
	 (14,6,2.56),
	 (15,1,2.94),
	 (15,1,7.01);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (15,2,6.23),
	 (15,2,0.12),
	 (15,3,1.93),
	 (15,3,9.27),
	 (15,4,0.58),
	 (15,4,5.09),
	 (15,5,3.69),
	 (15,5,3.18),
	 (15,6,4.82),
	 (15,6,4.59);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (16,1,8.46),
	 (16,1,8.55),
	 (16,2,7.38),
	 (16,2,1.23),
	 (16,3,4.02),
	 (16,3,6.42),
	 (16,4,0.04),
	 (16,4,0.93),
	 (16,5,4.54),
	 (16,5,9.90);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (16,6,5.86),
	 (16,6,9.64),
	 (17,1,0.58),
	 (17,1,4.02),
	 (17,2,8.33),
	 (17,2,9.59),
	 (17,3,2.97),
	 (17,3,6.08),
	 (17,4,1.47),
	 (17,4,9.11);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (17,5,1.15),
	 (17,5,8.43),
	 (17,6,8.71),
	 (17,6,8.26),
	 (18,1,5.15),
	 (18,1,0.99),
	 (18,2,9.48),
	 (18,2,4.46),
	 (18,3,3.84),
	 (18,3,5.81);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (18,4,7.55),
	 (18,4,0.31),
	 (18,5,8.88),
	 (18,5,3.50),
	 (18,6,0.87),
	 (18,6,3.83),
	 (19,1,6.55),
	 (19,1,1.25),
	 (19,2,6.61),
	 (19,2,9.30);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (19,3,6.69),
	 (19,3,5.52),
	 (19,4,7.55),
	 (19,4,1.17),
	 (19,5,3.23),
	 (19,5,2.61),
	 (19,6,3.35),
	 (19,6,8.95),
	 (20,1,4.70),
	 (20,1,6.63);
INSERT INTO escola.notas (id_aluno,id_disciplina,nota) VALUES
	 (20,2,9.06),
	 (20,2,5.42),
	 (20,3,9.91),
	 (20,3,3.29),
	 (20,4,6.70),
	 (20,4,3.65),
	 (20,5,8.14),
	 (20,5,9.78),
	 (20,6,4.44),
	 (20,6,2.89);

-- Exercicio 1
	select a.nome
	from alunos a
	inner join matriculas m on m.id_aluno = a.id_aluno 
	inner join disciplinas d on m.id_disciplina = d.id_disciplina
	where d.nome = 'MAT101';
	
-- Exercicio 2
select p.nome as professor
from professores p
inner join disciplinas d on d.id_professor = p.id_professor
where d.nome = 'Química';

-- Exercicio 3
select a.nome as aluno, d.nome as disciplina
from alunos a
inner join matriculas m on m.id_aluno = a.id_aluno 
inner join disciplinas d on m.id_disciplina = d.id_disciplina
order by disciplina, aluno;

-- Exercicio 4
select a.nome as aluno, d.nome as disciplina, n.nota
from alunos a
inner join notas n on a.id_aluno = n.id_aluno 
inner join disciplinas d on n.id_disciplina = d.id_disciplina
where d.nome = 'Biologia'
order by aluno, nota desc;

-- Exercicio 5
select a.nome as aluno, d.nome as disciplina, n.nota
from alunos a
inner join notas n on a.id_aluno = n.id_aluno 
inner join disciplinas d on n.id_disciplina = d.id_disciplina
where n.nota >= 7
order by aluno, disciplina;

-- Exercicio 6
select a.nome as aluno, d.nome as disciplina, n.nota
from alunos a
inner join notas n on a.id_aluno = n.id_aluno 
inner join disciplinas d on n.id_disciplina = d.id_disciplina
where n.nota >= 8 and d.nome = 'MAT101'
order by aluno, disciplina;

-- Exercicio 7
select a.nome as aluno, d.nome as disciplina, n.nota
from alunos a
inner join notas n on a.id_aluno = n.id_aluno 
inner join disciplinas d on n.id_disciplina = d.id_disciplina
where n.nota > 8 and d.nome = 'MAT101'
order by aluno, disciplina;

-- Exercicio 8
select a.nome as aluno, d.nome as disciplina, n.nota
from alunos a
inner join notas n on a.id_aluno = n.id_aluno 
inner join disciplinas d on n.id_disciplina = d.id_disciplina
where n.nota < 7
order by aluno, disciplina;

-- Exercicio 9
select a.nome, a.data_nascimento
from alunos a
where year(data_nascimento) >= 2000;
select nome, data_nascimento, year(data_nascimento), month(data_nascimento), day(data_nascimento) from alunos a;

-- Exercicio 10
select d.nome as disciplina
from disciplinas d
left join notas n on n.id_disciplina = d.id_disciplina
where n.id_disciplina is null;

-- select distinct id_disciplina from notas ;

-- Exercicio 11
select a.nome as aluno, d.nome as disciplina
from alunos a
inner join matriculas m on a.id_aluno = m.id_aluno
inner join disciplinas d on m.id_disciplina = d.id_disciplina
inner join professores p on d.id_professor = p.id_professor 
where p.especialidade = 'Matemática';
select * from professores p;

-- Exercicio 12
select a.nome as aluno, d.nome as disciplina
from alunos a
inner join matriculas m on a.id_aluno = m.id_aluno
inner join disciplinas d on m.id_disciplina = d.id_disciplina
inner join professores p on d.id_professor = p.id_professor 
where p.grau_academico = 'Doutorado';

-- Exercicio 13 
select d.nome as disciplina
from disciplinas d 
left join professores p on d.id_professor = p.id_professor 
where p.id_professor is null;

-- Exercicio 14
select count(m.id_aluno) as total_alunos
from disciplinas d 
inner join matriculas m on m.id_disciplina = d.id_disciplina
where d.nome = 'Matemática Avançada';

-- Exercicio 15
select sum(n.nota) as soma_notas
from notas n
inner join disciplinas d on d.id_disciplina = n.id_disciplina 
where d.nome = 'Física';

-- Exercicio 16
select max(n.nota) as maior_nota
from notas n
inner join disciplinas d on d.id_disciplina = n.id_disciplina 
where d.nome = 'História';

-- Exercicio 17
select min(n.nota) as menor_nota
from notas n
inner join disciplinas d on d.id_disciplina = n.id_disciplina 
where d.nome = 'Química';

-- Exercicio 18
select avg(n.nota) as media
from notas n
inner join disciplinas d on d.id_disciplina = n.id_disciplina 
where d.nome = 'Biologia';

-- Exercicio 19
select d.nome as disciplinas, count(m.id_aluno) as total_alunos
from disciplinas d 
left join matriculas m on m.id_disciplina = d.id_disciplina 
group by d.nome;

-- Exercicio 20
select sum(nota) as soma_notas from notas;

-- Exercicio 21
select max(nota) as maior_nota from notas;

-- Exercicio 22
select min(nota) as menor_nota from notas;

-- Exercicio 23
select avg(nota) as media from notas;

-- Exercicio 24
select d.nome as disciplina, avg(n.nota) as media
from disciplinas d 
inner join notas n on d.id_disciplina = n.id_disciplina 
group by d.id_disciplina, d.nome;

-- Exercicio 25
select d.nome as disciplina, a.nome as aluno, avg(n.nota) as media
from disciplinas d 
inner join notas n on n.id_disciplina = d.id_disciplina
inner join alunos a on n.id_aluno = a.id_aluno 
group by d.nome, a.nome
order by disciplina, aluno;

-- Exercicio 26
select d.nome as disciplina, a.nome as aluno, avg(n.nota) as media
from disciplinas d 
inner join notas n on n.id_disciplina = d.id_disciplina
inner join alunos a on n.id_aluno = a.id_aluno 
group by d.nome, a.nome
order by disciplina, media desc;

-- Exercicio 27
select a.nome as aluno, n.nota
from notas n
inner join disciplinas d on n.id_disciplina = d.id_disciplina 
inner join alunos a on n.id_aluno = a.id_aluno 
where d.nome = 'História'
order by nota
limit 10;

-- Exercicio 28
select a.nome as aluno, avg(n.nota) as media
from notas n
inner join disciplinas d on n.id_disciplina = d.id_disciplina 
inner join alunos a on n.id_aluno = a.id_aluno 
where d.nome = 'Química'
group by a.nome 
order by nota desc
limit 3;

-- Exercicio 29
select a.nome as disciplina, a.nome as aluno, avg(n.nota) as media
from notas n
inner join disciplinas d on n.id_disciplina = d.id_disciplina 
inner join alunos a on n.id_aluno = a.id_aluno 
group by d.nome, a.nome 
order by nota desc
limit 10;

-- Exercicio 30
select count(distinct id_aluno) as total_alunos from matriculas m;