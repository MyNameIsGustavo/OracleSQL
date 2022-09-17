INSERT INTO Paciente VALUES (55, 'Gustavo', '22/03/2002','M', 'Rua Wilson Martiz', 'Sorocaba', 'S');
INSERT INTO Consulta VALUES (200,'01/09/2022', 'P', 55, 1, 0);

ALTER TABLE Paciente ADD País varchar2(15);
ALTER TABLE Paciente MODIFY Endereco varchar2(28);
ALTER TABLE Paciente DROP COLUMN País;
ALTER TABLE Paciente MODIFY Endereco not null;

UPDATE Paciente SET DataNasc = '01/09/1990' WHERE CodPaciente = 10;
UPDATE Paciente SET Desconto = 'N' WHERE Desconto = 'S';
UPDATE Paciente SET Endereco = 'RUA MELO ALVES,40' WHERE CodPaciente = 11;
UPDATE Paciente SET Cidade = 'Itu' WHERE CodPaciente = 11;

DELETE FROM Consulta WHERE ValConsulta = 0;
DELETE FROM Paciente WHERE CodPaciente = 55;
DELETE FROM Paciente WHERE Cidade = 'Sorocaba';
DELETE FROM Paciente WHERE Sexo = 'F';

UPDATE Paciente SET Desconto = 'S' WHERE Sexo = 'F'; 
UPDATE Paciente SET Desconto = 'S' WHERE DataNasc > '01/01/1962';

ALTER TABLE Paciente ADD Telefone varchar2(15);
INSERT INTO Paciente (Telefone) VALUES('998184850');
INSERT INTO Paciente (Telefone) VALUES('123456789');
INSERT INTO Paciente (Telefone) VALUES('555999333');