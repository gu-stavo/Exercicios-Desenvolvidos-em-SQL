/*1) Selecione os clientes que compraram o produto Queijo;*/
select * from cliente;
select * from produto;
select * from item_do_pedido;
select * from pedido;
select nome_cliente from cliente where codigo_cliente in 
	(select codigo_cliente from pedido where num_pedido in 
    (select num_pedido from item_do_pedido where codigo_produto in
    (select codigo_produto from produto where descricao_produto = 'Queijo')));

/*2) Crie um subselect que retorne todos os vendedores que não participaram de uma venda;*/
select * from vendedor;
select nome_vendedor from vendedor where codigo_vendedor in 
	(select codigo_vendedor from pedido group by codigo_vendedor having count(codigo_vendedor) = 0);

/*3) Traga dados de venda do produto Chocolate;*/
select * from produto where descricao_produto = 'Chocolate';
select * from item_do_pedido where codigo_produto in 
	(select codigo_produto from produto where descricao_produto = 'Chocolate');
	
/*4) Calcule a média dos valores totais de venda para o Cliente Jorge*/
select avg(quantidade) as media_jorge from item_do_pedido where num_pedido in
	(select num_pedido from pedido where codigo_cliente in
	(select codigo_cliente from cliente where nome_cliente = 'Jorge'));

/*5) Calcule o maior valor vendido pelo vendedor Carlos;*/
select max(quantidade) as quantidade_max from item_do_pedido where num_pedido in
	(select num_pedido from pedido where codigo_vendedor in
	(select codigo_vendedor from vendedor where nome_vendedor = 'Carlos'));