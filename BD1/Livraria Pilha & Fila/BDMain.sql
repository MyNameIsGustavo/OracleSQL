-- Criando as tabelas.

create table Cliente(
	Codcliente number(6) not null,
	CodEndereco number(6),
	Nome varchar2(40) not null,
	Telefone varchar2(20),
	Datanascimento date,
	CPF varchar2(20)
);

create table Endereco(
	CodEndereco number(6) not null,
	Numero varchar2(5) not null,
	CEP varchar2(20) not null,
	Logradouro varchar2(50) not null,
	Complemento varchar2(50),
	Cidade varchar2(40)
);

create table Cli_End(
	CodCliente number(6) not null,
	CodEndereco number(6) not null
);

create table Pedido(
	CodPedido number(10) not null,
	CodCliente number(6) not null,
	CodPagamento number(10),
	DataPedido date,
	Frete number(7,2),
	Desconto number(2),
	PrecoTotal number(8,2)
);

create table Pagamento(
	CodPagamento number(10) not null,
	DataPagamento date ,
	FormaPagamento char (1) check (FormaPagamento in('B', 'C'))
);

create table Cartao(
	CodPagamento number(10) not null,
	NumeroCartao varchar2(20) not null,
	Parcelas number(2),
	Juros number(4,2),
	Bandeira varchar2(20)
);

create table Boleto(
	CodPagamento number(6) not null,
	Validade date,
	Banco varchar2(20),
	NumCodBarra varchar2(100)
);

create table Item_Ped(
	CodPedido number(10) not null,
	CodLivro number(6) not null,
	Quantidade number(2) not null
);

create table Livro(
	CodLivro number(6) not null,
	CodGenero number(6) not null,
	CodEditora number(6) not null,
	CodAutor number(6) not null,
	Descricao varchar2(250),
	Titulo varchar2(50) not null,
	AnoPubli date,
	Preco number(5,2)
);

create table Liv_Aut(
	CodLivro number(6) not null,
	CodAutor number(6) not null
);

create table Autores(
	CodAutor number(6) not null,
	Nome varchar2(50) not null,
	Nacionalidade varchar2(20),
	QtdeObras number(5),
	DataNascimento date
	
);

create table Editora(
	CodEditora number(6) not null,
	Endereco varchar2(50),
	Nome varchar2(40) not null,
	CNPJ varchar2(20),
	Contato varchar2(20)
);

CREATE TABLE Genero
(	CodGenero number(5) NOT NULL,
	Nome varchar2(50) NOT NULL
);

--Criação das PKs e constraints.
ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente_CodCliente PRIMARY KEY(CodCliente);
ALTER TABLE Cli_End ADD CONSTRAINT PK_CliEnd_CliEnd PRIMARY KEY(CodCliente, CodEndereco);
ALTER TABLE Endereco  ADD CONSTRAINT PK_Endereco_CodEndereco PRIMARY KEY(CodEndereco);
ALTER TABLE Boleto ADD CONSTRAINT PK_Boleto_CodPagamento PRIMARY KEY (CodPagamento);
ALTER TABLE Pedido ADD CONSTRAINT PK_Pedido_CodPedido PRIMARY KEY(CodPedido);
ALTER TABLE Pagamento ADD CONSTRAINT PK_Pagamento_CodPagamento PRIMARY KEY (CodPagamento);
ALTER TABLE Item_Ped ADD CONSTRAINT PK_ItemPed_CodPedLiv PRIMARY KEY(CodPedido,CodLivro);
ALTER TABLE Livro ADD CONSTRAINT PK_Livro_CodLivro PRIMARY KEY(CodLivro);
ALTER TABLE Autores ADD CONSTRAINT PK_Autores_CodAutor PRIMARY KEY (CodAutor);
ALTER TABLE Genero ADD CONSTRAINT PK_Genero_CodGenero PRIMARY KEY (CodGenero);
ALTER TABLE Editora ADD CONSTRAINT PK_Editora_CodEditora PRIMARY KEY (CodEditora);
ALTER TABLE Liv_Aut ADD CONSTRAINT PK_LivAut_CodLivroAutor PRIMARY KEY (CodLivro, CodAutor);

--Criação das FKs e constraints.
ALTER TABLE Cli_End ADD CONSTRAINT FK_CliEnd_CodCliente FOREIGN KEY(CodCliente) REFERENCES Cliente;
ALTER TABLE Cli_End ADD CONSTRAINT FK_CliEnd_CodEndereco FOREIGN KEY(CodEndereco) REFERENCES Endereco;
ALTER TABLE Liv_Aut ADD CONSTRAINT FK_LivAut_CodAutor FOREIGN KEY (CodAutor) REFERENCES Autores;
ALTER TABLE Boleto ADD CONSTRAINT FK_Boleto_CodPagamento FOREIGN KEY (CodPagamento) REFERENCES Pagamento;
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_CodEditora FOREIGN KEY(CodEditora) REFERENCES Editora;
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_CodGenero FOREIGN KEY(CodGenero) REFERENCES Genero;
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_CodAutor FOREIGN KEY(CodAutor) REFERENCES Autores;
ALTER TABLE  Item_Ped ADD CONSTRAINT FK_ItemPed_CodPedido FOREIGN KEY(CodPedido) REFERENCES Pedido;
ALTER TABLE  Item_Ped ADD CONSTRAINT FK_ItemPed_CodLivro FOREIGN KEY(CodLivro) REFERENCES Livro;
ALTER TABLE  Cartao ADD CONSTRAINT FK_Cartao_CodPagamento FOREIGN KEY(CodPagamento) REFERENCES Pagamento;
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_CodPagamento FOREIGN KEY(CodPagamento) REFERENCES Pagamento;
ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_CodCliente FOREIGN KEY(CodCliente) REFERENCES Cliente;

