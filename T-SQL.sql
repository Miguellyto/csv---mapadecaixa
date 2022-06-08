--Criando o Banco Biblioteca
CREATE DATABASE db_Biblioteca
ON PRIMARY (NAME=db_Biblioteca,
FILENAME='C:\SQL\db_Biblioteca.MDF',
SIZE=6MB,
MAXSIZE=10MB,
FILEGROWTH=10%
)

USE db_Biblioteca

--LISTA OS BANCOS DE DADOS E DATALHES
--- EXEC sp_databases / sp_databases
--- EXEC sp_helpdb / sp_helpdb
--- SELECT * FROM sys.databases
--- SELECT * FROM sys.sysdatabases

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
Preco_Livro MONEY NOT NULL)

-- Criando a Tabela Autor
CREATE TABLE tbl_Autores(
    ID_Autor SMALLINT PRIMARY KEY,
    Nome_Autor VARCHAR(50),
    SobreNome_Autor  VARCHAR(60)
)

-- Criando a Tabela Editora
CREATE TABLE tbl_Editoras(
    ID_Editora SMALLINT PRIMARY KEY IDENTITY,
    Nome_Editora VARCHAR(50) NOT NULL
)

--SELECT * FROM tbl_Livros
--Excluíndo Colunas
USE db_Biblioteca
ALTER TABLE tbl_Livros
DROP COLUMN ID_Autores

--Criando a Conula ID_Autor FK
USE db_Biblioteca
ALTER TABLE tbl_Livros
ADD ID_Autor SMALLINT NOT NULL
CONSTRAINT fk_ID_Autor FOREIGN KEY (ID_Autor)
REFERENCES tbl_Autores

--Criando a Conula ID_Editora FK
ALTER TABLE tbl_Livros
ADD ID_Editora SMALLINT NOT NULL
CONSTRAINT fk_ID_Editora FOREIGN KEY(ID_Editora)
REFERENCES tbl_Editoras

--Alterando Coluna
ALTER TABLE tbl_Livros
ALTER COLUMN ID_Autor SMALLINT

--Excluíndo Tabela
DROP TABLE tbl_Livros

--Consultando a Versão do Banco de Dados
SELECT @@VERSION

--Inserindo Dados na Tabela Autores
INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (1, 'Daniel', 'Barret')

INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (2, 'Gerald', 'Carter')

INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (3, 'Mark', 'Sobell')

INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (4, 'William', 'Stanek')

INSERT INTO tbl_Autores (ID_Autor, Nome_Autor, SobreNome_Autor)
VALUES (5, 'Richard', 'Blum')

--Inserindo Dados na Tabela Editores
INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('O Reilly')

INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('Prentice Hall')

INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('Microsoft Press')

INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('Wileey')

INSERT INTO tbl_Editoras (Nome_Editora)
VALUES ('Prentice Hall')

--Inserindo Dados na Tabela Livros
INSERT INTO tbl_Livro (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
VALUES ('Linux Command LIne and Shel Scripting', 1438566969, '20091221', 68.35,5,4)

INSERT INTO tbl_Livro (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
VALUES ('SSH, THE Secure Shell', 127658789, '20091221', 58.30,1,2)

INSERT INTO tbl_Livro (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
VALUES ('Using Samba', 123856789, '20001221', 61.45,2,2)

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora)
VALUES ('Fedora and Red Hat Linux', 123346789, '20101101', 62.24,3,1)

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora)
VALUES ('Windows Server 2012 Inside Out', 123356789, '20040517', 66.80,4,3)

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Autor, ID_Editora)
VALUES ('Microsoft Exchange Server 2010', 123366789, '20001221', 45.30,4,3)

--Conta o número de registro
SELECT COUNT(*) FROM tbl_Livros

--Limpa todos os registro da tabela
TRUNCATE TABLE tbl_Livros

--Selecionando e organizando em ordem alfabetica pela coluna Livros ASC / DESC
SELECT * FROM tbl_Livros
ORDER BY Nome_Livro DESC

SELECT Nome_Livro, ISBN
FROM tbl_Livros
ORDER BY Nome_Livro DESC

--Selecionar dados não dulicado da tabela
SELECT DISTINCT 

--Alias AS, 
SELECT Nome_Livro AS Livro, Preco_Livro AS 'Preço do Livro'
FROM tbl_livros;

--Podemos aplicar um alias a uma coluna sem a necessidade de usar a palavra AS, 
SELECT Nome_Livro Livro, Preco_Livro 'Preço do Livro'
FROM tbl_livros;