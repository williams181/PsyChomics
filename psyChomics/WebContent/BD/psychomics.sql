CREATE DATABASE psychomics;
use psychomics;

CREATE TABLE usuario (

	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(50) NOT NULL,
	senha VARCHAR(16) NOT NULL,
	nick VARCHAR(30) NOT NULL,
	nome_usuario VARCHAR(50) NOT NULL,
	cpf VARCHAR(11) NOT NULL
);

CREATE TABLE produto (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	preco DECIMAL (10,2) NOT NULL,
	genero VARCHAR(30) NOT NULL,
	isbn VARCHAR (30) NOT NULL
);

CREATE TABLE carrinho_de_compras (
	idproduto int (6) not null,
	idcompra int (6) AUTO_INCREMENT PRIMARY KEY,
	quantidade int not null,
	FOREIGN KEY (idproduto) REFERENCES produto(id)
);

CREATE TABLE cadastro_notificacao (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(50) NOT NULL
);

CREATE TABLE fale_conosco (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(60) NOT NULL,
	email VARCHAR(50) NOT NULL,
	mensagem VARCHAR(MAX)
);

CREATE TABLE comentario (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(60) NOT NULL,
	email VARCHAR(50) NOT NULL,
	comentario VARCHAR(MAX)
);

