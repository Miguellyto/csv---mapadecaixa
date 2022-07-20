--Criando o Banco Biblioteca

-- https://db-engines.com/en/ranking
--Ação 	Standard https://docs.microsoft.com/pt-br/sql/ssms/sql-server-management-studio-keyboard-shortcuts?view=sql-server-ver16
--COMENTA LINHA NO SQL STUDIO
CTRL+K, CTRL+C --Transformar o texto selecionado em um comentário 	
CTRL+K, CTRL + U --Remover comentário do texto selecionado 	
CTRL + ; --COMENTA LINHA NO VSCODE

SQL
LE005TIC02\SQLEXPRESS
LASER\lmiguel

--USE ecommerce
sp_helpdb ecommerce

CREATE DATABASE db_Biblioteca
ON PRIMARY (NAME=db_Biblioteca,
FILENAME='C:\SQL\db_Biblioteca.MDF',
SIZE=6MB,
MAXSIZE=10MB,
FILEGROWTH=10%
);

USE db_Biblioteca

--LISTA OS BANCOS DE DADOS E DATALHES
EXEC sp_databases / sp_databases
EXEC sp_helpdb / sp_helpdb
SELECT * FROM sys.databases
SELECT * FROM sys.sysdatabases
SELECT name, database_id, create_date FROM sys.databases
--Collation - Agrupamento de Caracteres ou Colação
SELECT * FROM fn_helpcollations()
SELECT SERVERPROPERTY('Collation') AS 'Colecao Usada no Banco'
--obs.: Latin1_General_CI_AS
--CI = A Case Insencitive.
--AS = faz difereça entre palavras com e em acentos.

--Alterar o Collation do Banco de Dados
ALTER DATABASE db_Biblioteca
COLLATE Latin1_General_CI_AS

--LISTA DATALHES DO BANCO DE DADOS
sp_helpdb db_Biblioteca

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

--Tipo de dado TIME no SQL Server - Armazenar horários em uma tabela
CREATE TABLE tbl_visitas
(id_visita INT PRIMARY KEY IDENTITY,
nome_visitante VARCHAR(50) NOT NULL,
CPF VARCHAR(11) NOT NULL,
APT_visitado SMALLINT NOT NULL,
data_visita DATE NOT NULL,
hora_entr TIME(0) NOT NULL,
hora_sai TIME(0) not NULL);

--Inserindo dados na tbl_visitas
INSERT INTO tbl_visitas(
    nome_visitante,CPF,APT_visitado,data_visitada,hora_entr,hora_sai
)
VALUES(
    'Fábio dos Reis',
    '123654897',
    19,
    GETDATE(),
    '14:05:00',
    '18:10:00'
)

--Verificando quanto tempo do visitante 
SELECT DATEDIFF(MINUTE,hora_entr,hora_sai) AS Permanencia
FROM tbl_visitas


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
ALTER COLUMN ID_Autor SMALLINT

--LISTA DATALHES DA TABELA
sp_help tbl_Livros

--LISTANDO TABELAS DO BANCO DE DADOS
SELECT * FROM sys.tables

--Renomeando Coluna
sp_rename 'tbl_Livros.Nome_Livro', 'Livro', 'COLUMN'

--Consultando a tbl_Lviros
SELECT * FROM tbl_Livros

--Renomeando a Tabela
sp_rename 'tbl_Livros', 'Livros'

--Consultando a tbl_Lviros
SELECT * FROM Livros

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
INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
VALUES ('Linux Command LIne and Shel Scripting', 1438566969, '20091221', 68.35,5,4);

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
VALUES ('SSH, THE Secure Shell', 127658789, '20091221', 58.30,1,2);

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub, Preco_Livro, ID_Editora)
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

--Utilizando o UPDATE atualizando registros
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
FROM tbl_livros

--Sintaxe de alias para colunas e tabelas
SELECT A.Nome_Livro AS Livro, A.Preco_Livro AS 'Preço do Livro'
FROM tbl_livros AS A;

--Podemos aplicar um alias a uma coluna sem a necessidade de usar a palavra AS, 
SELECT Nome_Livro Livro, Preco_Livro 'Preço do Livro'
FROM tbl_livros

--
SELECT A.Nome_Livro Livro, A.Preco_Livro 'Preço do Livro'
FROM tbl_livros A;

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

--Selecionar dados de 2/mais tabelas: 'JOIN', 'INNER JOIN' e 'OUTER JOIN'
SELECT * FROM tbl_Livros
INNER JOIN tbl_Autores
ON tbl_livros.ID_Autor = tbl_Autores.ID_Autor --O ponto de ligação é a pk de um tabela com a fk da outra.

SELECT tbl_Livros.Nome_Livro, tbl_Livros.ISBN,
TBL_Autores.Nome_Autor
FROM tbl_Livros
INNER JOIN tbl_Autores
ON tbl_Livros.ID_Autor = tbl_Autores.ID_Autor

--Usando Alias 'AS'
SELECT L.Nome_Livro, E.Nome_Editora
FROM tbl_Livros AS L
INNER JOIN tbl_Editoras AS E
ON L.ID_Editora = E.ID_Editora

--LEFT e RIGHT - Selecionar dados de várias tabelas - SQL Server
SELECT * FROM tbl_Autores --tabela da esquerda
LEFT JOIN tbl_Livros --tabela da direita
ON tbl_Livros.ID_Autor = tbl_Autores.ID_Autor

--LEFT JOIN excluindo correspondências
SELECT * FROM tbl_Autores --tabela da esquerda
LEFT JOIN tbl_Livros --tabela da direita
ON tbl_Livros.ID_Autor = tbl_Autores.ID_Autor
WHERE tbl_Livros.ID_Autor IS NULL --lista os registro que não tem correspondencia com a tabela da direita (Quando o ID do Autor for NULL)

--RIGHT JOIN - Trasendo dados da tabela da direita
SELECT * FROM tbl_Livros AS L
RIGHT JOIN tbl_Editoras AS E
ON L.ID_Editora = E.ID_Editora

--RIGHT JOIN excluindo correspondências
SELECT * FROM tbl_Livros
RIGHT JOIN tbl_Editoras
ON tbl_Livros.ID_Editora = tbl_Editoras.ID_Editora
WHERE tbl_Livros.ID_Editora IS NULL

--FULL JOIN - listas os dados mesmo não possuindo correspondencia entre si
SELECT L.Nome_Livro, L.ID_Autor, A.Nome_Autor
FROM tbl_Livros AS L
FULL JOIN tbl_Autores AS A
ON L.ID_Autor = A.ID_Autor

