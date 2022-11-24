create database bimestral; --Criando o banco

use bimestral; --usando o banco bimestral

/*-------CREATES-------*/

create table vendedor(
	cod_vendedor int primary key identity,
	nome varchar(50),
);

create table regiao(
	cod_regiao int primary key identity,
	nome varchar(50),
	bairro varchar(45),
	cidade varchar(45),
	estado varchar(20),
	codigo_vendedor int,
	foreign key (codigo_vendedor) references vendedor(cod_vendedor)
);
create table pontoEstrategico(
	cod_pontoEstrategico int primary key identity,
	codigo_regiao int,
	endereco varchar(20)
	foreign key  (codigo_regiao) references regiao(cod_regiao)
);
create table itemAtivo(
	cod_item int primary key identity,
	nome varchar(50) not null,
	estoque int not null,
	ativo varchar(15)
);

create table cliente(
	cod_cliente int primary key identity,
	nome varchar(50) not null
);

create table notaFiscal(
	cod_notaFiscal int primary key identity,
	cod_cliente int,
	cod_item int,
	foreign key (cod_cliente) references cliente(cod_cliente),
	foreign key (cod_item) references itemAtivo(cod_item)
);
create table pedido(
	cod_pedido int primary key identity,
	cod_item int,
	cod_notaFiscal int,
	foreign key (cod_item) references itemAtivo(cod_item),
	foreign key (cod_notaFiscal) references notaFiscal(cod_notaFiscal)
);
create table veiculo(
	cod_veiculo int primary key identity,
	marca varchar(25),
	cod_vendedor int,
	foreign key (cod_vendedor) references vendedor(cod_vendedor)
);

/*----------------INSERTS-----------*/

use bimestral;

insert into vendedor(
	nome
)values('vendedor1');

insert into vendedor(
	nome
)values('vendedor2');

insert into vendedor(
	nome
)values('vendedor3');


/*---------------*/
insert into regiao(
	nome,
	bairro,
	cidade,
	estado,
	codigo_vendedor
)values ('Região X','Bairro X','Cidade X','Estado X', 1);

insert into regiao(
	nome,
	bairro,
	cidade,
	estado,
	codigo_vendedor
)values ('Região Y','Bairro Y','Cidade Y','Estado Y', 2);

insert into regiao(
	nome,
	bairro,
	cidade,
	estado,
	codigo_vendedor
)values ('Região Z','Bairro Z','Cidade Z','Estado Z', 3);

/*---------------*/
insert into pontoEstrategico(
	codigo_regiao,
	endereco
)values(1, 'Endereço Dale');

insert into pontoEstrategico(
	codigo_regiao,
	endereco
)values(2, 'Endereço da Quebrada');

insert into pontoEstrategico(
	codigo_regiao,
	endereco
)values(1, 'Endereço dos Cria');

/*---------------*/
insert into itemAtivo(
	nome,
	estoque,
	ativo
)values('Item 1',10,'Sim');

insert into itemAtivo(
	nome,
	estoque,
	ativo
)values('Item 2',0,'Não');

insert into itemAtivo(
	nome,
	estoque,
	ativo
)values('Item 2',6,'Sim');

/*---------------*/
insert into cliente(
	nome
)values('Cliente da Silva');

insert into cliente(
	nome
)values('Cliente Diaz');

insert into cliente(
	nome
)values('Cliente dos Santos');

/*---------------*/
insert into notaFiscal(
	cod_cliente,
	cod_item
)values(1, 3);

insert into notaFiscal(
	cod_cliente,
	cod_item
)values(2, 1);

insert into notaFiscal(
	cod_cliente,
	cod_item
)values(3, 2);

/*---------------*/
insert into pedido(
	cod_item,
	cod_notaFiscal
)values(1, 1);

insert into pedido(
	cod_item,
	cod_notaFiscal
)values(2, 2);

insert into pedido(
	cod_item,
	cod_notaFiscal
)values(3, 3);

/*---------------*/
insert into veiculo(
	marca,
	cod_vendedor
)values('Ford',2);

insert into veiculo(
	marca,
	cod_vendedor
)values('BMW',1);

insert into veiculo(
	marca,
	cod_vendedor
)values('Chevrolet',3);

/*-----------INNERS----------------*/
use bimestral;


SELECT * FROM vendedor INNER JOIN pontoEstrategico ON vendedor.cod_vendedor = pontoEstrategico.codigo_regiao; --selecionando todos os dados das tabela pontoEstrategico e vendedor, quando seus ids estão relacionados

SELECT cod_vendedor, nome FROM vendedor WHERE cod_vendedor IN (select cod_vendedor from veiculo); --selecionando algumas colunas da tabela vendedor quando os dados estão dentro da tabela veiculo