select * from cliente;
select * from vendedor;
select * from item_do_pedido;
select * from pedido;

-- 1. Selecione os campos nome do cliente, endereço e estado de todos os clientes.
select nome_cliente, endereco, uf from cliente;

-- 2. Liste todos os vendedores.
select nome_vendedor from vendedor;

-- 3. Liste os campos código do produto e quantidade da tabela Item do Pedido.
select codigo_produto, quantidade from item_do_pedido;

-- 4. Liste o campo “código do cliente” da tabela pedidos e elimine as linhas duplicadas.
select distinct codigo_cliente from pedido;
-- select distinct: Não mostra as linhas duplicadas, apenas uma linha com esse valor

/* 5. Selecione os campos código do produto, descrição do produto e valor unitário e altere a
linha de cabeçalho dos campos selecionados.*/ -- linha cabeçalho: nome da coluna/campo
select * from produto;
select codigo_produto, descricao_produto, val_unit from produto;
select codigo_produto as codigo, descricao_produto as nome, val_unit as valor from produto;
-- Essa alteração não é permanente e sim só visual.

/*6. Faça uma consulta que mostre o nome do cliente e estado e altere a linha de cabeçalho
dos campos selecionados.*/
select nome_cliente as nome, uf as estado from cliente;

--7. Quais são as cidades que a empresa possui clientes?
select cidade from cliente;

--8. Liste da tabela produto o campo Descrição e faça o produto do campo valor unitário por 1,3.
select descricao_produto, val_unit * 1.3 as multiplicado from produto;

/*9. Elabore uma consulta que mostre o código do cliente e mostre o prazo de entrega
prorrogado por mais 3 dias da tabela pedido.*/
select codigo_cliente, prazo_entrega + 3 as entrega_prorrogado from pedido;
select * from pedido;

/* 10. Liste o nome do vendedor e faixa de comissão dos vendedores que possuem o salário
fixo maior que R$ 4.000,00.*/
select nome_vendedor, faixa_comissao from vendedor where salario_fixo > 4000.00;

-- 11. Selecione os produtos cuja unidade do produto seja igual a kg.
select * from produto;
select descricao_produto from produto where unidade = 'Kg';

/*12. Faça uma consulta que mostre o nome do cliente e a cidade quando o estado for igual a
SP ou cidade igual a Londrina da tabela cliente.*/
select nome_cliente, cidade from cliente where uf = 'SP' or cidade = 'Londrina';

/*13. Elabore uma consulta que mostre o número do pedido e o prazo de entrega dos pedidos
que tiverem o código do cliente igual a 720 e o código do vendedor igual a 101.*/
select num_pedido, prazo_entrega from pedido where codigo_cliente = 720 and codigo_vendedor = 101;

/*14. Selecione da tabela item do pedido o campo número do pedido quando a quantidade for
maior igual a 30 e elimine as linhas duplicadas.*/
select distinct num_pedido from item_do_pedido where quantidade >= 30;

-- 15. Liste todos os vendedores, exceto os que possuem a faixa de comissão igual a ‘C’.
select nome_vendedor from vendedor where faixa_comissao != 'C';

/*16. Liste as descrições de todos os produtos, exceto os que possuem a unidade o produto igual
a ‘M’.*/
select descricao_produto from produto where unidade != 'M';

/*17. Crie uma consulta que mostre os nomes dos vendedores que possuem o Salário Fixo na
faixa de R$ 1.000,00 até R$ 3.000,00.*/
select nome_vendedor from vendedor where salario_fixo >= 1000.00 and salario_fixo <= 3000.00;

/*18. Selecione os campos número dos pedidos e prazo de entrega de todos os pedidos que
possuem o prazo de entrega que esteja entre 15 a 25 dias*/
select num_pedido, prazo_entrega from pedido where prazo_entrega >= 15 and prazo_entrega <= 25;
-- smallint, integer, longint

-- 19. Localizem os registros de vendedores que não comecem com a letra ‘J’.
select * from vendedor where nome_vendedor not like 'J%';

--20. Localizem os registros de clientes cujos nomes contenham as letras ‘io’. 
select * from cliente where nome_cliente like '%io%';

--21. Selecionem os nomes dos clientes que comecem com letra ‘A’ até a letra ‘F’
select nome_cliente from cliente where nome_cliente >= 'A%' and nome_cliente <='F%';
select nome_cliente from cliente where nome_cliente between 'A%' and 'F%';
select nome_cliente from cliente where nome_cliente between 'A%' and 'G%';
SELECT nome_cliente FROM cliente WHERE nome_cliente >= 'A' AND nome_cliente < 'G';

/*22. Mostre a descrição dos produtos quando a unidade do produto não seja igual a ‘M’ e 
‘Kg’.*/
select descricao_produto, unidade from produto where unidade != 'Kg' and unidade != 'M';
select * from produto;

--23. Selecionem os vendedores que não possuem a faixa de comissão.
select * from vendedor where faixa_comissao is null;

/*24. Listem os clientes que possuem Inscrição Estadual, ou seja, Inscrição Estadual não 
nula.*/
select * from cliente where ie is not null;

--25. Crie uma consulta que exiba os clientes ordenados pelo nome do cliente.
select * from cliente order by nome_cliente;

/*26. Faça uma consulta da tabela vendedor que mostre nome do vendedor e o salário fixo 
dos vendedores ordenados pelo nome do vendedor.*/
select nome_vendedor,salario_fixo from vendedor order by nome_vendedor;

/*27. Mostre o nome do cliente e o endereço dos clientes do estado de SP ordenados pelo 
código do cliente.*/
select codigo_cliente,nome_cliente,endereco from cliente order by codigo_cliente;

