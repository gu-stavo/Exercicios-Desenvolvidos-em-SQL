create table funcionario(

	codigo serial primary key,
	nome varchar(50),
	rg varchar(50),
	qtd_horas_trab integer
);

insert into funcionario(nome,rg,qtd_horas_trab)values('João da Silva','76.098.876-23',16);
insert into funcionario(nome,rg,qtd_horas_trab)values('Maria Filomena','52.123.655-21',8);

create table engenheiros(

	codigo serial primary key,
	crea integer,
	telefone varchar(50),
	especializacao varchar(50),
	codigo_funcionario integer references funcionario(codigo)
);

insert into engenheiros(crea,telefone,especializacao,codigo_funcionario)values(81283128,'(17)7265-9876','Grandes Edificações',2);
select * from engenheiros;

create table secretaria(

	codigo serial primary key,
	endereco varchar(50),
	especializacao varchar(50)
);

create table idiomas(

	codigo serial primary key,
	descricao varchar(50)
);

create table itens_secretarias_idiomas(

	codigo serial primary key,
	codigo_secretaria integer references secretaria(codigo),
	codigo_idioma integer references idiomas(codigo)
);

create table tecnicos(

	codigo serial primary key,
	email varchar(50),
	formacao varchar(50),
	codigo_funcionario integer references funcionario(codigo)
);

insert into tecnicos(email,formacao,codigo_funcionario)values('jojo@gmail.com','tecnico de edificações',1);
select * from tecnicos;