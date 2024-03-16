create table cliente(

	codigo integer primary key,
	nome varchar(50),
	rg varchar(20),
	endereco varchar(50),
	telefone varchar(20)
);


create table quarto(

	numero integer primary key,
	andar integer,
	qtd_leitos integer
);

create table itens_cliente_quarto(

	codigo integer,
	codigo_cliente integer,
	numero_quarto integer,
	consumo varchar(100),
	data_hospedagem date,
	constraint pk_itens_c_q primary key (codigo),
	constraint fk_cliente foreign key(codigo_cliente) references cliente(codigo),
	constraint fk_quarto foreign key(numero_quarto) references quarto(numero)
);

insert into cliente(codigo,nome,rg,endereco,telefone)values(1,'José Pereira','76.987.727-98','Rua 10 - Jales','(17)8788-0905');
insert into cliente(codigo,nome,rg,endereco,telefone)values(2,'Maria Joaquina','89.907.727-98','Rua 05 - Urania','(17)9780-1900');

select * from cliente;

insert into quarto(numero,andar,qtd_leitos)values(10,1,2),(30,3,8);
select * from quarto;

insert into itens_cliente_quarto(codigo,codigo_cliente,numero_quarto,consumo,data_hospedagem)values(1,1,10,'1 - Refrigerante','2023-02-01');
insert into itens_cliente_quarto(codigo,codigo_cliente,numero_quarto,consumo,data_hospedagem)values(2,2,30,'1 - Paçoca','2023-05-22');

select * from itens_cliente_quarto;