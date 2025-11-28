CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao VARCHAR(255)
);

CREATE TABLE tb_produtos (
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    valor DECIMAL(6,2),
	marca VARCHAR(255),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
('Medicamentos', 'Remédios controlados ou de venda livre.'),
('Higiene Pessoal', 'Produtos de limpeza e cuidado individual.'),
('Vitaminas e Suplementos', 'Vitaminas, minerais e suplementos alimentares.'),
('Dermocosméticos', 'Produtos para cuidados com a pele.'),
('Infantil', 'Produtos de saúde e higiene para crianças e bebês.');

INSERT INTO tb_produtos (nome, valor, marca, categoria_id) VALUES
('Paracetamol 750mg', 12.50, 'Medley', 1),
('Ibuprofeno 400mg', 18.90, 'Neo Química', 1),
('Shampoo Anticaspa', 32.00, 'Clear', 2),
('Sabonete Líquido', 14.50, 'Dove', 2),
('Vitamina C 1g', 29.90, 'Sundown', 3),
('Ômega 3 1000mg', 65.00, 'Essential', 3),
('Protetor Solar FPS50', 79.90, 'La Roche-Posay', 4),
('Lenços Umedecidos Baby', 15.99, 'Pompom', 5);

SELECT * FROM tb_produtos WHERE valor > 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;

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
WHERE c.nome = 'Dermocosméticos';


