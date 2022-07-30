CREATE DATABASE PythonSQL

USE PythonSQL
CREATE TABLE Vendas(
	id_venda int,
	cliente varchar(50),
	produto varchar(50),
	data_venda date,
	preco decimal(6,2),
	quantidade int,
)

INSERT INTO Vendas(id_venda, cliente, produto, data_venda, preco, quantidade)
VALUES
	(1, 'Gustavo', 'PC', '12/03/2003', 6000, 1)