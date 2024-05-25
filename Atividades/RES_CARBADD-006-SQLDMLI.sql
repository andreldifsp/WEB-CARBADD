/*
CARBADD-006-SQLDML1
Soluções possíveis para os exercícios não corrigidos em sala
*/

-- SLIDE 26
-- DROP TABLE dependentes;

-- SLIDE 17

ALTER TABLE clientes MODIFY endereco VARCHAR(50) NOT NULL;

INSERT INTO clientes(cpf, rg, nome, endereco, cidade, uf, telefone, sexo, nascimento)
VALUES(15926348732, 'RJ654987123', 'João da Silva', 'Rua dos Ferroviários, 9871, Centro', 'Campos', 'RJ', 551435632145, 'M', '1981-12-05');

INSERT INTO clientes
VALUES(55566889911, 'ES2654987', 'Maria do Socorro', 'Rua Manoel Seraphim, 333, Vila Ema', 'Vitória', 'ES', 553556698745, 'F', '1999-09-22', 5000);

INSERT INTO clientes(cpf, rg, nome, endereco, cidade, uf, telefone, sexo, nascimento)
VALUES(22255544478, 'MG3265487', 'Talita Laia', 'Rua Prof André Duarte, 55 – Pampulha', 'Belo Horizonte', 'MG', 553665498755, 'F', '2015-01-02');

-- SLIDE 18
INSERT INTO vendedores
VALUES(335, 95135732165, 'Paula Toller', '2002-07-20', 'F', 5535654987321, 4200, 22);

INSERT INTO vendedores
VALUES(348, 98569856321, 'André Luis', '1979-12-05', 'M', 5535955889966, 3500, 15);

-- SLIDE 19
INSERT INTO produtos
VALUES(123456, 'TC LED CCE', 'Televisão 40"', 2300, 8, '50x40x5', '2005-01-01');

INSERT INTO produtos
VALUES(123457, 'XBOX ONE', 'Console Xbox One', 1200, 0.8, '20x10x50', '2005-01-01');

INSERT INTO produtos
VALUES(123458, 'TABLET ASUS', 'Tablet Asus 8.5"', 600, 0.2, '10x20x3', '2005-01-01');

-- SLIDE 20

INSERT INTO COMPRAS
VALUES(1, 15926348732, 335, 123456, '2021-10-05', '14:20', 1, 'ENTREGAR'),
	  (2, 15926348732, 335, 123457, '2021-10-05', '14:20', 1, 'ENTREGAR'),
      (3, 55566889911, 348, 123458, '2021-10-05', '16:40', 1, 'ENTREGUE');

INSERT INTO COMPRAS
VALUES(4, 65498732199, 348, 123457, '2021-10-06', '9:35', 2, 'PAGAMENTO');

/* Não é possível realizar a venda 4 pois o cpf 65498732199 não existe
em clientes */

-- SLIDE 21

DELETE
FROM compras
WHERE data = '2021-02-05';

DELETE
FROM clientes
WHERE uf = 'SP';

DELETE
FROM produtos
WHERE preco < 200;

DELETE
FROM vendedores
WHERE salario >= 1000 AND salario <= 2000;

-- SLIDE 32

SELECT cpf, nome, nascimento
FROM clientes
WHERE sexo = 'F' AND nascimento <= '2006-03-20';

SELECT *
FROM vendedores
WHERE sexo = 'M' AND salario >= 3000;

SELECT *
FROM  produtos
WHERE preco >= 1500 AND preco <= 2000 AND nome <> 'CELULAR LG';

SELECT *
FROM compras
WHERE data = '2021-11-04' AND quantidade <= 2;

SELECT *
FROM clientes
WHERE sexo IS NULL;

SELECT *
FROM clientes
WHERE sexo IS NULL OR salario IS NULL;

SELECT *
FROM clientes
WHERE sexo IS NULL AND salario IS NULL;

-- SLIDE 45
SELECT *
FROM clientes
WHERE sexo = 'F'
ORDER BY nascimento ASC;

SELECT *
FROM produtos
WHERE preco >= 1000 AND preco <= 1500
ORDER BY validade DESC;

SELECT *
FROM vendedores
WHERE sexo = 'F' AND salario < 5000
ORDER BY comissao DESC;

SELECT *
FROM compras
WHERE quantidade > 2
ORDER BY data DESC, hora ASC;

-- SLIDE 38

SELECT *
FROM vendedores
WHERE sexo = 'F'
ORDER BY salario DESC
LIMIT 3;

SELECT *
FROM clientes
ORDEr BY salario ASC
LIMIT 9, 5;

SELECT nome, preco
FROM produtos
LIMIT 19, 5;

SELECT cpf, data, hora
FROM compras
WHERE numero = 199
ORDER BY data DESC;