--FULL JOIN - excluindo correspondências. Lista dados com o ID_Autor NULL.
SELECT L.Nome_Livro, L.ID_Autor, A.Nome_Autor
FROM tbl_Livros AS L
FULL JOIN tbl_Autores AS A
ON L.ID_Autor = A.ID_Autor
WHERE L.ID_Autor IS NULL
OR A.ID_Autor IS NULL

-- IN - Filtro de Múltiplas condições.
SELECT * FROM tbl_Livros
WHERE ID_Autor IN (1, 2) --lista apenas os livros onde os id do autor for 1 e 2

-- NOT IN - Filtro de Múltiplas condições.
SELECT * FROM tbl_Livros
WHERE ID_Autor NOT IN (1, 2) --lista todos os livros menos os IDs dos autores não seja 1 e 2

--Campos Calculados - Cálculos - SQL Server
CREATE TABLE Produtos (
    codProduto smallint, 
    NomeProduto varchar(20), 
    Preco money, 
    QTD smallint, 
    Total As (Preco * QTD)
    )

-- Inserindo dados na tabela Produtos
INSERT INTO Produtos VALUES (1, 'Mouse', 15.00, 2)
INSERT INTO Produtos VALUES (2, 'Teclado', 18.00, 1)
INSERT INTO Produtos VALUES (2, 'Fones', 25.00, 1)
INSERT INTO Produtos VALUES (4, 'Pendrive', 30.00, 3)
INSERT INTO Produtos VALUES (5, 'SD Card', 29.00, 2)
INSERT INTO Produtos VALUES (6, 'DVD-R', 1.30, 12)

--Somando tudo da coluna TOTAL
SELECT SUM(Total) FROM Produtos

--Criando Indeces
--OBS.: Crie em tabelas que recebem muitas consultas. Tabelas indexadas levam mais tempo para serem atualizadas.
CREATE INDEX indice_livro
ON tbl_livros (Nome_Livro)

--Criando Regras para que os preços dos livros seja sempre maior que 10.00
--OBS.: não precisa usar: USE db_Biblioteca para criar a RULE.
CREATE RULE rl_preco AS @VALOR > 10.00

--Aplicando a REGRA. Vinculando a RULE a uma tabela.
EXECUTE sp_bindrule rl_preco, 'tbl_Livros.Preco_Livro'

--Testando a regra
UPDATE tbl_livros
SET Preco_Livro = 50.00
WHERE ID_Livro = 105

UPDATE tbl_livros
SET Preco_Livro = 9.90
WHERE ID_Livro = 101

--Backup do Banco de Dados e Restauração - SQL Server
BACKUP DATABASE db_Biblioteca
TO DISK = 'C:\BKP DESKTOP\MAPA DE CAIXA\csv - mapadecaixa\db_Biblioteca.bak';

--Concatenando Strings
SELECT Nome_autor + ' ' + Sobrenome_autor AS 'Nome Completo' FROM tbl_Autores 

-- Cláusula WITH TIES
SELECT TOP(5) WITH TIES Nome_Livro, Preco_Livro
FROM tbl_livros
ORDER BY preco_livro DESC

--VIEWS (Exibições) - Criar, Alterar e Excluir
--Ex.:
CREATE VIEW [Nome_Exibição]
AS SELECT colunas
FROM tabela
WHERE condições

CREATE VIEW vw_LivrosAutores
AS SELECT tbl_Livros.Nome_Livro AS Livro,
tbl_Autores.Nome_Autor AS Autor
FROM tbl_Livros
INNER JOIN tbl_Autores
ON tbl_Livros.ID_Autor = tbl_Autores.ID_autor

--Usando a VIEW
SELECT Livro, Autor
FROM vw_LivrosAutores
--WHERE Livro LIKE 's%'

--Alteração da Views. Acrescentando a coluna VALOR.
ALTER VIEW vw_LivrosAutores AS 
SELECT tbl_Livros.Nome_Livro AS Livro, 
tbl_Autores.Nome_Autor AS Autor, Preco_Livro AS Valor,
FROM tbl_Livros
INNER JOIN tbl_Autores
ON tbl_Livros.ID_Autor = tbl_Autores.ID_Autor

--Usando a VIEW
SELECT * FROM vw_LivrosAutores

--Excluindo a VIEW
DROP VIEW vw_LivosAutores

--Subconsultas (subqueries) com Tabelas Derivadas
SELECT Resultado.Cliente, SUM(Resultado.Total) AS Total
FROM
(SELECT CL.Nome_Cliente AS Cliente, PR.Preco_Produto * CO.Quantidade AS Total
FROM Cliente AS CL 
INNER JOIN Compras AS CO
ON CL.ID_Cliente = CO.ID_Cliente
INNER JOIN Produtos AS PR
ON CO.ID_Produto = PR.ID_Produto) AS Resultado

GROUP BY Resultado.Cliente
ORDER BY Total

--CTE - Common Table Expression (subconsultas). 
---Listando a soma das compras dos clientes
WITH ConsultaCTE (Cliente, Total)
AS (SELECT CL.Nome_Cliente AS Cliente,
PR.Preco_Produto * CO.Quantidade AS Total
FROM Clientes AS CL 
INNER JOIN Compras AS CO
ON CL.ID_Cliente = CO.ID_Cliente
INNER JOIN Produtos AS PR
ON CO.ID.Produto = PR.ID_Produto)

SELECT Cliente, SUM(Total) AS ValorTotal
FROM ConsultaCTE
GROUP BY Cliente
ORDER By ValorTotal

-- Variáveis - Declaração e atribuição de valores
DECLARE @livro VARCHAR(38)
SELECT @livro = nome_livro
FROM tbl_livros
WHERE ID_Livro = 101
SELECT @livro AS 'Nome do Livro'

--
DECLARE @preco MONEY, @quantidade INT, @nome VARCHAR(30)
SET @quantidade = 5

SELECT @preco = Preco_Livro, @nome = Nome_Livro
FROM tbl_livros
WHERE ID_Livro = 101

SELECT @nome AS 'Nome do Livro', @preco * @quantidade AS 'Preço dos Livros'

--Conversão de Tipos de Dados no SQL Server com Cast e Convert
---http://msdn.microsoft.com/pt-br/library/ms187928.aspx
SELECT 'A data de publicação ' +
CONVERT(VARCHAR(18),Data_Pub, 103)
FROM tbl_livro
WHERE ID_Livro = 102

--Stored Procedures - Criação e Execução
CREATE PROCEDURE p_LivroValor
AS
SELECT Nome_Livro, preco_livro
FROM tbl_livros

--Execultando o Stored Procedures
EXEC p_LivroValor

--Verificando o código de criação do Stored Procedures
EXEC sp_helptext p_LivroValor

