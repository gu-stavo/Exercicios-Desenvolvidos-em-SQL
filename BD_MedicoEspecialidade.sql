create table medico(

	crm integer,
	nome varchar(50),
	constraint pk_medico primary key(crm)
);

create table especialidades(

	codigo integer primary key,
	descrição varchar(100)
);


create table itens_medico_especialidade(

	codigo integer primary key,
	codigo_especialidades integer,
	crm_medico integer,
	constraint fk_especialidades foreign key(codigo_especialidades)
		references especialidades(codigo),
	constraint fk_medico foreign key(crm_medico)
		references medico(crm)
);

create table paciente(

	codigo integer,
	nome varchar(50),
	idade integer,
	endereço varchar(100),
	constraint pk_paciente primary key(codigo)
);

create table itens_medico_paciente(

	codigo integer primary key,
	crm_medico integer references medico(crm),
	codigo_pacientes integer references paciente(codigo)
);

create table exames(

	numero integer primary key,
	descricao varchar(100),
	data_exame date 
);

create table itens_paciente_exame(

	codigo integer primary key,
	codigo_paciente integer references paciente(codigo),
	numero_exame integer references exames(numero)
);

insert into medico(crm,nome)values(1,'Andre');
insert into medico(crm,nome)values(2,'João');
insert into medico(crm,nome)values(3,'jacobina Bernadete');
insert into medico(crm,nome)values(4,'Marcos');
insert into medico(crm,nome)values(5,'Ana brava');
insert into medico(crm,nome)values(6,'Gustavo');
insert into medico(crm,nome)values(7,'Gilda');
insert into medico(crm,nome)values(8,'Wellignton');
insert into medico(crm,nome)values(9,'Luzia');
insert into medico(crm,nome)values(10,'Christane');

select * from medico;
