create table Livro (
    CodigoLivro number(5) PRIMARY KEY, 
    Titulo varchar2(30), 
    Editora varchar2(20), 
    Cidade varchar2(30), 
    DataEdicao date, 
    Versao number(3), 
    CodAssunto number(5) NOT NULL, 
    Preco number(5,2), 
    DataCadastro date, 
    lancamento Char(1) 
);

create table AutorLivro (
    CodigoAutorLivro number(5) NOT NULL,
    codigoLivro number(5) NOT NULL, 
    codAutor number(5) NOT NULL
);

create table Autor (
    CodAutor number(5) PRIMARY KEY, 
    Nomeautor varchar2(20), 
    datanascimento date, 
    CidadeNasc varchar2(20), 
    sexo char(1) 
);

create table Assunto 
(   CodAssunto number(5) PRIMARY KEY,
    CodigoLivro number(5) NOT NULL, 
    descricao varchar2(40), 
    descontopromocao char(1)
);
/*1- Analise o modelo e escreva um comando para adicionar a chave primária na tabela AutorLivro e as chaves estrangeiras, considerando que a tabela já está com sua estrutura criada. 
Usar Alter Table e dar nome às constraints.
RESPOSTA:
*/
ALTER TABLE AutorLivro ADD CONSTRAINT PK_AutorLivro PRIMARY KEY (CodigoAutorLivro);
ALTER TABLE AutorLivro ADD CONSTRAINT FK_Livro_AutoLivro FOREIGN KEY (codigoLivro) REFERENCES Livro;
ALTER TABLE AutorLivro ADD CONSTRAINT FK_Autor_AutorLivro FOREIGN KEY (codAutor) REFERENCES Autor;
ALTER TABLE Assunto ADD CONSTRAINT FK_Assunto_Livro FOREIGN KEY(CodigoLivro) REFERENCES Livro;

/*2- Escreva os comandos necessários para incluir 2 linhas em cada tabela listada acima. 
A inclusão dos registros de dados devem obedecer a uma ordem? Porque?
RESPOSTA DA PERGUNTA: Sim, as restrições de chaves primarias e estrangeiras ja estavam inseridas no codigo.
*/
INSERT INTO Livro VALUES(1, 'Um bom livro', 'Abril', 'Sorocaba', to_date('12-03-2003','DD-MM-YYYY'), 01, 1, 20.00, to_date('12-03-2003','DD-MM-YYYY'), 'M');
INSERT INTO Livro VALUES(2, 'Um pessimo livro', 'Abril', 'Votorantim', to_date('25-03-2003','DD-MM-YYYY'), 02, 2, 25.00, to_date('25-03-2003','DD-MM-YYYY'), 'D');
INSERT INTO Livro VALUES(3, 'Um livro mais ou menos', 'Abril', 'Itapetininga', to_date('05-03-2005','DD-MM-YYYY'), 03, 3, 31.00, to_date('05-03-2005','DD-MM-YYYY'), 'J');

INSERT INTO Autor VALUES(1, 'Vinicius JR', to_date('25-10-2003','DD-MM-YYYY'), 'Itu', 'M');
INSERT INTO Autor VALUES(2, 'Lucas Paqueta', to_date('30-10-2003','DD-MM-YYYY'), 'Ipero', 'M');
INSERT INTO Autor VALUES(3, 'Sergio Ramos', to_date('25-10-2003','DD-MM-YYYY'), 'Votuporanga', 'M');

INSERT INTO Assunto VALUES(1, 1, 'Livro legal', 'N');
INSERT INTO Assunto VALUES(2, 2, 'Livro chato', 'S');
INSERT INTO Assunto VALUES(3, 3, 'Livro MAIS OU MENOS', 'S');

/*3- Adicionar uma nova coluna de nome Nacionalidade na tabela Autor. 
RESPOSTA:
*/
ALTER TABLE Autor ADD Nacionalidade varchar2(15);

/*4- Alterar a coluna Titulo da tabela Livros de 30 para 40 posições.
RESPOSTA:
*/
ALTER TABLE Livro MODIFY Titulo varchar2(40);

/*5- Incluir uma restrição de domínio para a coluna descontopromocao da tabela assunto
de forma a aceitar apenas ‘S’ ou ‘N’.
RESPOSTA:
*/
ALTER TABLE Assunto MODIFY (descontopromocao char(1) check(descontopromocao in('S', 'N')));

/*6- Alterar o campo editora da tabela livros mudando para ‘Editora LTC’ para o livro de código 3.
RESPOSTA:
*/
UPDATE Livro SET Editora = 'Editora LTC' WHERE CodigoLivro = 3;

/*7- Excluir os livros com codassunto igual a 10 e anoedição menor que 1980;
RESPOSTA:
*/ DELETE FROM Livro
WHERE CodAssunto = 10 AND DataEdicao < to_date(1980, 'YYYY');

/*8- Listar o título dos livros que possuam a palavra “Banco de Dados’ em qualquer posição do Título.
RESPOSTA:
*/ SELECT * FROM Livro
WHERE titulo LIKE '%Banco de Dados';

/*9- Listar o nome dos autores que nasceram entre 1950 e 1970 ordenado pela cidade e depois pelo nome.
RESPOSTA:
*/ SELECT Nomeautor FROM Autor
WHERE datanascimento >= to_date(1950, 'YYYY') AND datanascimento <= to_date(1970, 'YYYY')
ORDER BY CidadeNasc, Nomeautor DESC;

/*10- Listar a quantidade de livros existentes por assunto. Exibir o código do assunto e a qtde de livros.
RESPOSTA:
*/ SELECT A.CodAssunto AS CODIGO_ASSUNTO, COUNT(L.CodigoLivro) AS QTDE_LIVRO, COUNT(A.CodigoLivro) FROM Assunto A
INNER JOIN Livro L ON A.CodAssunto = L.CodigoLivro
GROUP BY A.CodAssunto, L.CodigoLivro;

/*11- Listar o título do livro e a descrição do assunto a qual ele pertence.
RESPOSTA:
*/ 
SELECT L.titulo, A.descricao FROM Livro L
INNER JOIN Assunto A ON L.CodigoLivro = A.CodAssunto;

/*12- Listar o código do livro, titulo, código e nome dos autores de cada livro.
RESPOSTA:
*/ SELECT L.CodigoLivro AS CODIGO_LIVRO, L.Titulo, A.CodAutor AS CODIGO_AUTOR, A.Nomeautor FROM Livro L
INNER JOIN Autor A ON L.CodigoLivro = A.CodAutor
ORDER BY L.CodigoLivro DESC;

/*13- Listar o código dos autores que tem mais de 3 livros publicados.
RESPOSTA:
*/
SELECT A.CodAutor, COUNT(L.CodigoLivro) FROM Autor A
INNER JOIN Livro L ON A.CodAutor = L.CodigoLivro
GROUP BY A.CodAutor, L.CodigoLivro
HAVING SUM(L.CodigoLivro) > 3;