--Criando um Stored Procedures Criptografado
---OBS.: O Stored Procedures Criptografado não pode ser visto com o comando: EXEC sp_helptext p_LivroISBN.
CREATE PROCEDURE p_LivroISBN
WITH ENCRYPTION
AS
SELECT Nome_Livro, ISBN
FROM tbl_Livros

--Alteração e Parâmetros de Entrada: Stored Procedures
ALTER PROCEDURE p_LivroValor
(@ID SMALLINT)
AS
SELECT Nome_Livros as Livro, Preco_Livro as Preço
FROM tbl_Livros
WHERE ID_Livros = @ID

--Testando a alteeração
EXEC p_LivroValor 104

--Stored Procedures - Parâmetros de Entrada 
ALTER PROCEDURE p_LivroValor
(@ID SMALLINT, @Preco money)
AS
SELECT Nome_Livro AS Livro, Preco_Livro AS Preço
FROM tbl_Livros
WHERE ID_Livro > @ID AND Preco_Livro > @Preco

--Testando a alteeração
EXEC p_LivroValor @ID = 103, @Preco = 60

--Stored Procedures - Parâmetros de Entrada p2
ALTER PROCEDURE p_LivroValor
(@Quantidade SMALLINT, @id SMALLINT)
AS
SELECT Nome_Livro AS Livro, Preco_livro * @Quantidade AS Preço
FROM tbl_Livros
WHERE ID_Livro = @ID

--Testando a alteeração
EXEC p_LivroValor @ID = 104, @Quantidade = 10

--Inserindo dados na Stored Procedures
CREATE PROCEDURE p_insere_editora
(@nome VARCHAR(50))
AS
INSERT INTO tbl_editoras (Nome_Editora)
VALUES (@nome)

--Testando a inserção de dados
EXEC p_insere_editora @nome = 'Apress'
--
SELECT * FROM tbl_editoras

--Stored Procedures - Parâmetros de Saída e RETURN
CREATE PROCEDURE p_teste_valor_padrão(
    @param1 INT,
    @param2 VARCHAR(20) = 'Valor pradrão!')
AS
SELECT 'Valor do parâmetro 1:' + CAST(@param1 AS VARCHAR)
SELECT 'Valor do parâmetro 2:' + @param2

--Testando o Parâmetros de Saída e RETURN
EXEC p_teste_valor_padrão 30
EXEC p_teste_valor_padrão @param1 = 40, @param2 = 'Valor Modificado'

--Stored Procedures - Parâmetros de Saída e RETURN p4
ALTER PROCEDURE p_LivroValor (
    @Quantidade SMALLINT, @Cod SMALLINT = -10,
    @ID SMALLINT)
AS
--SET NOCOUNT ON
IF @ID >= 100
    BEGIN
        SELECT Nome_Livro AS Livro,
        preco_Livro * @Quantidade AS Preço
    FROM tbl_Livros
    WHERE ID_Livro = @ID 
    RETURN 1
    END
ELSE
    RETURN @Cod

--Testando o Stored Procedures - Parâmetros de Saída e RETURN p4 CIMA:
DECLARE @Codigo INT
EXEC @Codigo = p_LivroValor @ID = 102, @Quantidade = 5
PRINT @Codigo

--Funções Definidas pelo Usuário - Valor de Tabela Embutida
CREATE FUNCTION retorna_itens (@valor REAL)
RETURNS table
AS
RETURN(
    SELECT L.Nome_Livro, A.Nome_Autor, E.Nome_Editora
    FROM tbl_Livros AS L
    INNER JOIN tbl_Autores AS A
    ON L.ID_Autor = A.ID_Autor
    INNER JOIN tbl_Editoras AS E
    ON L.ID_Editora = E.ID_Editora
    WHERE L.Preco_Livro > @valor)

--Testando as Funções Definidas pelo Usuário - Valor de Tabela Embutida
SELECT Nome_Livro, Nome_Autor
FROM retorna_itens(62.00)

--Funções Definidas pelo Usuário - Valor de Tabela Embutida p2
CREATE FUNCTION multi_tabela ()
RETURNS @valores TABLE
    (Nome_Livro VARCHAR(50),
    Data_Pub DATETIME, Nome_Editora VARCHAR(50),
    Preco_Livro MONEY)
AS
BEGIN
INSERT @valores (Nome_Livro, Data_Pub, Nome_Editora, Preco_Livro)
    SELECT L.Nome_Livro, L.Data_Pub, E.Nome_Editora, L.Preco_Livro
    FROM tbl_Livros AS L
    INNER JOIN tbl_Editoras AS E
    ON L.ID_Editora = E.ID_Editora
RETURN
END

--Testando a Funções Definidas pelo Usuário - Valor de Tabela Embutida p2
SELECT * FROM multi_tabela()

--Triggers - Criação e Testes dos modos After
CREATE TRIGGER teste_trigger_after
ON tbl_editoras
AFTER INSERT
AS
PRINT 'Registro Inserido com Sucesso!'

--Testando o Triggers
INSERT INTO tbl_Editoras VALUES ('Cultura')
--
SELECT * FROM tbl_editoras

--Triggers - Criação e Testes dos modos After p2
CREATE TRIGGER trigger_after
ON tbl_editoras
AFTER INSERT
AS
INSERT INTO tbl_Autores VALUES(25,'Jose', 'da Silva')
INSERT INTO tbl_Livros VALUES ('O Casino', '123456000', '20001010',77,25,2)

--Testando o Triggers p2
INSERT INTO tbl_Editoras VALUES ('Ed.Cultura')
--
SELECT * FROM tbl_editoras

--Triggers - Criação e Testes dos modos insteadOF
CREATE TRIGGER teste_trigger_insteadOF
ON tbl_Autores
INSTEAD OF INSERT
AS
PRINT 'A inserção disparou o Tigger INSTEADOF '

--Testando o Triggers p2
INSERT INTO tbl_Autores VALUES (26,'Belizario','Slva')
--
SELECT * FROM tbl_Autores

--Excluindo um TRIGGER
DROP TRIGGER teste_trigger_after

--Desabilitar e verificar Status de um TRIGGER
ALTER TABLE tbl_Editoras
DISABLE TRIGGER trigger_after

--Habilitar e verificar Status de um TRIGGER
ALTER TABLE tbl_Editoras
ENABLE TRIGGER trigger_after

--Verificar Status de um TRIGGER
EXEC sp_helptrigger @tabname = tbl_editoras

--Verificar TRIGGER no Banco de Dados
USE db_Biblioteca
SELECT * FROM sys.triggers
WHERE is_disabled = 1 OR is_disabled = 0

