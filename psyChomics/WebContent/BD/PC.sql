CREATE DATABASE PC;
USE PC;

CREATE TABLE usuario (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR (50),
	senha VARCHAR (16),
	nick VARCHAR (15),
	nome_usuario VARCHAR (50),
	cpf VARCHAR (11),
	notificacao VARCHAR (3)
);

CREATE TABLE genero_produto (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	genero VARCHAR (20)
);

CREATE TABLE tipo_produto (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	tipo VARCHAR (20)
);

CREATE TABLE categoria_produto (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	categoria VARCHAR (20)
);

CREATE TABLE produto (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	idgenero INT(6),
	codigo VARCHAR (5),
	nome VARCHAR (50),
	preco DECIMAL (10,2),
	imagem VARCHAR (255),
	descricao VARCHAR (255),
	FOREIGN KEY (idgenero) REFERENCES genero_produto(id)
);

CREATE TABLE comentario_produto (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT (6),
	idproduto INT (6),
	data date,
	comentario VARCHAR(255),
	FOREIGN KEY (idproduto) REFERENCES produto(id),	
	FOREIGN KEY (idusuario) REFERENCES usuario(id)	
);

CREATE TABLE carrinho (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT (6),
	total DOUBLE,
	FOREIGN KEY (idusuario) REFERENCES usuario(id)
);

CREATE TABLE item (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	idproduto INT(6),
	idcarrinho INT(6),
	quantidade INT(6),
	FOREIGN KEY (idproduto) REFERENCES produto(id),
	FOREIGN KEY (idcarrinho) REFERENCES carrinho(id)
);

CREATE TABLE pedido (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT(6),
	descricao VARCHAR(255),
	FOREIGN KEY (idusuario) REFERENCES usuario(id)
);

CREATE TABLE fale_conosco (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	nome_usuario INT(6),
	email VARCHAR(50),
	mensagen VARCHAR(255)
);




