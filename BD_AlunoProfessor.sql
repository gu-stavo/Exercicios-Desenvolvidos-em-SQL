create table professor(

	codigo integer,
	nome varchar(50),
	telefone varchar(50),
	constraint pk_professor primary key(codigo)
);

create table disciplina(

	codigo integer primary key,
	num_creditos integer,
	descricao varchar(50),
	codigo_prof integer,
	constraint fk_professor foreign key(codigo_prof) references professor(codigo)
);

create table aluno(
	
	ra integer primary key,
	nome varchar
);

create table telefone_aluno(

	codigo integer primary key,
	numero varchar (50),
	ra_aluno integer,
	constraint fk_aluno foreign key(ra_aluno) references aluno(ra)
);

create table itens_aluno_disciplina(

	codigo integer,
	ra_aluno integer,
	codigo_disc integer,
	constraint pk_alu_disc primary key(codigo),
	constraint fk_ra_alu foreign key (ra_aluno) references aluno(ra),
	constraint fk_disc foreign key (codigo_disc) references disciplina(codigo)
);




