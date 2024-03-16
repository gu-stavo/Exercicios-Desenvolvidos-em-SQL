create table produto(

	codigo serial primary key,
	marca varchar(50),
	fabricante varchar(50),
	nome varchar(50)
);

insert into produto(marca, fabricante,nome)values('Samsung','Samsung','Galaxy S23'),('Steam','Valve','SteamDeck');
select * from produto;

create table caminhao(

	codigo serial primary key,
	ano integer,
	modelo varchar(50),
	marca varchar(50),
	capacidade numeric
);

insert into caminhao(ano,modelo,marca,capacidade)values(2020,'Bitrem','Volvo','600.50'),(1990,'Truck','Mercedes','153.9');
select * from caminhao;

create table itens_caminhao_produto(

	codigo serial primary key,
	codigo_caminho integer references caminhao(codigo),
	codigo_produto integer references produto(codigo),
	data_transporte date
	
);

insert into itens_caminhao_produto(codigo_caminho,codigo_produto,data_transporte)values(1,2,'2023-06-06'),(2,1,'2023-08-09');
select * from itens_caminhao_produto;

create table motorista(

	codigo serial,
	nome varchar(50),
	rg varchar(20),
	idade integer,
	endereco varchar(50),
	constraint pk_cod primary key (codigo)
);

insert into motorista(nome,rg,idade,endereco)values('Joao da Silva','98.989.988-09',56,'Rua 2 - Jales');
insert into motorista(nome,rg,idade,endereco)values('Jair Fonseca','78.185.900-19',24,'Rua 12 - Urania');

select * from motorista;

create table itens_caminhao_moto(

	codigo serial primary key,
	codigo_caminhao integer references caminhao(codigo),
	codigo_moto integer references motorista(codigo),
	data_viagem date
);

insert into itens_caminhao_moto(codigo_caminhao,codigo_moto,data_viagem)values(1,1,'2023-06-06'),(2,2,'2023-08-09');
select * from itens_caminhao_moto;

