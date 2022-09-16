create table TB_cliente
( codcliente number(5) not null,
  nomecliente varchar2(30) not null,
  endereco varchar2(30),
  cidade varchar2(20),
  cep varchar2(10),
  uf char(2)
);

create table TB_vendedor
( codvendedor number(5) not null,
  nomevendedor varchar2(30) not null,
  faixa_com    number(4,2),
  salario_fixo number(7,2)
);

create table TB_produto
( codproduto   number(5) not null,
  descricao varchar(30),
  unid       char(2),
  valor_unit number(6,2)
);

Create table TB_PEDIDO
( NUMPEDIDO     number(5) NOT NULL,
  PRAZO_ENTREGA DATE,
  CODCLIENTE     number(5),
  CODVENDEDOR   number(5)
);

CREATE TABLE TB_ITEM_PEDIDO
( NUMPEDIDO   number(5) NOT NULL,
 CODPRODUTO  number(5) NOT NULL,
 QTDE        number(5)
);

--DEFININDO AS RESTRIÇÕES de PK
select * from user_constraints

ALTER TABLE TB_Cliente ADD CONSTRAINT PK_Cliente_codcliente PRIMARY KEY(Codcliente);
 
ALTER TABLE TB_Produto ADD CONSTRAINT PK_PRODUTO_CODPRODUTO PRIMARY KEY(CODPRODUTO);

ALTER TABLE TB_VENDEDOR ADD CONSTRAINT PK_VENDEDOR_CODVENDEDOR PRIMARY KEY(CODVENDEDOR);

ALTER TABLE TB_PEDIDO ADD CONSTRAINT PK_PEDIDO_NUMPEDIDO PRIMARY KEY(NUMPEDIDO);
 
ALTER TABLE TB_ITEM_PEDIDO ADD CONSTRAINT  PK_ITEMPEDIDO_PEDPROD PRIMARY KEY(NUMPEDIDO,CODPRODUTO);

select * from user_constraints order by table_name;

--- Restrições de FK 
ALTER TABLE TB_PEDIDO ADD CONSTRAINT FK_PEDIDO_CODCLI FOREIGN KEY(CODCLIENTE) REFERENCES TB_CLIENTE;

ALTER TABLE TB_PEDIDO ADD CONSTRAINT FK_PEDIDO_CODVENDEDOR FOREIGN KEY(CODVENDEDOR) REFERENCES TB_VENDEDOR;

--- ITEM PEDIDO
ALTER TABLE TB_ITEM_PEDIDO ADD CONSTRAINT FK_ITEMPEDIDO_NUMPEDIDO FOREIGN KEY(NUMPEDIDO) REFERENCES TB_PEDIDO;

ALTER TABLE TB_ITEM_PEDIDO ADD CONSTRAINT FK_ITEMPEDIDO_CODPRODUTO FOREIGN KEY(CODPRODUTO) REFERENCES TB_PRODUTO;

select * from user_constraints

---- Inserindo dados
insert into TB_vendedor values (5,'Antonio Pedro',5.0,400);
insert into TB_vendedor values (15,'Carlos Sola',0.0,400);
insert into TB_vendedor values (25,'Ana Carolina',1.0,200);
insert into TB_vendedor values (35,'Solange Almeida',1.0,300);

--
INSERT INTO TB_CLIENTE VALUES ( 30, 'João da Silva', 'AV. MATT HOFFMANN, 1100', 'SÃO PAULO', '97056-001', 'SP');
INSERT INTO TB_CLIENTE VALUES ( 31, 'LUCAS ANTUNES', 'RUA TRODANI, 120', 'SOROCABA', '19658-023', 'SP');
INSERT INTO TB_CLIENTE VALUES ( 32, 'LAURA STRAUSS', 'RUA TULIPAS, 650', 'PRIMAVERA', '18556-025', 'SP');
--

INSERT INTO TB_PRODUTO VALUES ( 11, 'Apple Watch', 'UN', 975.99);
INSERT INTO TB_PRODUTO VALUES ( 12, 'IPAD', 'UN', 999.70);
INSERT INTO TB_PRODUTO VALUES ( 13, 'PÓ PARA TONER', 'KG', 85.60);
INSERT INTO TB_PRODUTO VALUES ( 14, 'Mouse', 'UN', 45.60);
INSERT INTO TB_PRODUTO VALUES ( 15, 'Caneta digital', 'UN', 100.00);
insert into TB_Produto values (40,'Mouse sem fio', 'UN', 68.90);
insert into TB_Produto values (42,'FIO HDMI', 'UN', 18.00);
insert into TB_Produto values (43,'Pendrive Star Wars', 'UN', 48.00);
insert into TB_Produto values (44,'Mouse com fio', 'UN', 28.00);
insert into TB_Produto values (45,'Pendrive do Mickey', 'UN', 50.00);
--

INSERT INTO TB_PEDIDO VALUES ( 7, '26/02/2020', 31, 15);
INSERT INTO TB_PEDIDO VALUES ( 8, '23/05/2020', 32, 25);
INSERT INTO TB_PEDIDO VALUES ( 9, '21/02/2020', 32, 5);
INSERT INTO TB_PEDIDO VALUES ( 10, '20/02/2020', 30, 5);
--

Insert into tb_item_pedido values (7,11,1);
Insert into tb_item_pedido values (7,40,2);
Insert into tb_item_pedido values (7,42,1);
Insert into tb_item_pedido values (8,43,5);
Insert into tb_item_pedido values (9,12,1);
Insert into tb_item_pedido values (10,11,1);
Insert into tb_item_pedido values (10,43,1);
Insert into tb_item_pedido values (10,13,2);
Insert into tb_item_pedido values (8,40,1);
--

select * from tb_cliente;
select * from tb_vendedor;
select * from tb_produto;
select * from tb_pedido;
select * from tb_item_pedido

ALTER TABLE TB_VENDEDOR ADD DATANASC DATE;

ALTER TABLE TB_CLIENTE ADD REGIAO varchar2(20);
ALTER TABLE TB_CLIENTE MODIFY NOMECLIENTE varchar2(50);
ALTER TABLE TB_CLIENTE DROP COLUMN REGIAO;

INSERT INTO TB_CLIENTE VALUES (33, 'ANA MARIA ANTUNES', 'RUA TRODANI, 120', 'SOROCABA', '18035-400', 'SP');

UPDATE TB_CLIENTE SET CEP = '18035-400' WHERE CIDADE = 'Sorocaba';

UPDATE TB_PRODUTO 
SET VALOR_UNIT = VALOR_UNIT * 1.1
WHERE = 'KG';

DELETE TB_PRODUTO WHERE UNID = 'LT' and VALOR_UNIT > 50.00;

SELECT NOMEVENDEDOR "NOME" FROM TB_VENDEDOR;

SELECT DESCRICAO, VALOR_UNIT, VALOR_UNIT * 1.1 FROM TB_PRODUTO;

SELECT NOMECLIENTE FROM TB_CLIENTE
WHERE CIDADE= 'SOROCABA' AND NOMECLIENTE LIKE '%SILVA';

SELECT NUMPEDIDO, PRAZO_ENTREGA FROM TB_PEDIDO
WHERE PRAZO_ENTREGA BETWEEN '01/03/2021' AND '31/03/2021';

SELECT NUMPEDIDO, PRAZO_ENTREGA FROM TB_PEDIDO
WHERE TO_CHAR PRAZO_ENTREGA(PRAZO_ENTREGA, 'YYYY') = '2020';

SELECT * FROM TB_PRODUTO
WHERE VALOR_UNIT > 100.00 AND VALOR_UNIT < 200.00;

