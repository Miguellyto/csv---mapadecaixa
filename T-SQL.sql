--Criando o Banco Biblioteca
CREATE DATABASE db_Biblioteca
ON PRIMARY (NAME=db_Biblioteca,
FILENAME='C:\SQL\db_Biblioteca.MDF',
SIZE=6MB,
MAXSIZE=10MB,
FILEGROWTH=10%
);

USE db_Biblioteca;

--LISTA OS BANCOS DE DADOS E DATALHES
--- EXEC sp_databases / sp_databases
--- EXEC sp_helpdb / sp_helpdb
--- SELECT * FROM sys.databases
--- SELECT * FROM sys.sysdatabases
--- SELECT name, database_id, create_date FROM sys.databases;  

--LISTA DATALHES DA TABELA
--- sp_helpdb db_Biblioteca

--LISTA DATALHES DA TABELA
--- sp_help tbl_Livros

-- Criando a Tabela LIvro
CREATE TABLE tbl_Livros
(ID_Livro SMALLINT PRIMARY KEY IDENTITY(100,1),
Nome_Livro VARCHAR (50) NOT NULL,
ISBN VARCHAR (30) NOT NULL UNIQUE,
ID_Autor SMALLINT NOT NULL,
Data_Pub DATETIME NOT NULL,
Preco_Livro MONEY NOT NULL
);

-- Criando a Tabela Autor
CREATE TABLE tbl_Autores(
    ID_Autor SMALLINT PRIMARY KEY,
    Nome_Autor VARCHAR(50),
    SobreNome_Autor  VARCHAR(60)
);

-- Criando a Tabela Editora
CREATE TABLE tbl_Editoras(
    ID_Editora SMALLINT PRIMARY KEY IDENTITY,
    Nome_Editora VARCHAR(50) NOT NULL
);

--SELECT * FROM tbl_Livros
--Excluíndo Colunas
USE db_Biblioteca
ALTER TABLE tbl_Livros
DROP COLUMN ID_Autores;

--Criando a Conula ID_Autor FK
USE db_Biblioteca
ALTER TABLE tbl_Livros
ADD ID_Autor SMALLINT NOT NULL
CONSTRAINT fk_ID_Autor FOREIGN KEY (ID_Autor)
REFERENCES tbl_Autores;

--Criando a Conula ID_Editora FK
ALTER TABLE tbl_Livros
ADD ID_Editora SMALLINT NOT NULL
CONSTRAINT fk_ID_Editora FOREIGN KEY(ID_Editora)
REFERENCES tbl_Editoras;

--Alterando Coluna
ALTER TABLE tbl_Livros
ALTER COLUMN ID_Autor SMALLINT;

--Excluíndo Tabela
DROP TABLE tbl_Livros;

--Consultando a Versão do Banco de Dados
SELECT @@VERSION;

--Inserindo Dados na Tabela Autores
INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (1, 'Daniel', 'Barret');

INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (2, 'Gerald', 'Carter');

INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (3, 'Mark', 'Sobell');

INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (4, 'William', 'Stanek');

INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (5, 'Richard', 'Blum');

--Inserindo Dados na Tabela Editores
INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('O Reilly');

INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('Prentice Hall');

INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('Microsoft Press');

INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('Wileey');

INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('Prentice Hall');

--Inserindo Dados na Tabela Livros
INSERT INTO tbl_Livro (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
VALUES ('Linux Command LIne and Shel Scripting', 1438566969, '20091221', 68.35,5,4);

INSERT INTO tbl_Livro (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
VALUES ('SSH, THE Secure Shell', 127658789, '20091221', 58.30,1,2);

INSERT INTO tbl_Livro (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
VALUES ('Using Samba', 123856789, '20001221', 61.45,2,2);

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora)
VALUES ('Fedora and Red Hat Linux', 123346789, '20101101', 62.24,3,1);

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora)
VALUES ('Windows Server 2012 Inside Out', 123356789, '20040517', 66.80,4,3);

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora)
VALUES ('Microsoft Exchange Server 2010', 123366789, '20001221', 45.30,4,3);

--Conta o número de registro
SELECT COUNT(*) FROM tbl_Livros;

--Limpa todos os registro da tabela
TRUNCATE TABLE tbl_Livros;

--Selecionando e organizando em ordem alfabetica pela coluna Livros ASC / DESC
SELECT * FROM tbl_Livros
ORDER BY Nome_Livro DESC;

SELECT Nome_Livro, ISBN
FROM tbl_Livros
ORDER BY Nome_Livro DESC;

--Selecionar dados não dulicado da tabela
SELECT DISTINCT ID_Autor
FROM tbl_Livros;

--Usando o WHERE
SELECT * FROM tbl_Livros WHERE ID_Autor='1';

SELECT ID_Autor FROM tbl_Autores WHERE Sobrenome_Autor='Stanek';

--Operador AND e OR
 SELECT * FROM tbl_Livros
 WHERE ID_Livro > 2 AND ID_Autor <3;

 SELECT * FROM tbl_Livros
 WHERE ID_Livro > 2 OR ID_Autor <3;

