create table automoveis(

	codigo serial primary key,
	chassi varchar(50),
	ano integer,
	modelo varchar(50)
);

create table carros_passeio(

	codigo serial primary key,
	numeros_portas integer,
	cor varchar(50),
	codigo_automoveis integer references automoveis(codigo)
);

create table caminhoes(

	codigo serial primary key,
	numeros_carretas integer,
	peso_permitido numeric,
	codigo_automoveis integer references automoveis(codigo)
);

create table onibus(

	codigo serial primary key,
	qtd_assentos integer,
	tipo varchar(50),
	codigo_automoveis integer references automoveis(codigo)
);