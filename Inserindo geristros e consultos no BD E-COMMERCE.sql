-- Inserindo registros ao modelo E-Commerce criado e realizando queries de verificações e especificações
use ecommerce;

-- Inserindo registros para a tabela Cliente:
INSERT INTO Cliente VALUES 
    (1, 'João', 'S.', 'Silva', '12345678901', 'Rua A, 123', '1990-05-15'),
    (2, 'Maria', 'F.', 'Souza', '98765432101', 'Avenida B, 456', '1988-11-22'),
    (3, 'Pedro', 'L.', 'Pereira', '45678912301', 'Praça C, 789', '1995-07-10'),
    (4, 'Ana', 'M.', 'Monteiro', '32165498701', 'Estrada D, 1010', '1985-09-30'),
    (5, 'Carlos', 'R.', 'Ribeiro', '78945612301', 'Alameda E, 555', '2000-02-05');

-- Inserindo registros para a tabela Estoque:
INSERT INTO Estoque VALUES 
    (1, 'Depósito A', 100),
    (2, 'Depósito B', 50),
    (3, 'Depósito C', 200),
    (4, 'Depósito D', 75),
    (5, 'Depósito E', 120);

-- Inserindo registros para a tabela Produto:
INSERT INTO Produto VALUES
    (1, 'Celular', 1, NULL, 'Eletrônico', 1500.00, 'Smartphone com câmera de alta resolução', 4, 'Disponível', '15 x 7 cm'),
    (2, 'Camiseta', 0, NULL, 'Roupas', 50.00, 'Camiseta de algodão unissex', 5, 'Indisponível', 'P'),
    (3, 'Bola de Futebol', 1, NULL, 'Brinquedos', 40.00, 'Bola de futebol tamanho oficial', 4, 'Disponível', 'Oficial'),
    (4, 'Arroz', 0, NULL, 'Alimentos', 20.00, 'Pacote de arroz de 1kg', 5, 'Indisponível', '1 kg'),
    (5, 'Sofá', 0, NULL, 'Móveis', 1200.00, 'Sofá de 3 lugares com tecido estofado', 4, 'Disponível', '210 x 90 cm');

-- Inserindo registros para a tabela Pagamento:
INSERT INTO Pagamento VALUES
    (1, 1001, 'Cartão', 500.00),
    (2, 1002, 'Boleto', 200.00),
    (3, 1003, 'Dois cartões', 1000.00),
    (4, 1004, 'Cartão', 300.00),
    (5, 1005, 'Boleto', 150.00);

-- Inserindo registros para a tabela Pedido:
INSERT INTO Pedido VALUES
    (1001, 1, 'Confirmado', 'Pedido de roupas', 25.999, 1),
    (1002, 2, 'Em Processamento', 'Pedido de eletrônicos', 15.005, 0),
    (1003, 3, 'Cancelado', 'Pedido de brinquedos', 20.00, 1),
    (1004, 4, 'Confirmado', 'Pedido de alimentos', 30.00, 1),
    (1005, 5, 'Em Processamento', 'Pedido de móveis', 50.00, 0);

-- Inserindo registros para a tabela Fornecedor:
INSERT INTO Fornecedor VALUES
    (1, 'Fornecedor A', '12345678901234', 'Contato A'),
    (2, 'Fornecedor B', '98765432109876', 'Contato B'),
    (3, 'Fornecedor C', '54321678905678', 'Contato C'),
    (4, 'Fornecedor D', '87654321098765', 'Contato D'),
    (5, 'Fornecedor E', '56789043215678', 'Contato E');

-- Inserindo registros para a tabela Vendedor:
INSERT INTO Vendedor VALUES
    (1,'Empresa A', '12345678901234', '12345678901', 'Vendedor A', 'Endereço 1'),
    (2,'Empresa B', '98765432109876', '98765432101', 'Vendedor B', 'Endereço 2'),
    (3,'Empresa C', '54321678905678', '45678912301', 'Vendedor C', 'Endereço 3'),
    (4,'Empresa D', '87654321098765', '32165498701', 'Vendedor D', 'Endereço 4'),
    (5,'Empresa E', '56789043215678', '78945612301', 'Vendedor E', 'Endereço 5');

-- Inserindo registros para a tabela PVendedor:
INSERT INTO PVendedor VALUES
    (1, 1, 5),
    (1, 2, 3),
    (2, 3, 2),
    (3, 1, 4),
    (4, 4, 6);

-- Inserindo registros para a tabela PPedido:
INSERT INTO PPedido VALUES
    (1001, 1, 2, 'Disponível'),
    (1001, 2, 1, NULL),
    (1002, 3, 3, 'Disponível'),
    (1003, 2, 2, 'Indisponível'),
    (1004, 4, 1, 'Indisponível');

-- Inserindo registros para a tabela ProdutoEmEstoque:
INSERT INTO ProdutoEmEstoque VALUES
    (1, 1, 10, 'Prateleira A'),
    (2, 2, 5, 'Prateleira B'),
    (3, 3, 20, 'Prateleira C'),
    (4, 4, 15, 'Prateleira D'),
    (5, 5, 8, 'Prateleira E');

-- mostrando a quantidade de Produtos do Vendedor:
select * from PVendedor;

-- mostrando quantos Clientes:
select count(*) from Cliente;

-- mostrando uma mesclagem das tabelas Clientes e Pedidos concatenando o nome e truncando valores:
select concat(Primeiro_Nome, ' ', Inicial_do_Nome_do_Meio, ' ', Sobrenome) as Nome_Completo, 
	idCliente, 
    CPF, 
    Endereço, 
    Data_de_Nascimento, 
    idPedido, 
    idClientePedido, 
    StatusdoPedido, 
    DescriçãoPedido,
    round(Frete, 2) as Frete, 
    Pagamento 
from Cliente c, Pedido p 
where c.idCliente = p.idClientePedido;

-- mostrando todas as colunas das tabelas Clientes e Pedidos:
select * from Cliente c, Pedido p where c.idCliente = idClientePedido;
 
-- mostrando informações dos produtos e das compras:
select distinct 
	Nome_do_Produto, 
    Categoria, 
    Valor, 
    Descrição, 
    Disponibilidade, 
    TipodePagamento,
    StatusdoPedido,
    DescriçãoPedido,
    round(Frete,2) as Frete,
    Pagamento
from
    Produto p
join 
    PPedido pp on p.idProduto = pp.idPProduto
join
    Pedido pe on pp.idPPedido = pe.idPedido
join 
    Pagamento pg on pe.idClientePedido = pg.idClientePagamento;

-- mostrando informações dos produtos e das compras ordenando pelo Frete:
select distinct 
    Nome_do_Produto, 
    p.categoria, 
    p.valor, 
    p.descrição, 
    p.disponibilidade, 
    pg.tipodepagamento as Tipo_de_Pagamento,
    pe.statusdopedido as Status_do_Pedido,
    pe.descriçãopedido as Descrição_do_Pedido,
    round(pe.frete, 2) Frete,
    pe.pagamento
from 
    produto p
inner join 
    ppedido pp on p.idproduto = pp.idpproduto
inner join 
    pedido pe on pp.idppedido = pe.idpedido
inner join 
    pagamento pg on pe.idclientepedido = pg.idclientepagamento
order by 
	Frete;

-- Mostrando quantos pedidos cada cliente fez:
select c.idCliente, c.Primeiro_Nome, count(*) 
from 
	Cliente c 
inner join  
	Pedido p on p.idClientePedido = c.idCliente
group by 
	c.idCliente;