--Triggers - Determinar colunas alteradas e função update()
CREATE TRIGGER trigger_after_autores
ON tbl_Autores
AFTER INSERT, UPDATE
AS
IF UPDATE(nome_autor)
    BEGIN
        PRINT 'O nome do autor foi alterado'
    END
ELSE
    BEGIN
        PRINT 'Nome não foi modificado'
    END

--Testando o Triggers - Determinar colunas alteradas e função update()
UPDATE tbl_Autores
SET nome_autor = 'João'
WHERE ID_autor = 10

--

--Backup do Banco de Dados e Restauração - SQL Server
BACKUP DATABASE db_Biblioteca
TO DISK = 'C:\BKP DESKTOP\MAPA DE CAIXA\csv - mapadecaixa\db_Biblioteca.bak'

db-engines.com

--QUERY PARA POWERBI
SELECT 
e.CODIGO || ' - ' || e.NOME || ' - ' || e.CGCCPF AS FILIAL,
e.ENDERECO || ' - ' || e.BAIRRO AS ENDERECO,
e.CIDADE,
t.CODIGO AS UF,
e.CEP,
p.CHAVE AS PEDIDO,
p.CFO,
p.NUMERO AS NºNOTA,
ent.CODIGO || ' - ' || ent.NOME || ' (' || ent.CGCCPF || ') ' AS CLIENTE,
en.CODIGO || ' - ' || en.NOME || ' (' || en.CGCCPF || ') ' AS VENDEDOR,
r.NOME AS PRODUTO,
p.TOTALLIQUIDO AS PRECO,
p.QUANTIDADE AS QTD,
p.TOTAL,
P.EMISSAOPED AS DATAPED,
P.EMISSAOPEDH AS HORAPED
FROM PEDIDO p
JOIN ENTIDADE e
ON p.ESTABELECIPED = e.CHAVE
JOIN ENTIDADE en
ON p.REPRESENTA = en.CHAVE
JOIN ENTIDADE ent
ON p.PESSOA = ent.CHAVE
JOIN TABELA t
ON p.UFPESSOAOP = t.CHAVE
JOIN RECURSO r
ON p.RECURSO = r.CHAVE
-- WHERE EMISSAOPED = '11/07/2019 00:00:00'
---- WHERE EMISSAOPED BETWEEN '11/07/2019 00:00:00' AND '12/07/2019 00:00:00'
---- OR EMISSAOPED BETWEEN '12/07/2019 00:00:00' AND '13/07/2019 00:00:00'
---- AND PRECO < 50.00
---- ORDER BY PRODUTO DESC
-- WHERE e.CODIGO = '102' --Código da Filial
-- WHERE en.CODIGO = '3451414' --Código do Vendedor
-- WHERE p.CHAVE = 835303426 --Chave do Pedido
LIMIT 20

--USANDO O DISTINCT
--TRAZER TODAS AS FILIAIS
SELECT DISTINCT
e.CODIGO || ' - ' || e.NOME || ' - ' || e.CGCCPF AS FILIAL,
p.ESTABELECIPED
FROM PEDIDO p
JOIN ENTIDADE e
ON p.ESTABELECIPED = e.CHAVE
-- LIMIT 20;

------------------------------------------------------------------------------------------------------------------------------------

 --Verificando o tamanho da bases de dados no pg
SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size FROM pg_database;

--Listar os Bancos de Dados
SELECT datname FROM pg_database;

--Exibindo tabelas do Banco de Dados
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

--Selecionando Exibe os campos da tabela
 /* Select * from ILOG where 1 = 2; */

--Selecionar apenas o primeiro registro da tabela
/*  Select * from ILOG LIMIT 2; */

/* Select * from integracao LIMIT 2; */


--Visualizando as colunas de uma tabela
/* SELECT column_name FROM information_schema.columns WHERE table_name = 'recurso'; */

--Ver detalhes das colunas de uma tabela
/* SELECT * FROM information_schema.columns WHERE table_name ='recurso'; */

 /* Select * from PEDIDO where LIKE 'FOGAO 4B. ESMALTEC BALI CRISTAL BR' */

--Procurando campo no banco
SELECT * FROM iGroupUser;
SELECT IFULLNAME FROM iGroupUser WHERE '%UEL%';
-- SELECT ENTIDADE FROM iGroupUser WHERE LIKE '%AGO%';
-- WHERE ENTIDADE LIKE '%ESMALTEC%';

--Procurando campo no banco
SELECT ZNUMPLAQUETA FROM PEDIDO LIMIT 10;

SELECT ZNUMPLAQUETA FROM PEDIDO WHERE chcriacao = 5956671;
SELECT * FROM BAI_ WHERE BAI_XCHPEDBAIXA = 947507191;
SELECT EMISSAO FROM PEDIDO WHERE CHPEDBAIXA = 977752883; 
SELECT PEDBAIXADO FROM PEDIDO WHERE chcriacao =  977752883; 
-----------------------------------------------------------
SELECT * FROM PEDIDO WHERE chcriacao =  977752883; --ok
SELECT * FROM PEDIDO WHERE LOGRADOUROPESSOAOP =  'teolandia'; --ok
SELECT * FROM PEDIDO WHERE chave =  977752884;
SELECT * FROM PEDIDO WHERE CHPEDBAIXA = 977752883;
SELECT * FROM PEDIDO WHERE PEDBAIXADO = 977752883;
SELECT * FROM PEDIDO WHERE EMISSAO = 977752883;
SELECT * FROM PEDIDO WHERE EMISSAO = '23/01/2019';
----------------------------------------------------------
select
indpres,
ordemcnf
from pedido;

ALTER TABLE pedido ALTER COLUMN indpres TYPE bigint, ALTER COLUMN ordemcnf TYPE bigint;

---TABELA RECURSO
select * from ENTIDADE
WHERE CODIGO = '50'
LIMIT 10;
--CIDADE
select NOME, CHAVE from RECURSO
LIMIT 10;
select NOME,codigo from RECURSO
LIMIT 10;
select * from PEDIDO
-- WHERE chave = 835303426
LIMIT 10;
--TABELA RECURSO
------------TABELA---------
select codigo || ' - ' || nome || ' - ' || cgccpf || ' - ' || chave
from entidade
where chave = 341697
LIMIT 10;
-- select chave, codigo, classe, nome, cgccpf, endereco, bairro, uf, cidade, CEP
select DISTINCT codigo, nome, cgccpf, endereco, bairro, uf, cidade, CEP AS FILIAL
from entidade
where CODIGO = '50'
LIMIT 10;
--e.ENDERECO || ' - ' || e.BAIRRO || ' - ' || e.CIDADE || ' - ' || e.UF  || ' - ' || e.CEP as ENDERECO,
--INSCRESTAD, LOGRADOURO, NUMERO,
SELECT DISTINCT
e.CODIGO || ' - ' || e.NOME || ' - ' || e.CGCCPF AS FILIAL,
e.ENDERECO || ' - ' || e.BAIRRO AS ENDERECO
FROM ENTIDADE AS e
LIMIT 20;

