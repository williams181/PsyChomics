CREATE DATABASE PC;
USE PC;

CREATE TABLE usuario (

	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR (50) NOT NULL,
	senha VARCHAR (16) NOT NULL,
	nick VARCHAR (30) NOT NULL,
	nome_usuario VARCHAR (50) NOT NULL,
	cpf VARCHAR (11) NOT NULL
);

CREATE TABLE receber_notificacao (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT (6),
	notificar TINYINT(1),
	FOREIGN KEY (idusuario) REFERENCES usuario(id)	
);

CREATE TABLE produto (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (50) NOT NULL,
	preco DECIMAL (10,2) NOT NULL,
	imagem VARCHAR (200) NOT NULL,
	genero VARCHAR (30) NOT NULL
);

CREATE TABLE genero_produto (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	idproduto INT (6),
	genero VARCHAR (30),
	FOREIGN KEY (idproduto) REFERENCES produto(id)
);

CREATE TABLE comentario_produto (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT (6),
	idproduto INT (6),
	comentario VARCHAR(255) NOT NULL,
	FOREIGN KEY (idusuario) REFERENCES usuario(id),
	FOREIGN KEY (idproduto) REFERENCES produto(id)	
);

CREATE TABLE carrinho (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT (6),
	idproduto INT (6),
	total DOUBLE,
	FOREIGN KEY (idusuario) REFERENCES usuario(id),
	FOREIGN KEY (idproduto) REFERENCES produto(id)	
);

CREATE TABLE item (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	idcompra INT(6),
	idproduto INT(6),
	quantidade INT(6),
	FOREIGN KEY (idproduto) REFERENCES produto(id),
	FOREIGN KEY (idcompra) REFERENCES compra(id)
);

CREATE TABLE fale_conosco (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT(6),
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	mensagem VARCHAR(255),
	FOREIGN KEY (idusuario) REFERENCES usuario(id)
);

CREATE TABLE pedidos (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT(6),
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	descricao VARCHAR(255),
	FOREIGN KEY (idusuario) REFERENCES usuario(id)
);




