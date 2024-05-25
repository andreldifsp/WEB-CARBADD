/*
CARBADD-005-SQLDDL
Soluções possíveis para os exercícios não corrigidos em sala
*/

-- SLIDE 35

CREATE TABLE clientes(
  cpf 	 	 BIGINT 		PRIMARY KEY,
  rg 		 VARCHAR(11)	UNIQUE 		NOT NULL,
  nome 	 	 VARCHAR(20) 				NOT NULL,
  endereco 	 VARCHAR(20) 				NOT NULL,
  cidade 	 VARCHAR(20)				NOT NULL DEFAULT 'Caraguatatuba',
  uf 		 CHAR(2) 					NOT NULL,
  telefone 	 BIGINT 					NOT NULL,
  sexo 	 	 CHAR,
  nascimento DATE 						NOT NULL,
  salario 	 DECIMAL(10,2)
);

CREATE TABLE vendedores (
    registro	INT			PRIMARY KEY,
    cpf			BIGINT		UNIQUE 		NOT NULL,
    nome		VARCHAR(50)			 	NOT NULL,
    nascimento 	DATE				 	NOT NULL,
    sexo		CHAR				 	NOT NULL,
    telefone	BIGINT				 	NOT NULL,
    salario		DECIMAL(10,2)		 	NOT NULL,
    comissao	DECIMAL(10,2)		 	NOT NULL
);

CREATE TABLE produtos (
    numero		INT		   	PRIMARY KEY,
    nome		VARCHAR(20)	   			NOT NULL,
    descricao 	VARCHAR(50)	   			NOT NULL,
    preco		DECIMAL(10,2) 			NOT NULL,
    peso		DECIMAL(10,2),
    dimensoes	VARCHAR(12),
    validade	DATE		    		NOT NULL
);

CREATE TABLE compras (
    codigo			INT		 	PRIMARY KEY	AUTO_INCREMENT,
    cpf				BIGINT				NOT NULL,
    registro 		INT		 			NOT NULL,
    numero			INT		 			NOT NULL,
    data			DATE				NOT NULL,
    hora			TIME				NOT NULL,
    quantidade		INT		 			NOT NULL,
    status			VARCHAR(20) 		NOT NULL,
    CONSTRAINT FK_COMPRAS_CLICPF FOREIGN KEY (cpf) REFERENCES clientes(cpf),
    CONSTRAINT FK_COMPRAS_VENDREG FOREIGN KEY (registro) REFERENCES vendedores(registro),
    CONSTRAINT FK_COMPRAS_PRODNUM FOREIGN KEY (numero) REFERENCES produtos(numero)
);

describe PRODUTOS;
SELECT * FROM PRODUTOS;

-- SLIDE 37

ALTER TABLE clientes ADD COLUMN email VARCHAR(100) ;

ALTER TABLE vendedores ADD COLUMN email VARCHAR(100) ;

ALTER TABLE produtos RENAME COLUMN preco TO valor;

ALTER TABLE compras RENAME TO vendas;

ALTER TABLE clientes DROP COLUMN salario;

ALTER TABLE clientes MODIFY endereco VARCHAR(100) NOT NULL;

ALTER TABLE produtos ADD COLUMN unidade DECIMAL(10,2) NOT NULL;