-- INSERTS NA TABELA CLIENTE.
INSERT INTO Cliente VALUES(001,001, 'Joao da Silva','(15)9919-8786',to_date('16-10-1998','DD-MM-YYYY'),'402.383.869-40');
INSERT INTO Cliente VALUES(002,002, 'Claudio Souza', '(12)9953-8780', to_date('12-10-1995','DD-MM-YYYY'), '418.383.870-30');
INSERT INTO Cliente VALUES(003,003, 'Emanoel Rodrigues', '(12)9920-8780', to_date('11-05-1994','DD-MM-YYYY'), '435.390.870-20');
INSERT INTO Cliente VALUES(004,004, 'Fagner Lemos', '(15)9181-5580', to_date('16-03-1993','DD-MM-YYYY'), '418.383.383-10');
INSERT INTO Cliente VALUES(005,005, 'Roberto Carlos', '(13)9083-8780', to_date('12-03-1999','DD-MM-YYYY'), '408.313.070-75');
INSERT INTO Cliente VALUES(006,006, 'Yuri Alberto', '(11)98818-4950', to_date('01-02-1991','DD-MM-YYYY'), '521.353.900-12');
INSERT INTO Cliente VALUES(007,007, 'Vinicius Jose Junior', '(11)98010-4150', to_date('11-03-1989','DD-MM-YYYY'), '501.303.902-13');

-- INSERTS NA TABELA ENDEREÇO.
INSERT INTO Endereco VALUES(001, '200','18225-698','Rua do brejo','bloco 1','Sorocaba');
INSERT INTO Endereco VALUES(002, '165','19925-137','Wilson de bello','Casa de esquina','Sorocaba');
INSERT INTO Endereco VALUES(003, '123','22215-603','Afonso nunez', 'Proximo ao mercado','Votorantim');
INSERT INTO Endereco VALUES(004, '155','58205-759','Orlando torres','Ao lado do hospital regional','Itu');
INSERT INTO Endereco VALUES(005, '921','20205-072','Veracruz barros','Proximo ao campo de futebol','Ibiuna');
INSERT INTO Endereco VALUES(006, '241','55515-895','Rua juazeiro','bloco 8','Itu');
INSERT INTO Endereco VALUES(007, '199','13025-008','Avenida radial','Proximo ao metro ','Votorantim');

-- INSERTS NA TABELA CLI_END.
INSERT INTO Cli_End VALUES(001,001);
INSERT INTO Cli_End VALUES(002,002);
INSERT INTO Cli_End VALUES(003,003);
INSERT INTO Cli_End VALUES(004,004);
INSERT INTO Cli_End VALUES(005,005);
INSERT INTO Cli_End VALUES(006,006);
INSERT INTO Cli_End VALUES(007,007);

-- INSERTS NA TABELA GENERO.
INSERT INTO Genero VALUES(001,'Romance');
INSERT INTO Genero VALUES(002,'Ficcao Científica');
INSERT INTO Genero VALUES(003,'Humor e comédia');
INSERT INTO Genero VALUES(004,'Biografias');
INSERT INTO Genero VALUES(005,'Tecnologia e ciência');
INSERT INTO Genero VALUES(006,'Desenvolvimento Pessoal');
INSERT INTO Genero VALUES(007,'Quadrinhos');

-- INSERTS NA TABELA AUTORES.
INSERT INTO Autores VALUES(001,'Juliano Augusto','Brasileiro',4,to_date('12-05-1978','DD-MM-YYYY'));
INSERT INTO Autores VALUES(002,'Romero Britto','Brasileiro',10,to_date('10-02-1980','DD-MM-YYYY'));
INSERT INTO Autores VALUES(003,'Mauricio de Souza','Brasileiro',35,to_date('21-03-1970','DD-MM-YYYY'));
INSERT INTO Autores VALUES(004,'Afonso Souza','Espanhol',7,to_date('30-09-1992','DD-MM-YYYY'));
INSERT INTO Autores VALUES(005,'Sergio Ramos','Espanhol',2,to_date('17-12-1995','DD-MM-YYYY'));
INSERT INTO Autores VALUES(006,'Joao Felix','Portugues',55,to_date('04-2-1983','DD-MM-YYYY'));
INSERT INTO Autores VALUES(007,'Bob Buffett','Americano',18,to_date('25-12-1989','DD-MM-YYYY'));

