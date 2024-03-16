create table receita(

	codigo serial primary key,
	descricao varchar(50)
);

insert into receita(descricao)values('Tomar o remedio 2 vezes ao dia');
insert into receita(descricao)values('Tomar oem jejum');

create table remedios(

	codigo serial primary key,
	nome varchar(50),
	fabricante varchar(50)
);

insert into remedios(nome,fabricante)values('Dipirona','LabA');
insert into remedios(nome,fabricante)values('Aspirina','LabB');

create table itens_receita_remedio(

	codigo serial primary key,
	codigo_receita integer references receita(codigo),
	codigo_remedios integer references remedios(codigo)
);

insert into itens_receita_remedio(codigo_receita,codigo_remedios)values(1,1);
insert into itens_receita_remedio(codigo_receita,codigo_remedios)values(1,2);
insert into itens_receita_remedio(codigo_receita,codigo_remedios)values(2,1);

create table medico(

	codigo serial primary key,
	crm integer,
	nome varchar(50),
	espec varchar(50)
);

insert into medico(crm,nome,espec)values(812361,'João Silva','Pediatra');
insert into medico(crm,nome,espec)values(812361,'Maria Joana','Cardiologista');

create table paciente(

	codigo serial primary key,
	nome varchar(50),
	idade integer
);

insert into paciente(nome,idade)values('Lucas Costa',23);
insert into paciente(nome,idade)values('Lorena Silva',3);

create table agregacao_medico_paciente_receita(

	codigo serial primary key,
	codigo_medico integer references medico(codigo),
	codigo_paciente integer references paciente(codigo),
	codigo_receita integer references receita(codigo)
);

insert into agregacao_medico_paciente_receita(codigo_medico,codigo_paciente,codigo_receita)
	values(1,2,1);
insert into agregacao_medico_paciente_receita(codigo_medico,codigo_paciente,codigo_receita)
	values(2,1,2);
	