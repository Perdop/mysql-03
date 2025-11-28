CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes ;

CREATE TABLE tb_categorias(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(255),
    descricao VARCHAR(255)
);

CREATE TABLE tb_produtos(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,	
	nome VARCHAR(255),
    valor DECIMAL(6,2),
	origem VARCHAR(255),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Carnes Bovinas', 'Cortes de carne de boi de alta qualidade.'),
('Carnes Suínas', 'Cortes de carne de porco variados.'),
('Aves', 'Frangos, patos e outras aves frescas.'),
('Embutidos', 'Linguiças, salsichas e produtos processados.'),
('Temperos e Marinadas', 'Produtos para temperar e conservar carnes.');

INSERT INTO tb_produtos (nome, valor, origem, categoria_id) VALUES
('Picanha Bovino 1kg', 79.90, 'Brasil', 1),
('Alcatra Bovino 1kg', 65.50, 'Argentina', 1),
('Costela Suína 1kg', 42.00, 'Brasil', 2),
('Lombo Suíno 1kg', 48.50, 'Brasil', 2),
('Peito de Frango 1kg', 25.90, 'Brasil', 3),
('Coxa e Sobrecoxa 1kg', 23.50, 'Brasil', 3),
('Linguiça Toscana 1kg', 35.00, 'Brasil', 4),
('Salsicha Hot Dog 1kg', 18.00, 'Brasil', 4);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT 
    p.*, 
    c.nome AS categoria,
    c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id;

SELECT 
    p.*, 
    c.nome AS categoria,
    c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id
WHERE c.nome IN ('Aves');