--TRAZER TODAS AS FILIAIS
SELECT DISTINCT
e.CODIGO || ' - ' || e.NOME || ' - ' || e.CGCCPF AS FILIAL,
p.ESTABELECIPED
FROM PEDIDO p
JOIN ENTIDADE e
ON p.ESTABELECIPED = e.CHAVE
-- LIMIT 20;

SELECT 
e.CODIGO || ' - ' || e.NOME || ' - ' || e.CGCCPF AS FILIAL,
e.ENDERECO || ' - ' || e.BAIRRO AS ENDERECO,
e.CIDADE,
t.CODIGO AS UF,
e.CEP,
p.CHAVE AS PEDIDO,
-- p.CFO,
p.NUMERO AS NºNOTA,
ent.CODIGO || ' - ' || ent.NOME || ' (' || ent.CGCCPF || ') ' AS CLIENTE,
en.CODIGO || ' - ' || en.NOME || ' (' || en.CGCCPF || ') ' AS VENDEDOR,
r.NOME AS PRODUTO,
p.TOTALLIQUIDO AS PRECO,
p.QUANTIDADE AS QTD,
p.TOTAL,
P.EMISSAOPED AS DATAPED,
P.EMISSAOPEDH AS HORAPED
FROM PEDIDO p
JOIN ENTIDADE e
ON p.ESTABELECIPED = e.CHAVE
JOIN ENTIDADE en
ON p.REPRESENTA = en.CHAVE
JOIN ENTIDADE ent
ON p.PESSOA = ent.CHAVE
JOIN TABELA t
ON p.UFPESSOAOP = t.CHAVE
JOIN RECURSO r
ON p.RECURSO = r.CHAVE
-- WHERE EMISSAOPED = '11/07/2019 00:00:00'
---- WHERE EMISSAOPED BETWEEN '11/07/2019 00:00:00' AND '12/07/2019 00:00:00'
---- OR EMISSAOPED BETWEEN '12/07/2019 00:00:00' AND '13/07/2019 00:00:00'
---- AND PRECO < 50.00
---- ORDER BY PRODUTO DESC
WHERE e.CODIGO = '102' --Código da Filial
-- WHERE en.CODIGO = '3451414' --Código do Vendedor
-- WHERE p.CHAVE = 835303426 --Chave do Pedido
-- LIMIT 10




UNION 
-- UNION ALL

SELECT
-- CODIGO, NOME, CGCCPF as VENDEDOR
e.CODIGO || ' - ' || e.NOME || ' (' || e.CGCCPF || ')' as VENDEDOR
from ENTIDADE e
where CLASSE = -1897050521
LIMIT 20



SELECT 
e.CODIGO || ' - ' || e.NOME || ' ( ' || e.CGCCPF || ' ) ' as VENDEDOR
from PEDIDO p 
join ENTIDADE e
on p.REPRESENTA = e.CHAVE
LIMIT 20;
-- p.REPRESENTA,
-- where e.CLASSE = -1897050521

-- Select CODIGO, CHAVE, NOME, CGCCPF, CLASSE from ENTIDADE
-- where CLASSE = -1895829717

Select * from tabela where chave = -1897135768
Select * from tabela where chave =  382838
Select * from tabela where chave = -1899999713;
Select * from ENTIDADE where chave = 206071719
select CODIGO from TABELA;

-- SELECT LOCALIDADEPESSOAOP from PEDIDO
SELECT * FROM ENTIDADE
where NOME = ''
-- where chave = 211664430
-- where chave = 341697
LIMIT 10

SELECT CHAVE, NOME FROM CLASSE
-- LIMIT 10
WHERE CHAVE = -1897050521

SELECT ESCFUNCAO1, ESCENTIDADE1 FROM PEDIDO
LIMIT 10

select chave, codigo, nome, cgccpf
from entidade
-- where chave = 211664430
where chave = 341697

-- CAIXA
-- UF

select * FROM PEDIDO
LIMIT 10;
select CEPPESSOAOP, 
LOCALIDADEPESSOAOP, 
UFPESSOAOP,  
uflocescrituop 
FROM PEDIDO
LIMIT 10;
--CAIXA
select 
p.DISPONIVEL
from PEDIDO p
join ENTIDADE e
on p.DISPONIVEL = e.CHAVE
LIMIT 10;
select * FROM ENTIDADE
LIMIT 10;
select CAIXAPED, DISPONIVEL FROM PEDIDO
LIMIT 10;

estabelecipedido.uf.codigo
Select 
CHAVE,
CHCRIACAO, 
RECURSO, 
ESTABELECI, 
EMISSAO,
estabeleciped, 
TOTAL
from PEDIDO 
LIMIT 10;
--where CHCRIACAO
-------------------
-- p.estabeleciped, --as FILIAL,
-- p.REPRESENTA, --as VENDEDOR,

-- p.APROVACAO,
-- p.CAIXAPED,
-- p.UFPESSOAOP as UF,
--ITEMLIQUIDO
--ITEM contem o preço
--UNITARIO
--NEGOCIADOITEM
--TOTALNEGOCIADO
--TOTALCOMERCIAL
--TOTALBRUTO
--TOTALLIQUIDO
--DESCITEM
--CONFINS
--PIS
--CUSTOCONT
--CUSTOMAT
--EMISSAOPED
--EMISSAOPEDH
--CAIXAPED

WHERE NOME LIKE '%ESMALTEC%'
LIMIT 10;

select 
CHAVE, 
CODIGO, 
CLASSE, 
NOME, 
EAN, 
FABRICANTE, 
IMAGEM, 
MARCA, 
PRAZOGARANTIA, 
DESCRICAOGENERICA 
from RECURSO WHERE NOME LIKE '%ESMALTEC%';

/* ihour, idate --from PEDIDO LIMIT 2;*/

SELECT 
chave, 
ean,
nome, 
codigo,
classe,   
fabricante, 
imagem, 
marca, 
prazogarantia,
descricaogenerica, 
yecommerceskuid, 
yecommerceid,
yecommerceprodutopaiid,
yecommercenome,
yecommercedescricao,
yecommercecategoria,
yecommerceapelido
from RECURSO WHERE NOME LIKE '%ESMALTEC%';