-- INSERTS NA TABELA EDITORA.
INSERT INTO Editora VALUES(001,'Av. Pedro Pedroso','Abril','91.233.795/0001-33','(15)9856-9846');
INSERT INTO Editora VALUES(002,'Av. Faria Lima','Sextante','90.203.705/0111-39','(12)9976-5555');
INSERT INTO Editora VALUES(003,'Rua José Marcondes Alves','Rocco','55.233.888/0211-5','(14)9886-9886');
INSERT INTO Editora VALUES(004,'Rua Altos do ipanema','Alta Books','72.054.795/1010-39','(15)9800-9046');
INSERT INTO Editora VALUES(005,'Av. Campos Sales','Aleph','99.299.095/9999-73','(11)99756-0877');
INSERT INTO Editora VALUES(006,'Rua Alvarenga Pedroso','Ubu','98.283.095/0281-81','(15)9817-4851');
INSERT INTO Editora VALUES(007,'Rua Jose Alves Limeira','Panda Books','41.243.445/0401-65','(11)9919-7731');

-- INSERTS NA TABELA LIVRO.
INSERT INTO Livro VALUES(111,001,001,001,'Game of Thrones','Best seller compre ja',to_date('18-05-2012','DD-MM-YYYY'),78.20);
INSERT INTO Livro VALUES(222,002,001,002,'O Mochileiro  das Galaxias','Classico de ficcao cientifica',to_date('22-11-2018','DD-MM-YYYY'),100.00);
INSERT INTO Livro VALUES(333,001,003,003,'E Assim que Acaba',' segundo livro mais vendido em 2022 no Brasil',to_date('30-01-2021','DD-MM-YYYY'),120.50);
INSERT INTO Livro VALUES(444,006,004,004,'+ Esperto que o Diabo','Inedito no Brasil',to_date('20-07-2017','DD-MM-YYYY'),44.99);
INSERT INTO Livro VALUES(555,004,005,005,'Verity','Distintamente Sinistro',to_date('15-04-2019','DD-MM-YYYY'),55.70);

-- INSERTS NA TABELA LIV_AUT.
INSERT into Liv_Aut VALUES(111,001);
INSERT into Liv_Aut VALUES(222,002);
INSERT into Liv_Aut VALUES(333,003);
INSERT into Liv_Aut VALUES(444,004);
INSERT into Liv_Aut VALUES(555,005);

-- INSERTS NA TABELA PAGAMENTO.
INSERT INTO Pagamento VALUES(001,to_date('20-12-2022','DD-MM-YYYY'),'B');
INSERT INTO Pagamento VALUES(002,to_date('21-12-2022','DD-MM-YYYY'),'C');
INSERT INTO Pagamento VALUES(003,to_date('22-12-2022','DD-MM-YYYY'),'B');
INSERT INTO Pagamento VALUES(004,to_date('23-12-2022','DD-MM-YYYY'),'C');
INSERT INTO Pagamento VALUES(005,to_date('24-12-2022','DD-MM-YYYY'),'B');

-- INSERTS NA TABELA CARTÃO.
INSERT INTO Cartao VALUES(002,'5386 4946 3826 9165',3,5,'VISA');
INSERT INTO Cartao VALUES(004,'5548 4165 7859 7482',1,0,'MASTERCARD');

-- INSERTS NA TABELA BOLETO.
INSERT INTO Boleto VALUES (002,to_date('23-12-2022','DD-MM-YYYY'),'BRADESCO','34191.39001 01043.510047 91020.150008 8 91740026000');
INSERT INTO Boleto VALUES (003,to_date('25-12-2022','DD-MM-YYYY'),'BRADESCO','58191.49001 11043.510047 91020.150008 9 91760026000');
INSERT INTO Boleto VALUES (005,to_date('28-12-2022','DD-MM-YYYY'),'BRADESCO','70191.99001 61043.510047 91020.150008 8 91740026000');

-- INSERTS NA TABELA PEDIDO.
INSERT INTO Pedido VALUES (001,001,001,to_date('19-12-2022','DD-MM-YYYY'),25.26,15,78.99);
INSERT INTO Pedido VALUES (002,002,002,to_date('21-12-2022','DD-MM-YYYY'),30.50,0,99.99);
INSERT INTO Pedido VALUES (003,007,003,to_date('20-12-2022','DD-MM-YYYY'),0,15,245.80);
INSERT INTO Pedido VALUES (004,004,004,to_date('23-12-2022','DD-MM-YYYY'),0,0,125.50);
INSERT INTO Pedido VALUES (005,006,005,to_date('23-12-2022','DD-MM-YYYY'),0,15,45.70);

-- INSERTS NA TABELA ITEM_PEDIDO.
INSERT INTO Item_Ped VALUES(001,111,1);
INSERT INTO Item_Ped VALUES(001,555,1);
INSERT INTO Item_Ped VALUES(002,333,2);
INSERT INTO Item_Ped VALUES(002,111,1);
INSERT INTO Item_Ped VALUES(002,222,3);
INSERT INTO Item_Ped VALUES(003,111,1);
INSERT INTO Item_Ped VALUES(004,333,4);
INSERT INTO Item_Ped VALUES(004,222,1);
INSERT INTO Item_Ped VALUES(005,222,3);