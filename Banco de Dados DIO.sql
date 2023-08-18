create database ecommerce;
use ecommerce;

-- Tabela Cliente

create table cliente(
				idCliente int auto_increment primary key,
				Fname varchar(10),
                Minit char(10),
                Lname varchar(20),
                CPF char(11) not null,
                Adress varchar(30),
                constraint unique_cpf_client unique (CPF)
);

-- Tabela Produto

create table product(
				idProdcut int auto_increment primary key,
				Pname varchar(10) not null,
                classification_kids bool default false,
                category enum('Eletronico','Vestimenta','Brinquedos','Alimentos','Moveis') not null,
                avaliação float default 0,
                size varchar(10),
                constraint unique_cpf_client unique (CPF)
		
);

create table pedido(
			 idOrder int auto_increment primary key,
             idOrderClient int,
             orderStatus enum('Cancelado','Confirmado','Em Processamento') default 'Em Processamento',
             orderDescription varchar(255),
             sendValue float default 15,
             constraint fk_orders_client foreign key(idOrderClient) references clients(idCliente) 
);

create table pedidoStorage(
				idProdStorage int auto_increment primary key,
                storageLocation varchar(255),
                quantity int default 0

);

create table supplier (
				idSupplier int auto_increment primary key,
                SocialName varchar(255) not null,
                CNPJ char(15) not null,
                contact char(11) not null,
                constraint unique_supplier unique (CNPJ)

);

create table seller(
		idSeller int auto_increment primary key,
        SocialName varchar(255) not null,
        AbstName varchar(255),
        CNPJ char(15),
        CPF char(9),
        location varchar(255),
        contact char(11) not null,
        constraint unique_cnpj_seller unique (CNPJ),
        constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
				idPseller int,
                idProduct int, 
                Quantity int default 1,
                primary key (idPseller, idProduct),
                constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
                constraint fk_product_product foreign key (idProduct) references product(idProduct)
                
);

create table productOrder(
				idPOproduct int,
                idPOorder int,
                poQuantity int default 1,
                poStatus enum('Disponivel','Sem estoque') default 'Disponivel',
                primary key (idPOproduct, idPOorder),
                constraint fk_produc_seller foreign key (idPOproduct) references product(idProduct),
                constraint fk_product_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
				idLproduct int,
                idLstorage int,
                location varchar(255) not null,
                primary key (idLproduct, idLstorage),
                constraint fk_produc_seller foreign key (idLproduct) references product(idProduct),
                constraint fk_product_product foreign key (idLstorage) references productStorage(idProdStorage)
);

show tables;

show databases;

-- Recuperar todos os clientes

SELECT * FROM cliente;


-- Recuperar todos os produtos

SELECT * FROM product;




-- Criando filtros com where Statement

-- Recuperar pedidos de um cliente especifico

SELECT * FROM pedido WHERE idCliente = 123;


-- Recuperar produtos com preço acima de um valor específico

SELECT * FROM product WHERE sendValue > 50.00;




-- Expressões para gerar atributos derivados
# Ordenações dos dados com ORDER BY

# Recuperar os produtos ordenados por preço

SELECT * FROM produto ORDER BY sendValue DESC;