---Tabela VINCULA onde costa o "SALDO DO RECURSO"=Quantidade "ESTOQUE"
select
CHAVE,
RECURSO,
QUANTIDADE,
VALOR,
LOCESCRITU
from VINCULA WHERE NOME LIKE '%ESMALTEC%';

NMINPARCELAS

---Tabela FATOR, onde consta o FATOR=Preços dos RECURSOS=Produtos
SELECT * FROM FATOR LIMIT 10;
SELECT fator FROM FATOR;

/* SELECT
icreatedat,
iupdatedat
FROM CLASSE
LIMIT 10; */

SELECT
icreatedat,
iupdatedat,
icreation,
icreationhour,
ilastmodified,
ilastmodifiedhour
FROM iVfs
LIMIT 10;
SELECT * FROM iVfs LIMIT 10;
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

---FATOR, CLASSE, Fatoresvenda
Select * from tabela where chave = -1898145931;
---1897048799, -1894333884, -1897148410

---Query imagem 
Select iKey, iVersion, iFieldNames, iBeforeValues
From iLog
Where iType = -1898145931 /* Registro Removido */;

--- Código de Rastreamento.ip (-1894804815) --- faturamento,frete e status
Select distinct p.PESSOA, p.NUMERO, p.EMISSAO, p.CHCRIACAO, p.YIDPEDIDO, e.CODIGO as CODIGORASTREIO, e.CHAVE as CHAVE_EVENTO
        From PEDIDO p
        join INTEGRACAO i on i.YIDPEDIDO = p.YIDPEDIDO
        left outer join EVENTO e on e.CRPEDIDO = p.CHCRIACAO and e.CLASSE = -1894804814 /* Código de Rastreamento */
        Where i.YAVISOFATURAMENTO is not null
            and p.OPERACAOCANCELADA is null
            and p.CHPEDBAIXA is not null
            and p.APROVACAO is not null
            and p.STATUSNFE = -1894641856 /* Enviada com Sucesso */
        " + whereExpress + "


--RASTREAMENTO DO PEDIDO:
SELECT 
PESSOA,
CHCRIACAO,
NUMERO, --DA NFE
EMISSAO,
CODIGORASTREIO,
XENDERECO,
FRETE --valor do frete
FROM PEDIDO;

{
"status":"shipping_informed",
"shipments":
 [{"id":"606b87e9e7cb7f1d4d5f8d33",  //select CHCRIACAO from PEDIDO
"shipping_company":"Correios",//SELECT TRANSPORTA FROM PEDIDO
"shipping_method":"PAC", //select TIPOFRETE from PEDIDO
"track_code":"11111", //select CODIGORASTREIO/RASTREIO from PEDIDO
"track_url":"http://correios.com.br",
"status":"shipped", //select STATUSNFE from PEDIDO //select YSTATUS from INTEGRACAO
"date_shipped":"2021-02-01" //select DATAEMBARQUE/REEMBARQUE from PEDIDO
}]
}

SELECT 
CHCRIACAO,
TRANSPORTA,
TIPOFRETE,
CODIGORASTREIO/RASTREIO,
STATUSNFE
FROM PEDIDO;
select YSTATUS from INTEGRACAO
select DATAEMBARQUE from PEDIDO


--/Configuração/Fiscais/0100 Accounting.ic
this.camposInalteraveisDaNfe.push(
    "TIPO",
    "EMISSAOMOV",
    "NUMERO",
    "NUMEROSEQ",
    "SERIESUBS"//,
    //TODO: Rever uso dos campos abaixo, pois os mesmos podem ser alterados em outras situacoes, tais como cancelamento.
    //"CHACESSONFE",
    //"ENVIONFE",
    //"ENVIONFEH",
    //"PROTOCOLONFE",
    //"STATUSNFE",
    //"TIPOCONTINGENCIANFE",
    //"TIPOEMISSAONFE"
);

--- PrincipiaPedidoService.ijs (-1894804822) ---
        select
            YDATAINCLUSAO,
            MAX(YHORAINCLUSAO) as HORAINCLUSAO
        from
            INTEGRACAO
        where
            CLASSE = " + ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO + "
            and YDATAINCLUSAO in (
                select
                    MAX(YDATAINCLUSAO) as DATAINCLUSAO
                from
                    INTEGRACAO
                where
                    CLASSE = " + ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO + "
            )
        group by YDATAINCLUSAO;