--Utilizando o UPDATE
UPDATE tbl_Livros 
SET preco_Livro = 65.45
WHERE ID_Livro = 102;

UPDATE tbl_Autores
SET SobreNome_Autor = 'Miguel'
WHERE ID_Autor = 2;

UPDATE tbl_Livros 
SET preco_Livro = 80.40, ISBN = '020203'
WHERE ID_Livro = 101;

--Utilizando o TOP ou PERCENT
SELECT TOP 3 PERCENT Nome_Livro
FROM tbl_Livros;
SELECT TOP 2 Nome_Livro
FROM tbl_Livros

--Alias AS 
SELECT Nome_Livro AS Livro, Preco_Livro AS 'Preço do Livro'
FROM tbl_livros;

--Podemos aplicar um alias a uma coluna sem a necessidade de usar a palavra AS, 
SELECT Nome_Livro Livro, Preco_Livro 'Preço do Livro'
FROM tbl_livros;

--Utilizando o UNION. As 2 tabelas tem que ter o mesmo numero de linhas
SELECT ID_Autor FROM tbl_Autores
UNION ALL
SELECT ID_Autor FROM tbl_Livros;
SELECT ID_Autor FROM tbl_Autores
UNION ALL
SELECT ID_Autor FROM tbl_Livros;

--Criando uma nova tabela com os dados de outra com o SELECT INTO
SELECT ID_Livro, Nome_Livro, ISBN 
INTO Livros_ISBN
FROM tbl_Livros
WHERE ID_Livro > 2;

--verificando a nova tabela
SELECT * FROM Livros_ISBN;

--Fazendo o BKP  de uma tabela com o SELECT INTO
SELECT *
INTO tbl_Livro_bkp
FROM tbl_Livros;

--Funções Agregadas MIN, MAX, AVG, SUM, COUNT
SELECT COUNT(*) FROM tbl_Autores
SELECT COUNT(Nome_Autor) FROM tbl_Autores
SELECT MAX(preco_Livro) FROM tbl_Livros
SELECT MIN(preco_Livro) FROM tbl_Livros
SELECT AVG(preco_Livro) FROM tbl_Livros
SELECT SUM(preco_Livro) FROM tbl_Livros;

SELECT MAX(preco_Livro) AS PreçoMaximo FROM tbl_Livros
SELECT MIN(preco_Livro) AS PreçoMinimo FROM tbl_Livros
SELECT AVG(preco_Livro) AS MédiaPreço FROM tbl_Livros
SELECT SUM(preco_Livro) AS PreçoTotal FROM tbl_Livros;

SELECT
COUNT(*) AS QTDLivros, 
MIN(preco_Livro) AS PreçoMinimo, 
MAX(preco_Livro) AS PreçoMaximo, 
AVG(preco_Livro) AS PreçoMédio,  
SUM(preco_Livro) AS Total 
FROM tbl_Livros;

--Seleção de intervalos BETWEEN
SELECT * FROM tbl_Livros
WHERE Data_Pub BETWEEN '20040517' AND '20100517';
SELECT Nome_Livro AS Livro, Preco_Livro AS Preço
FROM tbl_Livros
WHERE Preco_Livro BETWEEN 40.00 AND 60.00;

SELECT * FROM tbl_livros
WHERE Data_Pub BETWEEN '20000101' AND '20050101'
OR Data_Pub BETWEEN '20100101' AND '20140101'
AND Preco_Livro > 50.00
ORDER BY Data_Pub DESC

--Os operadores LIKE e NOT LIKE para fazer pesquisa
--Nomes de livros que começa com a letra 'S'
SELECT Nome_Livros FROM tbl_Livros
WHERE Nome_Livros LIKE 'S%'

--Nomes de livros que termina com a letra 'G'
SELECT Nome_Livros FROM tbl_Livros
WHERE Nome_Livros LIKE '%g'

--Conta quantos livros que começa com a letra 'R'
SELECT COUNT(*) FROM tbl_Autores 
WHERE Nome_Autor LIKE 'r%'

--Quantos livros que a segunda letra é a 'i'
SELECT Nome_Livro FROM tbl_Livros
WHERE Nome_Livro LIKE '_i%'

--Pesquisa os livros que começa com a letra 'S' ou 'L' independente do que vem depois.
SELECT Nome_Livro FROM tbl_Livros
WHERE Nome_Livro LIKE '[SL]%'

--Pesquisa os livros que terminam com a letra 'G' ou 'L' independente do que vem no inicio.
SELECT Nome_Livro FROM tbl_Livros
WHERE Nome_Livro LIKE '%[GL]'

--Pesquisa os livros que a segunda letra seja 'i' ou 's' independente do que vem depois.
SELECT Nome_Livro FROM tbl_Livros
WHERE Nome_Livro LIKE '_[is]%'

--
SELECT Nome_Livro FROM tbl_Livros
WHERE Nome_Livro LIKE '_i__o%'

--Pesquisa todos os livros que não começa com a letra 'M'
SELECT Nome_Livro FROM tbl_Livros
WHERE Nome_Livro NOT LIKE 'M%'

