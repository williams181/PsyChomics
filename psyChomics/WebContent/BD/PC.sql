CREATE DATABASE PC;
USE PC;

CREATE TABLE usuario (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR (50),
	senha VARCHAR (16),
	nick VARCHAR (15),
	nome_usuario VARCHAR (50),
	cpf VARCHAR (11),
	notificacao VARCHAR (3),
	tipo_usuario VARCHAR(5)
);

CREATE TABLE genero_produto (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR (30)
);

CREATE TABLE tipo_produto (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR (30)
);

CREATE TABLE categoria_produto (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR (30)
);

CREATE TABLE produto (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	categoria_id INT,
	genero_id INT,
	tipo_id INT,
	nome VARCHAR (50),
	preco DECIMAL (10,2),
	imagem VARCHAR (255),
	descricao TEXT(600),
	nacionalidade VARCHAR (20),
	FOREIGN KEY (categoria_id) REFERENCES categoria_produto(id),
	FOREIGN KEY (genero_id) REFERENCES genero_produto(id),
	FOREIGN KEY (tipo_id) REFERENCES tipo_produto(id)
);

CREATE TABLE comentario_produto (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	usuario_id INT (6),
	produto_id INT (6),
	data date,
	comentario TEXT(600),
	FOREIGN KEY (produto_id) REFERENCES produto(id),	
	FOREIGN KEY (usuario_id) REFERENCES usuario(id)	
);

CREATE TABLE carrinho (
	id INT (6) AUTO_INCREMENT PRIMARY KEY,
	idusuario INT (6),
	total DOUBLE,
	data date,
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
	data date,
	mensagem TEXT(600),
	FOREIGN KEY (idusuario) REFERENCES usuario(id)
);

CREATE TABLE fale_conosco (
	id INT(6) AUTO_INCREMENT PRIMARY KEY,
	nome_usuario INT(6),
	email VARCHAR(50),
	data date,
	mensagem TEXT(600)
);




