begin;
drop database if exists startup;
Create database startup;
use startup;

create table Startup (
	id_startup char(5),
    nome_startup varchar(20) not null,
    cidade_sede varchar(20),
    primary key (id_startup));
create table Linguagem_Programação (
    id_linguagem char(5),
    nome_linguagem varchar(20) not null,
    ano_lançamento year,
    primary key(id_linguagem));
create table Programador (
	id_programador char(5),
    id_startup char(5),
    nome_programador varchar(20) not null,
    gênero char(1) Check (gênero = 'F' or gênero = 'M'),
    data_nascimento date,
    email varchar(40),
    primary key(id_programador),
    unique(email));
create table Programador_Linguagem (
	id_programador char(5),
    id_linguagem char(5),
    primary key(id_programador, id_linguagem));
create table Startup_Linguagem (
	id_startup char(5),
    id_linguagem char(5),
    primary key(id_startup, id_linguagem));
    
insert into startup values
    ('10001', 'Tech4Toy', 'Porto Alegre'),
    ('10002', 'Smart123', 'Belo Horizonte'),
    ('10003', 'knowledgeUP', 'Rio de Janeiro'),
    ('10004', 'BSI Next Level', 'Recife'),
    ('10005', 'QualiHealth', 'São Paulo'),
    ('10006', 'ProEdu', 'Florianópolis');
insert into Linguagem_Programação values
	('20001', 'Python', '1991'),
    ('20002', 'PHP', '1995'),
    ('20003', 'Java', '1995'),
    ('20004', 'C', '1972'),
    ('20005', 'JavaScript', '1995'),
    ('20006', 'Dart', '2011');
insert into Programador values
	('30001', '10001', 'João Pedro', 'M', '1993-06-23', 'joaop@mail.com'),
    ('30002', '10002', 'Paula Silva', 'F', '1986-01-10', 'Paulas@mail.com'),
    ('30003', '10003', 'Renata Vieira', 'F', '1991-07-05', 'renatav@mail.com'),
    ('30004', '10004', 'Felipe Santos', 'M', '1976-11-25', 'felipes@mail.com'),
    ('30005', '10001', 'Ana Cristina', 'F', '1968-02-19', 'anac@mail.com'),
    ('30006', '10004', 'Alexandre Alves', 'M', '1988-07-07', 'alexandrea@mail.com'),
    ('30007', '10002', 'Laura Marques', 'F', '1987-10-04', 'lauram@mail.com');
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