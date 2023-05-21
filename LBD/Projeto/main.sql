<<<<<<< HEAD
CREATE TABLE TB_Usuario
(	IDUsuario NUMBER(5) NOT NULL,
	SenhaUser VARCHAR2(20),
	TelefoneUser VARCHAR2(20),
	NomeUser VARCHAR2(20),
	EmailUser VARCHAR(20) 	
);

CREATE TABLE TB_ValidacaoOTP
(	IDValOTP NUMBER(5) NOT NULL,
    IDUsuario NUMBER(5) NOT NULL,
	Updated /*Falta o tipo de dado*/
	OTP /*Falta o tipo de dado*/
);

CREATE TABLE TB_Disciplina
(	IDDisciplina NUMBER(5) NOT NULL,
    IDUsuario NUMBER(5) NOT NULL,
	nomeProfessor VARCHAR2 (50),
	notaMinima number(2),
	nomeDisciplina VARCHAR2(50)	
);

CREATE TABLE TB_ComposicaoNota
(	IDAtividade NUMBER(5) NOT NULL,
    IDDisciplina NUMBER(5) NOT NULL,
	nomeAtividade VARCHAR2 (30),
	descricaoAtividade VARCHAR2(50),
	tipoAtividade VARCHAR2(10),
	pesoAtividade NUMBER(3),
	notaAtividade number(2)
);

CREATE TABLE TB_Tarefa
(	IDTarefa NUMBER(5) NOT NULL,
    IDUsuario NUMBER(5) NOT NULL,
    Descricao VARCHAR2(50),
    DataInicial DATE,
    NomeTarefa VARCHAR(20),
    DataFinal DATE,
    Situacao CHAR(1) CHECK (Situacao IN ('T', 'F'))
);

CREATE TABLE TB_Subtarefa
(	IDSubtarefa NUMBER(5) NOT NULL,
    IDTarefa NUMBER(5) NOT NULL,
	Status VARCHAR2(20),
	Descricao VARCHAR2(50)
);

-- Adicionando as PK's e Constraint;
ALTER TABLE TB_Usuario ADD CONSTRAINT PK_Usuario_IDUsuario PRIMARY KEY( IDUsuario );
-- ALTER TABLE TB_ValidacaoOTP ADD CONSTRAINT PK_ValidacaoOTP_IDValOTP PRIMARY KEY( IDValOTP );
ALTER TABLE TB_Disciplina ADD CONSTRAINT PK_Disciplina_IDDisciplina PRIMARY KEY( IDDisciplina );
ALTER TABLE TB_ComposicaoNota ADD CONSTRAINT PK_ComposicaoNota_IIDAtividade PRIMARY KEY( IDAtividade );
ALTER TABLE TB_Tarefa ADD CONSTRAINT PK_Tarefa_IDTarefa PRIMARY KEY( IDTarefa );
ALTER TABLE TB_Subtarefa ADD CONSTRAINT PK_Subtarefa_IDSubTarefa PRIMARY KEY( IDSubTarefa );

-- Adicionando as FK's e Constraint;
ALTER TABLE TB_Subtarefa ADD CONSTRAINT FK_Subtarefa_IDTarefa FOREIGN KEY (IDTarefa) REFERENCES TB_Tarefa;
ALTER TABLE TB_Tarefa ADD CONSTRAINT FK_Tarefa_IDUsuario FOREIGN KEY (IDUsuario) REFERENCES TB_USUARIO;
ALTER TABLE TB_composicaoNota ADD CONSTRAINT FK_composicaoNota_IDDisciplina FOREIGN KEY (IDDisciplina) REFERENCES TB_ComposicaoNota;
ALTER TABLE TB_Disciplina ADD CONSTRAINT FK_Disciplina_IDUsuario FOREIGN KEY (IDUsuario) REFERENCES TB_Usuario;
=======
CREATE TABLE TB_Usuario
(	IDUsuario NUMBER(5) NOT NULL,
	SenhaUser VARCHAR2(20),
	TelefoneUser VARCHAR2(20),
	NomeUser VARCHAR2(20),
	EmailUser VARCHAR(50) 	
);

