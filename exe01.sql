CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
	tipo VARCHAR(255)
);

CREATE TABLE tb_personagens(
	id BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    defesa INT,
    ataque INT,
    vida INT,
    classe_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes(nome, tipo)
VALUES
('Guerreiro', 'Força'),
('Mago', 'Magia'),
('Arqueiro', 'Precisão'),
('Assassino', 'Agilidade'),
('Cavaleiro', 'Defesa');

INSERT INTO tb_personagens (nome, defesa, ataque, vida, classe_id) VALUES
('Thorin', 2000, 6000, 300, 1),   
('Elrond', 1500, 9500, 220, 2),  
('Legolas', 1000, 8500, 250, 3),  
('Shade', 3000, 1100, 200, 4),  
('Arthur', 5000, 700, 350, 5),   
('Mira', 2000, 8200, 240, 3),     
('Gandor', 1800, 1000, 210, 2), 
('Ragnar', 1300, 750, 320, 1);   

SELECT * FROM tb_personagens WHERE ataque > 2000;

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT 
    p.*, 
    c.nome AS classe, 
    c.tipo
FROM tb_personagens p
INNER JOIN tb_classes c
    ON p.classe_id = c.id;

SELECT 
    p.*, 
    c.nome AS classe, 
    c.tipo
FROM tb_personagens p
INNER JOIN tb_classes c
    ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro';


