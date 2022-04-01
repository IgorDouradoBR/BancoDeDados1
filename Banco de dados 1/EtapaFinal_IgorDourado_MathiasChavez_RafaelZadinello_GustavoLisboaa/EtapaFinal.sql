/* : Igor Dourado 19204004-4, Mathias Chavez 19204076-4, Gustavo Lisboa 20103003-8 e Rafael Zadinello 20104962-4 */

drop table bebida cascade CONSTRAINTS;
drop table comida cascade CONSTRAINTS;
drop table cardapio cascade CONSTRAINTS;
drop table clientes cascade CONSTRAINTS;
drop table pedidos cascade CONSTRAINTS;
drop table entregador cascade CONSTRAINTS;
drop table funcionarios cascade CONSTRAINTS;
drop table garcom cascade CONSTRAINTS;
drop table realiza cascade CONSTRAINTS;
drop table tipodecliente cascade CONSTRAINTS;



CREATE TABLE Clientes (
    nome VARCHAR(70) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    cpf VARCHAR(20) NOT NULL PRIMARY KEY,
    telefone NUMBER(17) NOT NULL UNIQUE
);

CREATE TABLE TipoDeCliente (
    categoria VARCHAR(25) NOT NULL,
    cpf VARCHAR(20) PRIMARY KEY
);

CREATE TABLE Cardapio (
    nome_consumivel VARCHAR(70) NOT NULL PRIMARY KEY,
    preco NUMBER(5) NOT NULL,
    cpf VARCHAR(20)
);

CREATE TABLE Bebida (
    tipo_de_bebida VARCHAR(20) NOT NULL,
    nome_consumivel VARCHAR(70) NOT NULL PRIMARY KEY
);

CREATE TABLE Comida (
    tipo_de_refeicao VARCHAR(20) NOT NULL,
    nome_consumivel VARCHAR(70) NOT NULL PRIMARY KEY
);

CREATE TABLE Realiza (
    cpf VARCHAR(20),
    codigo_do_pedido NUMBER(17) NOT NULL,
    forma_de_pagamento NUMBER(17) NOT NULL,
    PRIMARY KEY (cpf, codigo_do_pedido, forma_de_pagamento)
);

CREATE TABLE Pedidos (
    entrega VARCHAR(10) NOT NULL,
    preco_do_pedido NUMBER(17) NOT NULL,
    codigo_do_pedido NUMBER(17) NOT NULL PRIMARY KEY,
    desconto NUMBER(17)
);

CREATE TABLE Funcionarios (
    nome_do_funcionario VARCHAR(200) NOT NULL,
    cargo VARCHAR(70) NOT NULL,
    codigo_do_funcionario NUMBER(17) NOT NULL PRIMARY KEY,
    codigo_do_pedido NUMBER(17)
);

CREATE TABLE Garcom (
    codigo_do_funcionario NUMBER(17) NOT NULL PRIMARY KEY,
    internoOuExterno VARCHAR(20) NOT NULL
);

CREATE TABLE Entregador (
    codigo_da_area NUMBER(17) NOT NULL UNIQUE,
    codigo_do_funcionario NUMBER(17) NOT NULL PRIMARY KEY
);
 
ALTER TABLE TipoDeCliente ADD CONSTRAINT FK_TipoDeCliente_1
    FOREIGN KEY (cpf)
    REFERENCES Clientes (cpf);
 
ALTER TABLE Cardapio ADD CONSTRAINT FK_card_curs
    FOREIGN KEY (cpf)
    REFERENCES Clientes (cpf);
 
ALTER TABLE Bebida ADD CONSTRAINT FK_Bebida_1
    FOREIGN KEY (nome_consumivel)
    REFERENCES Cardapio (nome_consumivel);
 
ALTER TABLE Comida ADD CONSTRAINT FK_Comida_1
    FOREIGN KEY (nome_consumivel)
    REFERENCES Cardapio (nome_consumivel);
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_2
    FOREIGN KEY (codigo_do_pedido)
    REFERENCES Pedidos (codigo_do_pedido);
 
ALTER TABLE Realiza ADD CONSTRAINT FK_Realiza_3
    FOREIGN KEY (cpf)
    REFERENCES Clientes (cpf);
 
ALTER TABLE Funcionarios ADD CONSTRAINT FK_Funcionarios_2
    FOREIGN KEY (codigo_do_pedido)
    REFERENCES Pedidos (codigo_do_pedido);
 
ALTER TABLE Garcom ADD CONSTRAINT FK_Garcom_1
    FOREIGN KEY (codigo_do_funcionario)
    REFERENCES Funcionarios (codigo_do_funcionario);
 
ALTER TABLE Entregador ADD CONSTRAINT FK_Entregador_2
    FOREIGN KEY (codigo_do_funcionario)
    REFERENCES Funcionarios (codigo_do_funcionario);
    
    