---ECommercePedidoServiceCC.ijs (-1894804981)---
---ECommercePedidoServiceCC.prototype._pegarPedidosPendentesDeCriacao = function( ids ){

    var query = "
        select i.*
        from INTEGRACAO i
        where i.YLIBERACAOATENDIMENTO is not null
            and i.YENCERRAMENTO is null
            and not exists (
                select 1
                from PEDIDO p
                where p.YIDPEDIDO=i.YIDPEDIDO
                    and p.CHPEDBAIXA is null
                    and p.CHDEVOLUC is null
            ) " +
            queryUtilities.clauseWhereOfKeys("and", "i.CLASSE", classes.getChildren( ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO )) +
            queryUtilities.clauseWhereOfKeys("and", "i.YIDPEDIDO", ids)

---ECommercePedidoServiceCC.prototype._pegarPedidosPendentesDeNotificacaoFaturamento = function( ids ){
    var integracao = database.query("
        select i.*
        from INTEGRACAO i
        where i.YAVISOFATURAMENTO is null
            and exists (
                select 1
                from PEDIDO p
                where p.YIDPEDIDO=i.YIDPEDIDO
                    and p.CHPEDBAIXA is null
                    and p.CHDEVOLUC is null
                    and exists (
                        select 1
                        from PEDIDO bx
                        where bx.CHPEDBAIXA=p.CHAVE
                            and bx.OPERACAOCANCELADA is null
                            and bx.STATUSNFE = " + ECommerceConstantesCC.statusNfe.EMITIDA + "
                    )
            ) " +
            queryUtilities.clauseWhereOfKeys("and", "i.CLASSE", classes.getChildren( ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO )) +
            queryUtilities.clauseWhereOfKeys("and", "i.YIDPEDIDO", ids)
    );
    integracao.logChanges = true;

    return integracao;
};

---ECommercePedidoServiceCC.prototype._pegarPedidosPendentesDeNotificacaoCancelamento = function( ids ){
    var integracao = database.query("
        select i.yidpedido
        from INTEGRACAO i
        where i.YCANCELAMENTO is null
            and exists (
                select 1
                from PEDIDO p
                where p.YIDPEDIDO = i.YIDPEDIDO
                    and ( p.cancelamensaldo is not null or
                          exists (
                                select 1
                                from PEDIDO bx
                                where bx.CHPEDBAIXA = p.CHAVE
                                    and bx.OPERACAOCANCELADA is not null
                                    and bx.STATUSNFE = " + ECommerceConstantesCC.statusNfe.CANCELADA + "
                                ))
                )" +
            queryUtilities.clauseWhereOfKeys("and", "i.CLASSE", classes.getChildren( ECommerceConstantesCC.classes.INTEGRACAO_PEDIDO )) +
            queryUtilities.clauseWhereOfKeys("and", "i.YIDPEDIDO", ids)
    );
    integracao.logChanges = true;

    return integracao;
};
---ECommercePedidoServiceCC.prototype._pegarEventosDeCodigoRastreamentoPendentes = function(){
    var eventos = database.query("
        select e.*
        from EVENTO e
        where e.CLASSE = -1894804814 /* Código de Rastreamento */
            and DATA is null
    ");
    eventos.logChanges = true;

    return eventos;
};

---ECommercePedidoServiceCC.prototype._pegarNotaFiscais = function( idsPedidos ){
    if( !idsPedidos ){
        throw new Error("Informe os IDs dos pedidos!");
    }

    if( typeof idsPedidos == "string" ){
        idsPedidos = this.converter.preparaChaveParaConsultaDadosIntegracao( idsPedidos.toString().split(",") );
    }

    var notasFiscais = database.query("
        select distinct bx.CHAVE, bx.NUMERO, bx.CHACESSONFE, bx.EMISSAO, bx.EMISSAOH, bx.SERIESUBS, bx.RECURSO, bx.UNITARIO, bx.QUANTIDADE, bx.TOTAL, p.YIDPEDIDO
        from PEDIDO bx
            left outer join PEDIDO p on p.CHAVE=bx.CHPEDBAIXA
        where bx.CHPEDBAIXA is not null
            and bx.OPERACAOCANCELADA is null
            and bx.STATUSNFE = -1894641856 /* Enviada com Sucesso */
            and p.YIDPEDIDO in ( " + idsPedidos.join(', ') + ")"
    );

    return {
        cabecalhos: notasFiscais.sum("NUMERO;EMISSAO;EMISSAOH;SERIESUBS;YIDPEDIDO;CHACESSONFE", "TOTAL;QUANTIDADE"),
        itens: notasFiscais
    }
};

---/products/Web Commerce/library/objects/ecommerce/pesquisas/ECommerceConsultaPedidosCC.ijs
ECommerceConsultaPedidosCC.prototype._consultarNotificacoes = function( ids ){
    var notificacoes = database.query("
        select YIDPEDIDO as ID, DATA, HORA, USUARIO, SITUACAO
        from EVENTO " +
        queryUtilities.clauseWhereOfKeys("where", "CLASSE", classes.getChildren( ECommerceConstantesCC.classes.EVENTOS_ATENDIMENTO )) +
            queryUtilities.clauseWhereOfKeys("and", "YIDPEDIDO", ids )
    );

    this.notificacoes.append( notificacoes );


--/products/Web Commerce/library/objects/ecommerce/base/ECommercePedidoConverterCC.ijs
var endereco = dadosPessoa.endereco.split(" ");
        var tipologradouro = endereco[0];
        var tabelaTipoLogradouro = database.query("
        	select CHAVE
            from TABELA
            where
                CLASSE = -1897131373 and
                (CODIGO ilike '%" + tipologradouro + "%' or
                NOME ilike '%" + tipologradouro + "%')
         ");
--TABELA INTEGRACAO--
/* select
CHAVE,
VERSAOPEDIDO,
DATAGRAVACAOPEDIDO, --Retorna a data de criação do PEDIDO 
HORAGRAVACAOPEDIDO,
DADOSPEDIDO,
YAVISOFATURAMENTO,
YAVISOFATURAMENTOH,
YAVISOFATURAMENTOUSUARIO,
YDADOSPAGAMENTO,
YSITUACAOPAGAMENTO,
YDADOSPEDIDO,
YSTATUS,
YIDPEDIDO,
YEMAIL
from integracao LIMIT 2; */

--Regras de Pagamentos--
SELECT 
CODIGO,
NOME,
TIPO,
CHBANDEIRA,
REDEAUTORIZADORA,
CONDNEGOCIACAO,
YABSORVEPARCELAECOMMERCE,
YCONSIDERAFRETETITULO,
YCRIAPEDIDOCOMTITULOPENDENTE
FROM tabela where 1 = 2
select TOTAL from PEDIDO --Total do Pedido

---Tipos de pagamento
"payments" : [
 {
 "payment_total" : 24.56, // select TOTAL from PEDIDO 
 "payment_installments" : 1, //PARCELAMENTO
 "payment_method" : "credit_card", // select NOME from TABELA
 "payment_type" : "credit", // select TIPO from TABELA
 "_id" : ObjectId("5dacf4eef13005ee3cdc02d4") // select CODIGO from TABELA
 },
 ]

payment_type: { type: String, enum: [
‘credit’, // credito
‘debit’, // debito
‘ticket’, // boleto
‘voucher’, // conta
‘transfer’ // transferencia
]},

---
SELECT 
CHAVE,
CODIGO,
COMISSAOP,
QUANTIDADE,
QUANTIDADE01,
RECURSO,
DEPOSITO,
FABRICANTE,
TEMZONACIDADE,
UF,
VALOR,
CONTA,
LOCALIDADE,
ALTURA,
PESO,
DIASENTREGA,
TOLEDMAIS,
TOLEDMENOS,
GARANTIA,
MARCA,
COR,
FATOR,
CLIENTE,
PESSOA,
NOME,
USUARIO,
EMAIL,
CADASTRADOR,
STATUS,
SITUACAO,
TIPOPESSOA,
LARGURA,
COMPRIMENTO
FROM tabela where 1 = 2;

select
indpres,
ordemcnf
from pedido;

ALTER TABLE pedido ALTER COLUMN indpres TYPE bigint, ALTER COLUMN ordemcnf TYPE bigint;

 Select * from PEDIDO LIMIT 2;
 Select * from PARCELA LIMIT 10;
 Select * from ENTIDADE LIMIT 10;
 Select * from EVENTO where 1 = 2;
 Select * from PEDIDO where 1 = 2;
 Select * from FATOR where 1 = 2;
 Select * from MOVDEPOS where 1 = 2;
 Select * from TABELA where 1 = 2;
 Select * from iVfs where 1 = 2;
  Select * from INTEGRACAO LIMIT 2;
  Select * from iVfs LIMIT 2;
  Select * from iLog LIMIT 2;

Select distinct p.PESSOA, p.NUMERO, p.EMISSAO, p.CHCRIACAO, p.YIDPEDIDO, e.CODIGO as CODIGORASTREIO, e.CHAVE as CHAVE_EVENTO
        From PEDIDO p;
        
select
CHAVE,
RECURSO,
QUANTIDADE,
CUSTO --Preço
from MOVDEPOS
LIMIT 10;

--TABELA PEDIDO
select
CHAVE,
CHCRIACAO,
RECURSO,
ITEM,
USUARIOPED,
USUARIO,
COMPRADOR,
DISPONIVELPED,
UNITARIO,
DESCITEMKIT,
ACRESITEMKIT,
COMISSVALOR1,
COMISSVALORPED1,
COMISSVALORTIT1,
COMISSFATOR1,
QUANTIDADE,
EMISSAOPED,
EMISSAOPEDH,
HORASISTEMAEMISSOR,
DATASISTEMAEMISSOR
HORACANCSISTEMAEMISSOR,
EMISSAODOCH,
EMISSAODOC,
EMISSAOUTC,
EMISSAOHUTC,
DATAEMBARQUE,
DATAEMBARQUEH,
DATAENTREGA,
RASTREIO,
RASTREIOCOMP,
TIPOFRETE,
FRETE, --valor do frete
TRANSPORTA,
DESCITEM,
DESCONTO,
ORIGEM,
SAIDAORIGEM,
DESTINO,
CHEGADADESTINO,
ENTREGA,
VOLQDETRANSP,
NUMEROPEDIDOCOMPRA,
PEDLOCESCTRANSF,
ITEMPEDIDOCOMPRA,
PRAZOGARANTIAM
YIDPEDIDO,
MOEDA,
NUMEROSERIE,
SERIESUBS,

STATUSCORRENTE, --status da NFE
CRPEDIDO, --CHAVE DE CRIAÇÃO PEDIDO
NUMERO, --DA NFE
SERIE, -- DA NFE
CFOP, -- DA NFE
PESSOA, --CLIENTE DO PEDIDO
PESSOAUF, --UF DO CLIENTE DA NFE
EMISSAO, --DATA DE EMISSÃO DA NFE
TIPO,
DATA_HORAPROTOCOLO, -- DA NFE
PEDIDO, --TOTAL DO PEDIDO
CHACESSONFE_PEDIDO --CHAVE DE ACESSO NFE

LOCENTREGA,
TOTAL,
SUBTOTAL,
TOTALDANOTA,
TOTALLIQUIDO,
TOTALBRUTO
from PEDIDO LIMIT 2;

SELECT UFPESSOA FROM PEDIDO
LIMIT 10;

--TABELA PESSOA--
SELECT EMAIL FROM PESSOA --CLASSE;

---PESSOA PEDIDO -- PESSOAOP,
SELECT
PESSOA, --CLIENTE DO PEDIDO
LOGRADOUROPESSOAOP,
NUMEROPESSOAOP,
COMPLEMENTOPESSOAOP,
PONTOREFERPESSOAOP,
LOCALIDADEPESSOAOP,
CEPPESSOAOP,
UFPESSOAOP,
PAISPESSOAOP,
TIPOLOGRADOUROPESSOAOP,
SUBLOCALIDADEPESSOAOP,
ZONACIDADEPESSOAOP
EMAILPESSOA,
FROM pedido;

---ESCRITUOP PEDIDO
select
NUMEROLOCESCRITUOP,
LOGRADOUROLOCESCRITUOP,
COMPLEMENTOLOCESCRITUOP,
PONTOREFERLOCESCRITUOP,
LOCALIDADELOCESCRITUOP,
UFLOCESCRITUOP,
CEPLOCESCRITUOP 
from PEDIDO
LIMIT 10;

---ENTIDADE
SELECT
ENTNOME,
ENTENDERECO,
ENTFONE,
ENTPONTOREFER,
ENTBAIRRO,
ENTUF,
ENTCEP,
ENTCIDADE
ENTLOCALIDADE,
ENTLOGRADOURO,
ENTCOMPLEMENTO,
ENTNUMERO,
ENTPAIS,
ENTTIPOLOGRADOURO,
ENTSUBLOCALIDADE
FROM pedido;

---Produto OK---
select 
    a.chave, 
    a.ean,
    '' as ncm,
    a.nome, 
    a.codigo,
    'quantidade' as quantidade,
    'preço especial' as preço_especial,
    b.fator as preço,
    a.descricaogenerica,
    a.marca, 
    'custo' as custo,
    a.prazogarantia,
    'observacao' as observacao,
    'link produto' as link_produto,
    'acessivel' as acessivel,
    a.classe,   
    'tempo manuseio' as tempo_manuseio,
    'tempo fabricacao' as tempo_fabricacao,
    a.comprimento as comprimento,
    a.largura as largura,
    a.altura as altura,
    a.pesbruunid as peso,
    'atributos' as atributos,
    'fotos' as fotos,
    'tabelas de preco' as tabela_preco,
    'deposito' as deposito,
    'variacoes' as variacoes
    from RECURSO a 
    join fator b
    on a.chave = b.recursoorig
    and b.tabfator = 462894
    and b.fim is null
where codigo = '1056'

LISTA MAT. FUNC. LE005

   SELECT A.numcad AS MATRICULA, A.nomfun AS NOME, A.numpis AS PIS
     FROM R034FUN A
    WHERE A.sitafa <> 7 AND A.codfil = 5 AND A.numcad >= 1000
 ORDER BY 1

 -------------

 Select Distinct t.CHAVE, t.CHCRIACAO, t.EMISSAO, t.NUMERO as TITULONUMERO,
                 t.VENCIMENTO, t.VENCIMENTOORIGINAL, t.CORRECAO, t.PRINCIPAL, t.VALOR, t.TIPO as TIPOTITULO, t.ALINEA,
                 t.PESSOA, t.CARTEIRA, t.JURO, t.MULTA, t.ACRESCIMO, t.DESCONTO, t.CHEQUE, t.NOSSONUMERO,
                 t.BANCO, t.AGENCIA, t.SACADONOME,
                 t.CHBAIXA,
                 t.BAIXA,
                 t.BAIXAPARCIAL,
                 t.NEGOCIACAO,
                 p.LOCESCRITU,
                 p.TIPO,
                 p.NUMERO,
                 p.REPRESENTA,
                 t.ESTABELECI,
                 (select count(t2.CHAVE) as COUNT From TITULO t2 Where t2.NEGOCIACAO = t.CHCRIACAO) as QT_NEGOCIADO
        From   TITULO t join PEDIDO p on ( p.CHCRIACAO = t.CHCRIACAO ) + strJoin + 
        Where t.CHAVE is not null + where.join