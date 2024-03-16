create table soldado(

	rm integer primary key,
	nome varchar(50),
	data_nasc date
);

insert into soldado(rm,nome,data_nasc)values(1, 'João da Silva', '2002-02-18');
insert into soldado(rm,nome,data_nasc)values(2, 'Amanda Pereira', '2012-09-20');
select * from soldado;


create table arma(

	serie integer,
	registro integer,
	calibre integer,
	rm_soldado integer,
	constraint pk_arma primary key(serie),
	constraint fk_soldado foreign key(rm_soldado) references soldado(rm)
);

insert into arma(serie,registro,calibre,rm_soldado)values(14, 456, 123456,1);
insert into arma(serie,registro,calibre,rm_soldado)values(23, 789, 567984,2);
select * from arma;

create table itens_soldado_arma(

	codigo integer primary key,
	rm_soldado integer references soldado(rm),
	serie_arma integer references arma(serie)
);

insert into itens_soldado_arma(codigo,rm_soldado,serie_arma)values(1,1,14);
insert into itens_soldado_arma(codigo,rm_soldado,serie_arma)values(2,1,23);

select * from itens_soldado_arma;

select rm,nome from soldado;

delete from itens_soldado_arma where serie_arma = 14;
delete from itens_soldado_arma where rm_soldado = 1;
delete from arma where serie = 14;
delete from soldado where rm = 1;


update soldado set data_nasc = '2001-12-01' where rm = 2;
update soldado set nome = 'Apolinario da Silva', data_nasc = '1965-01-01' where rm = 2;

insert into soldado(rm,nome,data_nasc)values(3, 'João da Silva', '2002-02-18');
insert into soldado(rm,nome,data_nasc)values(4, 'Amanda Pereira', '2012-09-20');
select * from soldado;