CREATE TABLE TB_ValidacaoOTP
(	IDValOTP NUMBER(5) NOT NULL,
    IDUsuario NUMBER(5) NOT NULL,
	Updated /*Falta o tipo de dado*/
	OTP /*Falta o tipo de dado*/
);

CREATE TABLE TB_Disciplina
(	IDDisciplina NUMBER(5) NOT NULL,
    IDUsuario NUMBER(5) NOT NULL,
	nomeProfessor VARCHAR2 (50),
	notaMinima number(2),
	nomeDisciplina VARCHAR2(50)	
);

CREATE TABLE TB_ComposicaoNota
(	IDAtividade NUMBER(5) NOT NULL,
    IDDisciplina NUMBER(5) NOT NULL,
	nomeAtividade VARCHAR2 (30),
	descricaoAtividade VARCHAR2(50),
	tipoAtividade VARCHAR2(10),
	pesoAtividade NUMBER(3),
	notaAtividade number(2)
);

CREATE TABLE TB_Tarefa
(	IDTarefa NUMBER(5) NOT NULL,
    IDUsuario NUMBER(5) NOT NULL,
    Descricao VARCHAR2(50),
    DataInicial DATE,
    NomeTarefa VARCHAR(20),
    DataFinal DATE,
    Situacao CHAR(1) CHECK (Situacao IN ('T', 'F'))
);

CREATE TABLE TB_Subtarefa
(	IDSubtarefa NUMBER(5) NOT NULL,
    IDTarefa NUMBER(5) NOT NULL,
	Status VARCHAR2(20),
	Descricao VARCHAR2(50)
);

-- Adicionando as PK's e Constraint;
ALTER TABLE TB_Usuario ADD CONSTRAINT PK_Usuario_IDUsuario PRIMARY KEY( IDUsuario );
-- ALTER TABLE TB_ValidacaoOTP ADD CONSTRAINT PK_ValidacaoOTP_IDValOTP PRIMARY KEY( IDValOTP );
ALTER TABLE TB_Disciplina ADD CONSTRAINT PK_Disciplina_IDDisciplina PRIMARY KEY( IDDisciplina );
ALTER TABLE TB_ComposicaoNota ADD CONSTRAINT PK_ComposicaoNota_IIDAtividade PRIMARY KEY( IDAtividade );
ALTER TABLE TB_Tarefa ADD CONSTRAINT PK_Tarefa_IDTarefa PRIMARY KEY( IDTarefa );
ALTER TABLE TB_Subtarefa ADD CONSTRAINT PK_Subtarefa_IDSubTarefa PRIMARY KEY( IDSubTarefa );

-- Adicionando as FK's e Constraint;
ALTER TABLE TB_Subtarefa ADD CONSTRAINT FK_Subtarefa_IDTarefa FOREIGN KEY (IDTarefa) REFERENCES TB_Tarefa;
ALTER TABLE TB_Tarefa ADD CONSTRAINT FK_Tarefa_IDUsuario FOREIGN KEY (IDUsuario) REFERENCES TB_USUARIO;
ALTER TABLE TB_composicaoNota ADD CONSTRAINT FK_composicaoNota_IDDisciplina FOREIGN KEY (IDDisciplina) REFERENCES TB_ComposicaoNota;
ALTER TABLE TB_Disciplina ADD CONSTRAINT FK_Disciplina_IDUsuario FOREIGN KEY (IDUsuario) REFERENCES TB_Usuario;
>>>>>>> 3e12e04065723f6242539c4babf0549effb24b70
-- ALTER TABLE TB_ValidacaoOTP ADD CONSTRAINT FK_ValidacaoOTP_IDUsuario FOREIGN KEY (IDUsuario) REFERENCES TB_Usuario;