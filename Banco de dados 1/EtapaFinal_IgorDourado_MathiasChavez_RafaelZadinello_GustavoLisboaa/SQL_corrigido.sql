/* : Igor Dourado 19204004-4, Mathias Chavez 19204076-4, Gustavo Lisboa 20103003-8 e Rafael Zadinello 20104962-4 */

drop table produtos cascade CONSTRAINTS;
drop table produtos_pedidos cascade CONSTRAINTS;
drop table clientes cascade CONSTRAINTS;
drop table pedidos cascade CONSTRAINTS;
drop table entregador cascade CONSTRAINTS;
drop table funcionarios cascade CONSTRAINTS;
drop table garcom cascade CONSTRAINTS;
drop table tipodecliente cascade CONSTRAINTS;



CREATE TABLE Clientes (
    nome VARCHAR(70) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    cpf VARCHAR(20) PRIMARY KEY,
    telefone NUMBER(17) NOT NULL UNIQUE,
    categoria VARCHAR(25) NOT NULL
);

CREATE TABLE TipoDeCliente (
    categoria VARCHAR(25) PRIMARY KEY
);

CREATE TABLE Produtos (
    nome_consumivel VARCHAR(70) PRIMARY KEY,
    preco NUMBER(5) NOT NULL
);

CREATE TABLE Pedidos (
    entrega VARCHAR(10) NOT NULL,
    preco_do_pedido NUMBER(17) NOT NULL,
    codigo_do_pedido NUMBER(17) PRIMARY KEY,
    desconto NUMBER(17),
    cpf VARCHAR(20),
    lista_produtos VARCHAR(200) NOT NULL,
    codigo_do_funcionario NUMBER(17) NOT NULL,
    forma_de_pagamento VARCHAR(70) NOT NULL
);

CREATE TABLE Funcionarios (
    nome_do_funcionario VARCHAR(200) NOT NULL,
    cargo VARCHAR(70) NOT NULL,
    codigo_do_funcionario NUMBER(17) PRIMARY KEY
);

CREATE TABLE Garcom (
    codigo_do_funcionario NUMBER(17) PRIMARY KEY,
    internoOuExterno VARCHAR(20) NOT NULL
);

CREATE TABLE Entregador (
    codigo_da_area NUMBER(17) NOT NULL UNIQUE,
    codigo_do_funcionario NUMBER(17) PRIMARY KEY
);

CREATE TABLE Produtos_pedidos (
    nome_consumivel VARCHAR(70),
    codigo_do_pedido NUMBER(17),
    PRIMARY KEY (nome_consumivel, codigo_do_pedido)
);
 
ALTER TABLE Clientes ADD CONSTRAINT FK_Clientes_3
    FOREIGN KEY (categoria)
    REFERENCES TipoDeCliente (categoria);
 
ALTER TABLE Pedidos ADD CONSTRAINT FK_Pedidos_1
    FOREIGN KEY (cpf)
    REFERENCES Clientes (cpf);
 
ALTER TABLE Pedidos ADD CONSTRAINT FK_Pedidos_2
    FOREIGN KEY (codigo_do_funcionario)
    REFERENCES Funcionarios (codigo_do_funcionario);
 
ALTER TABLE Garcom ADD CONSTRAINT FK_Garcom_1
    FOREIGN KEY (codigo_do_funcionario)
    REFERENCES Funcionarios (codigo_do_funcionario);
 
ALTER TABLE Entregador ADD CONSTRAINT FK_Entregador_2
    FOREIGN KEY (codigo_do_funcionario)
    REFERENCES Funcionarios (codigo_do_funcionario);
 
ALTER TABLE Produtos_pedidos ADD CONSTRAINT FK_Produtos_pedidos_2
    FOREIGN KEY (nome_consumivel)
    REFERENCES Produtos (nome_consumivel);
 
ALTER TABLE Produtos_pedidos ADD CONSTRAINT FK_Produtos_pedidos_3
    FOREIGN KEY (codigo_do_pedido)
    REFERENCES Pedidos (codigo_do_pedido);


insert into tipodecliente values('Básico');
insert into tipodecliente values('Premium');

    
insert into clientes values('Jose Alves', 'Rua 1º de janeiro nº15', '00000000000001', 999234323, 'Básico');
insert into clientes values('Marcio Vitor', 'Rua 14 de marco nº12', '00000000000002', 999554432, 'Premium');
insert into clientes values('Vitor Almeida', 'Rua tenencio dourado nº198', '00000000000003', 988342312, 'Básico');
insert into clientes values('Igor Dourado', 'Rua Mercadão nº115', '00000000000004', 999235738, 'Básico');
insert into clientes values('William Machado', 'Rua Rio parnaiba nº45', '00000000000005', 981427321, 'Premium');
insert into clientes values('Lazaro Barboza', 'Rua Central nº 23', '00000000000006', 991258192, 'Premium');
insert into clientes values('Neymar Junior', 'Rua Parisinse nº10', '00000000000007', 999253256, 'Básico');
insert into clientes values('Monique Fifi', 'Rua Bradesco nº11', '00000000000008', 999276551, 'Premium');
insert into clientes values('Jose Ferreira Neto', 'Rua da posse nº23', '00000000000009', 99934223, 'Básico');
insert into clientes values('Yudi Tamashiro', 'Rua companhia nº34', '00000000000010', 999349821, 'Premium');




