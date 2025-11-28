CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao VARCHAR(255)
);

CREATE TABLE tb_pizzas(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    valor DECIMAL(6,2),
    sabor VARCHAR(255),
    borda VARCHAR(255),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)	
);

INSERT INTO tb_categorias(nome, descricao)
VALUES
('Tradicional', 'Pizzas com sabores clássicos e ingredientes comuns.'),
('Premium', 'Pizzas com ingredientes especiais e de alta qualidade.'),
('Vegetariana', 'Pizzas feitas sem carne, usando apenas vegetais e derivados.'),
('Vegana', 'Pizzas totalmente livres de ingredientes de origem animal.'),
('Doces', 'Pizzas preparadas com coberturas doces e sobremesas.');

INSERT INTO tb_pizzas (nome, valor, sabor, borda, categoria_id) VALUES
('Calabresa Tradicional', 45.90, 'Calabresa', 'Sem borda', 1),
('Margherita Clássica', 42.50, 'Queijo e Manjericão', 'Sem borda', 1),
('Quatro Queijos Premium', 59.90, '4 Queijos', 'Catupiry', 2),
('Pepperoni Especial', 62.00, 'Pepperoni', 'Cheddar', 2),
('Vegetariana Verde', 48.90, 'Legumes', 'Sem borda', 3),
('Vegana Mix', 52.00, 'Vegetais com queijo vegano', 'Sem borda', 4),
('Chocolate ao Leite', 39.90, 'Chocolate', 'Chocolate', 5),
('Prestígio', 44.00, 'Chocolate e Coco', 'Chocolate', 5);

SELECT * FROM tb_pizzas WHERE valor > 45.00;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT 
    p.*, 
    c.nome AS categoria,
    c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id;

SELECT 
    p.*, 
    c.nome as categoria,
    c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c
    ON p.categoria_id = c.id
WHERE c.nome = 'Doces';



