create table cliente(
	codigo serial primary key,
	nome varchar(50),
	idade integer,
	email varchar(50),
	peso numeric,
	telefone varchar(20)

);

insert into cliente(codigo,nome,idade,email,peso,telefone)
	values(20,'João da Silva',22,'joaozinho@gemail.com',76.8,'(17)98988-7878');
insert into cliente(nome,idade,email,peso,telefone)
	values('Maria Pereira',10,'mariazinha@gemail.com',40.2,'(17)98000-0808');

create table venda(
	codigo serial primary key,
	descricao varchar(100),
	data_venda date,
	valor numeric,
	codigo_cliente integer references cliente(codigo)
);

insert into venda(descricao,data_venda,valor,codigo_cliente)
	values('5 pacotes de arroz','2023-09-01',150.80,1),
	      ('18 caixar de cerveja','2022-12-25',555,20);

select * from cliente;
select * from venda;


/*inserir nova coluna na estrutura da tabela*/

alter table cliente add column data_nascimento date;
alter table cliente add column cpf varchar(20);

/*atualizar um registro*/

update cliente set data_nascimento = '2001-09-09'
	where codigo = 20;

update cliente set codigo = 2 where nome='Pedro Henrique';

update cliente set data_nascimento = '2013-05-12'
	where codigo = 1;

update cliente set nome = 'Pedro Henrique', email = 'pedroca@gemail.com', peso = 65.5
	where codigo = 20;

update cliente set cpf = '828.988.989-28' where codigo =20;
update cliente set cpf = '912.998.098-99' where codigo =1;

/*excluir uma coluna da estrutura da tabela*/

alter table cliente drop column telefone;

/*excluir o tipo primary key*/
update venda set codigo_cliente = null;
alter table cliente drop constraint cliente_pkey cascade;

/*alterar o tipo de uma coluna*/

alter table cliente alter column email type char(50);

alter table cliente alter column peso type integer;

/*inserir uma chave primaria*/
alter table cliente add constraint pk_cliente primary key(cpf);