begin;
drop database if exists startup;
Create database startup;
use startup;

create table Startup (
	id_startup int auto_increment,
    nome_startup varchar(20) not null,
    cidade_sede varchar(20),
    primary key (id_startup)) auto_increment=10001;
create table Linguagem_Programação (
    id_linguagem int auto_increment,
    nome_linguagem varchar(20) not null,
    ano_lançamento year,
    primary key(id_linguagem)) auto_increment=20001;
create table Programador (
	id_programador int auto_increment,
    id_startup int(5),
    nome_programador varchar(20) not null,
    gênero char(1) Check (gênero = 'F' or gênero = 'M'),
    data_nascimento date,
    email varchar(40),
    primary key(id_programador),
    unique(email)) auto_increment=30001;
create table Programador_Linguagem (
	id_programador int(5),
    id_linguagem int(5),
    primary key(id_programador, id_linguagem));
create table Startup_Linguagem (
	id_startup int(5),
    id_linguagem int(5),
    primary key(id_startup, id_linguagem));
    
insert into startup (nome_startup, cidade_sede ) values
    ('Tech4Toy', 'Porto Alegre'),
    ('Smart123', 'Belo Horizonte'),
    ('knowledgeUP', 'Rio de Janeiro'),
    ('BSI Next Level', 'Recife'),
    ('QualiHealth', 'São Paulo'),
    ('ProEdu', 'Florianópolis');
insert into Linguagem_Programação (nome_linguagem, ano_lançamento) values
	('Python', '1991'),
    ('PHP', '1995'),
    ('Java', '1995'),
    ('C', '1972'),
    ('JavaScript', '1995'),
    ('Dart', '2011');
insert into Programador (id_startup, nome_programador, gênero, data_nascimento, email)  values
	('10001', 'João Pedro', 'M', '1993-06-23', 'joaop@mail.com'),
    ('10002', 'Paula Silva', 'F', '1986-01-10', 'Paulas@mail.com'),
    ('10003', 'Renata Vieira', 'F', '1991-07-05', 'renatav@mail.com'),
    ('10004', 'Felipe Santos', 'M', '1976-11-25', 'felipes@mail.com'),
    ('10001', 'Ana Cristina', 'F', '1968-02-19', 'anac@mail.com'),
    ('10004', 'Alexandre Alves', 'M', '1988-07-07', 'alexandrea@mail.com'),
    ('10002', 'Laura Marques', 'F', '1987-10-04', 'lauram@mail.com');
insert into Programador_Linguagem values
	('30001', '20001'),
    ('30001', '20002'),
    ('30002', '20003'),
    ('30003', '20004'),
    ('30003', '20005'),
    ('30004', '20005'),
    ('30007', '20001'),
    ('30007', '20002');
insert into Startup_Linguagem values
	('10001', '20001'),
    ('10001', '20002'),
    ('10002', '20001'),
    ('10002', '20002'),
    ('10002', '20003'),
    ('10003', '20004'),
    ('10003', '20005'),
    ('10004', '20005');

alter table Programador	ADD FOREIGN KEY(id_Startup) REFERENCES Startup(id_startup) on update cascade;
alter table Programador_Linguagem ADD FOREIGN KEY(id_programador) REFERENCES Programador(id_programador) on delete cascade;
alter table Programador_Linguagem ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programação(id_Linguagem) on update cascade on delete no action;
alter table Startup_Linguagem ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup) on update cascade;
alter table Startup_Linguagem ADD FOREIGN KEY(id_Linguagem) REFERENCES Linguagem_Programação(id_Linguagem) on update cascade;