insert into produtos values('Pizza', 25.50);
insert into produtos values('Hamburguer', 12);
insert into produtos values('Suco de fruta', 2.5);
insert into produtos values('Milk shake', 3);
insert into produtos values('Batata frita', 8.25);
insert into produtos values('Bolo', 22.5);
insert into produtos values('Agua', 12);
insert into produtos values('Refrigerante', 5);
insert into produtos values('Cerveja', 6.25);
insert into produtos values('Bife', 13);
insert into produtos values('Wisky', 14);
insert into produtos values('Pastel', 4.5);

insert into funcionarios values('Carlos Alberto','Garçom', 3001);
insert into funcionarios values('Yuri José','Garçom', 3002);
insert into funcionarios values('Fabiano Alves','Garçom', 3003);
insert into funcionarios values('Pluto Dourado','Garçom', 3004);
insert into funcionarios values('Melissa Pereira','Garçom', 3005);
insert into funcionarios values('Mario Sergio','Garçom', 3006);
insert into funcionarios values('Clenio Dourado','garçom', 3007);
insert into funcionarios values('Vitor Silva','Entregador', 3008);
insert into funcionarios values('Matheus Peixoto','Entregador', 3009);
insert into funcionarios values('Vinicius Coelho','Entregador', 3010);
insert into funcionarios values('Eduardo Marinho','Entregador', 3011);


insert into entregador values (4001, 3008);
insert into entregador values (4002, 3009);
insert into entregador values (4003, 3010);
insert into entregador values (4004, 3011);

insert into garcom values(3001, 'Interno');
insert into garcom values(3002, 'Externo');
insert into garcom values(3003, 'Interno');
insert into garcom values(3004, 'Interno');
insert into garcom values(3005, 'Externo');
insert into garcom values(3006, 'Interno');
insert into garcom values(3007, 'Externo');

insert into pedidos values('não', 25.5+6.25,1000, 0,'00000000000001','Pizza e cerveja',3005,2);
insert into pedidos values('não', 13,1001, 0,'00000000000001','Bife',3005,2 );--um pedido feito pelo mesmo cliente do pedido, provando que um mesmo cliente pode fazer mais do que um pedido e também o mesmo funcionário, provando que um funcionário pode atender mais do que um pedido
insert into pedidos values('sim', 8.25+5-1.35+5,1002, 1.35,'00000000000002','Batata frita e refrigerante',3009,1);
insert into pedidos values('sim', 7+5,1003, 0,'00000000000003','Pastel e suco de fruta',3011,4);
insert into pedidos values('não', 3,1004, 0, '00000000000004','Milkshake',3002,5);
insert into pedidos values('não', 12-1.2,1005, 1.2, '00000000000005','Hamburguer',3001,3);
insert into pedidos values('não', (14+13+8.25)*0.9,1006, 3.55,'00000000000006','Bife, batata frita e wisky',3006,2);
insert into pedidos values('sim', 6.25+6.25+5,1007, 0, '00000000000007','Cerveja 2x',3010,1);
insert into pedidos values('não', 22.5+5-2.75,1008, 2.75, '00000000000008','Bolo e Refrigerante',3004,3);
insert into pedidos values('sim', 5+5,1009, 0, '00000000000009','Refrigeante',3008,5);
insert into pedidos values('não', 2.5+12-1.45,1010, 1.45, '00000000000010','Hamburguer e suco de fruta',3003,2);

insert into produtos_pedidos values('Pastel', 1003);
insert into produtos_pedidos values('Suco de fruta', 1003);
insert into produtos_pedidos values('Pizza', 1000);
insert into produtos_pedidos values('Cerveja', 1000);
insert into produtos_pedidos values('Bife', 1001);
insert into produtos_pedidos values('Batata frita', 1002);
insert into produtos_pedidos values('Refrigerante', 1002);
insert into produtos_pedidos values('Milk shake', 1004);
insert into produtos_pedidos values('Hamburguer', 1005);
insert into produtos_pedidos values('Bife', 1006);
insert into produtos_pedidos values('Batata frita', 1006);
insert into produtos_pedidos values('Wisky', 1006);
insert into produtos_pedidos values('Cerveja', 1007);
insert into produtos_pedidos values('Bolo', 1008);
insert into produtos_pedidos values('Refrigerante', 1008);
insert into produtos_pedidos values('Refrigerante', 1009);
insert into produtos_pedidos values('Hamburguer', 1010);
insert into produtos_pedidos values('Suco de fruta', 1010);













