insert into clientes values('Jose Alves', 'Rua 1º de janeiro nº15', '00000000000001', 999234323);
insert into clientes values('Marcio Vitor', 'Rua 14 de marco nº12', '00000000000002', 999554432);
insert into clientes values('Vitor Almeida', 'Rua tenencio dourado nº198', '00000000000003', 988342312);
insert into clientes values('Igor Dourado', 'Rua Mercadão nº115', '00000000000004', 999235738);
insert into clientes values('William Machado', 'Rua Rio parnaiba nº45', '00000000000005', 981427321);
insert into clientes values('Lazaro Barboza', 'Rua Central nº 23', '00000000000006', 991258192);
insert into clientes values('Neymar Jr', 'Rua Parisinse nº10', '00000000000007', 999253256);
insert into clientes values('Monique Fifi', 'Rua Bradesco nº11', '00000000000008', 999276551);
insert into clientes values('Jose Ferreira Neto', 'Rua da posse nº23', '00000000000009', 99934223);
insert into clientes values('Yudi Tamashiro', 'Rua companhia nº34', '00000000000010', 999349821);

insert into tipodecliente values('Básico', '00000000000001');
insert into tipodecliente values('Premium', '00000000000002');
insert into tipodecliente values('Básico', '00000000000003');
insert into tipodecliente values('Básico', '00000000000004');
insert into tipodecliente values('Premium', '00000000000005');
insert into tipodecliente values('Premium', '00000000000006');
insert into tipodecliente values('Básico', '00000000000007');
insert into tipodecliente values('Premium', '00000000000008');
insert into tipodecliente values('Básico', '00000000000009');
insert into tipodecliente values('Básico', '00000000000010');

insert into cardapio values('Pizza', 25.50, null);
insert into cardapio values('Hamburguer', 12, null);
insert into cardapio values('Suco de fruta', 2.5, null);
insert into cardapio values('Milk shake', 3, null);
insert into cardapio values('Batata frita', 8.25, null);
insert into cardapio values('Bolo', 22.5, null);
insert into cardapio values('Agua', 12, null);
insert into cardapio values('Refrigerante', 5, null);
insert into cardapio values('Cerveja', 6.25, null);
insert into cardapio values('Bife', 13, null);
insert into cardapio values('Wisky', 14, null);
insert into cardapio values('Pastel', 4.5, null);


insert into bebida values('Alcoolica', 'Cerveja');
insert into bebida values('Não Alcoolica', 'Refrigerante');
insert into bebida values('Não Alcoolica', 'Milk shake');
insert into bebida values('Não Alcoolica', 'Agua');
insert into bebida values('Não Alcoolica', 'Suco de fruta');
insert into bebida values('Alcoolica', 'Wisky');

insert into comida values('Janta','Pizza');
insert into comida values('Tira gosto','Batata frita');
insert into comida values('Sobremesa','Bolo');
insert into comida values('Almoço','Bife');
insert into comida values('Janta','Hamburguer');
insert into comida values('Tira gosto','Pastel');

insert into pedidos values('não', 110-11,1000, 11);
insert into pedidos values('não', 25-2.5,1001, 2.5);
insert into pedidos values('sim', 80-8+5,1002, 8);
insert into pedidos values('sim', 270+5,1003, 0);
insert into pedidos values('não', 30,1004, 0);
insert into pedidos values('não', 95,1005, 0);
insert into pedidos values('não', 210-21,1006, 21);
insert into pedidos values('sim', 70+5,1007, 0);
insert into pedidos values('não', 15-1.5,1008, 1.5);
insert into pedidos values('sim', 170-17+5,1009, 17);
insert into pedidos values('não', 90,1010, 0);

insert into realiza values('00000000000001', 1000, 2);
insert into realiza values('00000000000002', 1001, 1);
insert into realiza values('00000000000003', 1002, 5);
insert into realiza values('00000000000004', 1003, 3);
insert into realiza values('00000000000005', 1004, 2);
insert into realiza values('00000000000006', 1005, 4);
insert into realiza values('00000000000007', 1006, 1);
insert into realiza values('00000000000007', 1007, 2);/*O mesmo cliente, porém fez outro pedido e com outro metodo de pagameto*/
insert into realiza values('00000000000008', 1008, 5);
insert into realiza values('00000000000009', 1009, 3);
insert into realiza values('00000000000010', 1010, 4);

insert into funcionarios values('Carlos Alberto','Garçom', 3001,1000);
insert into funcionarios values('Yuri José','Garçom', 3002,1001);
insert into funcionarios values('Fabiano Alves','Garçom', 3003,1004);
insert into funcionarios values('Pluto Dourado','Garçom', 3004,1005);
insert into funcionarios values('Melissa Pereira','Garçom', 3005,1006);
insert into funcionarios values('Mario Sergio','Garçom', 3006,1008);
insert into funcionarios values('Clenio Dourado','garçom', 3007,1010);
insert into funcionarios values('Vitor Silva','Entregador', 3008,1002);
insert into funcionarios values('Matheus Peixoto','Entregador', 3009,1003);
insert into funcionarios values('Vinicius Coelho','Entregador', 3010,1007);
insert into funcionarios values('Eduardo Marinho','Entregador', 3011,1009);

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







































