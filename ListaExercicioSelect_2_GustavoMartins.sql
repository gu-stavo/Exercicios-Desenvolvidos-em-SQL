/*54.Selecionem os códigos e os nomes dos clientes, e seus respectivos prazos de entrega 
dos pedidos de todos os clientes que fizeram ou não pedidos.*/
select * from pedido;
select * from cliente;
select cliente.codigo_cliente,cliente.nome_cliente,pedido.prazo_entrega 
	from cliente inner join pedido 
	on pedido.codigo_cliente = cliente.codigo_cliente;

/*55.Crie  uma  consulta  que  liste  o  código,  o  nome  e  o  número  do  pedido  
que foram realizados por todos os vendedores.*/
select * from pedido;
select * from vendedor;
select pedido.codigo_vendedor,vendedor.nome_vendedor,
	pedido.num_pedido from pedido inner join vendedor
	on pedido.codigo_vendedor = vendedor.codigo_vendedor;
	
/*56.Relacionem  todos  os  produtos  que  participaram ou  não  de algum  pedido.
(Liste  o  código  e  o nome  do  produto,  o  número  do  pedido  e  a 
quantidade vendida).*/
select * from produto;
select * from item_do_pedido;
select produto.codigo_produto,produto.descricao_produto,item_do_pedido.num_pedido, 
	quantidade * val_unit as Total_vendida
	from produto inner join item_do_pedido on  produto.codigo_produto = item_do_pedido.codigo_produto;

/*57.Selecione  os  nomes  dos  clientes  de  qualquer  pedido  cujo  prazo  de  entrega seja maior 
do que 25 dias. (resolva utilizando subconsultas)*/
select * from cliente;
select * from pedido;
select cliente.nome_cliente from cliente inner join pedido 
	on cliente.codigo_cliente = pedido.codigo_cliente where pedido.prazo_entrega > 25;
	
/*58.Liste os clientes que não fizeram nenhum pedido.*/
select cliente.nome_cliente from cliente full outer join pedido 
	on cliente.codigo_cliente = pedido.codigo_cliente where pedido.num_pedido is null;
	
/*59.Selecione  a  descrição  dos  produtos  que  possuem  o  valor  unitário  abaixo  da média.*/
select * from produto;
select descricao_produto,val_unit from produto where val_unit < (select avg(val_unit) from produto);

/*60.Encontre  os  códigos  dos  clientes  que  possuem  o  prazo  de  entrega  acima  da média.
61.Encontre  os  nomes  dos  clientes  que  possuem  o  prazo  de  entrega  acima  da média.*/
select * from cliente;
select cliente.codigo_cliente, cliente.nome_cliente from cliente inner join pedido 
	on cliente.codigo_cliente = pedido.codigo_cliente
	where pedido.prazo_entrega > (select avg(pedido.prazo_entrega) from pedido);
	
/*62.Selecione a descrição do produto que teve a maior quantidade pedida.*/
select * from produto;
select * from item_do_pedido;
select produto.codigo_produto,produto.descricao_produto,max(item_do_pedido.quantidade) 
	from produto inner join item_do_pedido
	on produto.codigo_produto = item_do_pedido.codigo_produto 
	group by produto.codigo_produto,item_do_pedido.quantidade
	having item_do_pedido.quantidade in (select max(item_do_pedido.quantidade) from item_do_pedido);
	
/*63.Exiba  os  nomes  dos  clientes  que  fizeram  pedidos  cuja  quantidade  do  item pedido 
seja maior que sua média.*/
select * from cliente;
select * from item_do_pedido;
select cliente.nome_cliente,sum(item_do_pedido.quantidade) from cliente inner join pedido
	on cliente.codigo_cliente = pedido.codigo_cliente inner join item_do_pedido
	on pedido.num_pedido = item_do_pedido.num_pedido
	where  item_do_pedido.quantidade > (select avg(item_do_pedido.quantidade) from item_do_pedido)
	group by cliente.nome_cliente;
select avg(item_do_pedido.quantidade) from item_do_pedido;

									  
	