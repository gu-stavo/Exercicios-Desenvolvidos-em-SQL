create table venda(

	id serial primary key,
	data_venda date,
	quantidade integer
);

insert into venda(data_venda,quantidade)values('2022-09-11',6);

select * from venda;


create table produto(

	id serial primary key,
	nome varchar(50),
	preco numeric
);

insert into produto(nome,preco)values('pastel',2.5);
insert into produto(nome,preco)values('Coca-cola',4);
insert into produto(nome,preco)values('Paçoca',2);
select * from produto;

create table itens_venda_produto(

	id serial primary key,
	id_venda integer references venda(id),
	id_produto integer references produto(id)
);

insert into itens_venda_produto(id_venda,id_produto)values(1,1);
insert into itens_venda_produto(id_venda,id_produto)values(1,2);
insert into itens_venda_produto(id_venda,id_produto)values(1,3);

select * from itens_venda_produto;

create table itens_venda_produto2(

	id_venda integer,
	id_produto integer,
	constraint pk_ivp primary key(id_Venda,id_produto)
);

insert into itens_venda_produto2(id_venda,id_produto)values(1,1);
insert into itens_venda_produto2(id_venda,id_produto)values(1,2);
insert into itens_venda_produto2(id_venda,id_produto)values(1,3);
select * from itens_venda_produto2;

/* DÁ ERRO PQ OS VALORES NÃO SÃO UNICOS, give wrong because the values are not uniques: insert into itens_venda_produto2(id_venda,id_produto)values(1,2); */

create table itens_venda_produto3(

	id_venda integer references venda(id),
	id_produto integer references produto(id),
	constraint pk_ivpr primary key(id_Venda,id_produto)
);

insert into itens_venda_produto3(id_venda,id_produto)values(1,1);
select * from itens_venda_produto3;

drop table itens_venda_produto3;

select nome,preco from produto order by nome;
select nome,preco from produto order by preco;

select * from produto where preco >= 4;
select * from produto where preco <= 3;
select * from produto where preco = 4;
select * from produto where preco != 4;

select nome from produto where preco != 4 order by nome;
/*order by sempre fica no final do codigo*/