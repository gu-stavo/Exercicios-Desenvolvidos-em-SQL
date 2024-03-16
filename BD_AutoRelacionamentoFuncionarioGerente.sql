create table funcionario(

	cpf varchar(11) primary key,
	nome char(50),
	endereco varchar(50),
	cpf_gerente varchar(11) references funcionario(cpf)
);

insert into funcionario(cpf,nome,endereco,cpf_gerente)values('12232156499','Porpério da Silva','Centro','12232156499');
insert into funcionario(cpf,nome,endereco,cpf_gerente)values('89754123659','Catibirina Joséfa','Rua 6','12232156499');
insert into funcionario(cpf,nome,endereco,cpf_gerente)values('55698412378','Teresinha de Jesus','Rua 88','12232156499');
select * from funcionario;

update funcionario set cpf_gerente = null where cpf_gerente = '12232156499';
update funcionario set cpf = '88888888888' where nome = 'Porpério da Silva';
update funcionario set cpf_gerente = '88888888888';