/*28. Selecione o número do pedido dos pedidos que possuem o prazo de entrega igual a 20 
dias classificado em ordem decrescente pelo número do pedido.*/
select num_pedido, prazo_entrega from pedido where prazo_entrega = 20 order by num_pedido desc;

/*29. Listem as faixas de comissões, os nomes e os códigos dos vendedores ordenados pela 
faixa de comissão e pelo nome do vendedor.*/
select faixa_comissao,nome_vendedor, codigo_vendedor from vendedor order by faixa_comissao,nome_vendedor;

/*30. Realize uma consulta que exiba os estados e os nomes dos clientes que comecem com a 
letra ‘P’ até a letra ‘Z’, classificados por estado e nome.*/
select uf, nome_cliente from cliente where nome_cliente between 'P%' and 'Z%' order by uf,nome_cliente;

--31. Mostre o produto que possui o menor e o maior preço.
select MIN(val_unit), MAX(val_unit)from produto;

--32. Façam a média e a soma do salário fixo dos vendedores
select avg(salario_fixo),sum(salario_fixo) from vendedor;

--33. Encontre a quantidade de clientes que não possuem a Inscrição Estadual nula.
select count(nome_cliente) from cliente where ie is not null;

/*34. Exiba o maior valor e a soma do salário fixo dos vendedores que possuem a faixa de 
comissão ‘A’.*/
select max(salario_fixo),sum(salario_fixo) from vendedor where faixa_comissao = 'A';

/*35. Mostre a quantidade total pedida, para o produto ‘papel’ de código ‘77’ na tabela item 
do pedido.*/
select sum(quantidade) from item_do_pedido where codigo_produto = 77;

--36. Quantos produtos possuem um valor unitário menor que R$ 2,00.
select count(descricao_produto) from produto where val_unit < 2;

--37. Liste a quantidade clientes que cada estado contém.
select * from cliente order by uf;
select count(*) from cliente;  -- Conta todos os registros
select uf,count(*) from cliente group by uf; -- agrupa registros. Pegar um coletivo. agrupa os valores iguais de um campo.

/*38. Exiba a quantidade de vendedores e a soma do salário fixo agrupados pela faixa de 
comissão.*/
select faixa_comissao,count(*),sum(salario_fixo) from vendedor group by faixa_comissao order by faixa_comissao;
select count(*) from vendedor;

--39. Mostre a soma do valor unitário da tabela produto, agrupados pela unidade.
select unidade, sum(val_unit) from produto group by unidade;

/*40. Liste a quantidade de pedidos que tem o prazo de entrega maior que 7, agrupados pelo 
código do vendedor.*/
select codigo_vendedor,count(*) from pedido where prazo_entrega > 7 group by codigo_vendedor;

/*41. Exiba a quantidade de clientes que cada estado contém, menos os clientes do estado de 
SP*/
select uf,count(*) from cliente where uf != 'SP' group by uf;
select count(*) from cliente where uf not like 'SP' group by uf;

/*42. Selecione os pedidos que têm mais do que 3 produtos na tabela item do pedido.*/
select num_pedido from item_do_pedido group by num_pedido having count(codigo_produto) > 3;
select * from item_do_pedido where quantidade > 3 ;

/*43. Liste da tabela item do pedido os produtos que contenha a soma das quantidades maior 
igual a 50.*/
select codigo_produto from item_do_pedido group by codigo_produto having sum(quantidade) >= 50;

/*44. Mostre as unidades dos produtos cuja média do valor unitário agrupados pela unidade seja 
menor que R$ 1,50.*/
select unidade, avg(val_unit) from produto group by unidade having AVG(val_unit) < 1.50;
select unidade,avg(val_unit) from produto where val_unit < 1.5 group by unidade;

select codigo_cliente, sum(prazo_entrega) from pedido group by codigo_cliente
having sum(prazo_entrega) > 15;

/*43. Liste da tabela item do pedido os produtos que contenha a soma das quantidades maior 
igual a 50.*/
select * from item_do_pedido;
select codigo_produto, sum(quantidade) from item_do_pedido group by codigo_produto
having sum(quantidade) > 50;

/*45. Selecione o nome e a cidade dos clientes que possui o pedido com o prazo de entrega 
superiores a 25 dias.*/
select cliente.nome_cliente, cliente.cidade, pedido.prazo_entrega from cliente
	inner join pedido on cliente.codigo_cliente = pedido.codigo_cliente
	where pedido.prazo_entrega > 25;

/*46. Apresente a descrição, a unidade e a quantidade dos produtos pedidos que possuem a 
quantidade maior do que 40.*/
select produto.descricao_produto,produto.unidade, item_do_pedido.quantidade as quantidade_realizada 
	from produto inner join item_do_pedido
	on produto.codigo_produto = item_do_pedido.codigo_produto
	where item_do_pedido.quantidade > 40;

select pr.descricao_produto,pr.unidade, ip.quantidade as quantidade_realizada 
	from produto as pr inner join item_do_pedido as ip
	on pr.codigo_produto = ip.codigo_produto
	where ip.quantidade > 40;
	
--Exemplos do uso do join
select * from cliente inner join pedido
	on cliente.codigo_cliente = pedido.codigo_cliente;
	
select cliente.nome_cliente,sum(pedido.prazo_entrega) from cliente inner join pedido
	on cliente.codigo_cliente = pedido.codigo_cliente
	group by cliente.nome_cliente
	having sum(pedido.prazo_entrega) > 50
	order by cliente.nome_cliente;
	