--USE ecommerce
--sp_helpdb ecommerce

CREATE DATABASE db_Biblioteca
ON PRIMARY (NAME=db_Biblioteca,
FILENAME='C:\SQL\db_Biblioteca.MDF',
SIZE=6MB,
MAXSIZE=10MB,
FILEGROWTH=10%
)
