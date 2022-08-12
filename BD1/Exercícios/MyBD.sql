-- Aula 01

create table MyTable(
  ID_cliente number(5)primary key,
  Nome_cliente varchar2(40) not null,
  CPF_cliente varchar2(11) not null,
  DataNasc_cliente date,
  Sexo_cliente char(1)
);

--Inserindo dados;

insert into MyTable values (1,'Gustavo Rocha','12345678912','12/03/2003','M');

alter table MyTable modify CPF_cliente varchar2(14);

insert into MyTable values (2,'@Gu_Rocha','123.456.789/12','13/03/2003','M');

select * from MyTable;

select ID_cliente,nome_cliente from MyTable
where Sexo_cliente = 'M'; 