CREATE DATABASE PC;
use PC;

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
	idusuario INT (6),
	nome VARCHAR(50) NOT NULL,
	preco DECIMAL (10,2) NOT NULL,
	genero VARCHAR(30) NOT NULL,
	imagem VARCHAR(100),
	FOREIGN KEY (idusuario) REFERENCES usuario(id)
);

CREATE TABLE comentarios_produtos (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT (6),
	idproduto INT (6),
	nome VARCHAR(60) NOT NULL,
	email VARCHAR(50) NOT NULL,
	comentario VARCHAR(255) NOT NULL,
	FOREIGN KEY (idusuario) REFERENCES usuario(id),
	FOREIGN KEY (idproduto) REFERENCES produto(id)	

);

CREATE TABLE carrinho_de_compras (
	id int (6) AUTO_INCREMENT PRIMARY KEY,
	idusuario int (6),
	idproduto INT (6),
	quantidade int (6) not null,
	FOREIGN KEY (idusuario) REFERENCES usuario(id),
	FOREIGN KEY (idproduto) REFERENCES produto(id)	
);

CREATE TABLE fale_conosco (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	mensagem VARCHAR(255)
);



