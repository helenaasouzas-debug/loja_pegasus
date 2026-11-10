-- ============================================================
-- TRABALHO FINAL - BANCO DE DADOS RELACIONAL: LOJA PEGASUS
-- ============================================================

-- 1. CRIAÇÃO E SELEÇÃO DO BANCO DE DADOS
CREATE DATABASE IF NOT EXISTS loja_pegasus;
USE loja_pegasus;

-- ============================================================
-- 2. ESTRUTURA FÍSICA (TABELAS COM PK, FK, UNIQUE E NOT NULL)
-- ============================================================

CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE FORNECEDOR (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_fantasia VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE
);

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE PRODUTO (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    url_imagem VARCHAR(255) DEFAULT 'img/placeholder.png',
    id_categoria INT NOT NULL,
    id_fornecedor INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor)
);

CREATE TABLE PEDIDO (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

-- Entidade Fraca (Relacionamento 1:1 com PEDIDO)
CREATE TABLE ENDERECO_ENTREGA (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL UNIQUE,
    rua VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);

-- Entidade Associativa (Relacionamento N:N entre PEDIDO e PRODUTO)
CREATE TABLE ITEM_PEDIDO (
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

-- ============================================================
-- 3. CARGA INICIAL DE DADOS (POPULANDO O BANCO)
-- ============================================================

-- 3.1 Categoria (15 registros)
INSERT INTO CATEGORIA (nome) VALUES 
('Mangás'), ('HQs & Quadrinhos'), ('Action Figures'), ('Camisetas'), ('Canecas'),
('Colecionáveis Premium'), ('Posteres & Quadros'), ('Jogos de Tabuleiro'), ('Card Games'), ('Chaveiros'),
('Pelúcias'), ('Acessórios Geek'), ('Estátuas'), ('Funko Pop'), ('Light Novels');

-- 3.2 Fornecedor (15 registros)
INSERT INTO FORNECEDOR (nome_fantasia, cnpj) VALUES 
('Panini Comics Brasil', '11.111.111/0001-11'),
('Editora JBC', '22.222.222/0001-22'),
('Bandai Tamashii Nations', '33.333.333/0001-33'),
('Iron Studios Distribuidora', '44.444.444/0001-44'),
('Piticas Moda Geek', '55.555.555/0001-55'),
('Canecas & Cia Geek', '66.666.666/0001-66'),
('Pipoca & Nanquim Editora', '77.777.777/0001-77'),
('Devir Livraria e Editora', '88.888.888/0001-88'),
('Funko Importadora Brasil', '99.999.999/0001-99'),
('Good Smile Company Brasil', '10.101.010/0001-10'),
('Kotobukiya Distribuição', '12.121.212/0001-12'),
('NewPOP Editora', '13.131.313/0001-13'),
('Mythos Editora', '14.141.414/0001-14'),
('Hasbro Brasil Colecionáveis', '15.151.515/0001-15'),
('McFarlane Toys Brasil', '16.161.616/0001-16');

-- 3.3 Cliente (20 registros - Clientes 19 e 20 sem pedidos para testes de auditoria)
INSERT INTO CLIENTE (nome, email, cpf) VALUES 
('Peter Parker', 'peter@dailybugle.com', '111.111.111-11'),
('Bruce Wayne', 'bruce@wayne.com', '222.222.222-22'),
('Tony Stark', 'tony@stark.com', '333.333.333-33'),
('Clark Kent', 'clark@dailyplanet.com', '444.444.444-44'),
('Diana Prince', 'diana@amazon.com', '555.555.555-55'),
('Barry Allen', 'barry@centralcitypd.com', '666.666.666-66'),
('Steve Rogers', 'steve@avengers.com', '777.777.777-77'),
('Natasha Romanoff', 'natasha@shield.gov', '888.888.888-88'),
('Hal Jordan', 'hal@greenlantern.com', '123.123.123-12'),
('Arthur Curry', 'arthur@atlantis.gov', '234.234.234-23'),
('Wade Wilson', 'wade@deadpool.com', '345.345.345-34'),
('Matt Murdock', 'matt@nelsonmurdock.com', '456.456.456-45'),
('Oliver Queen', 'oliver@queenindustries.com', '567.567.567-56'),
('Carol Danvers', 'carol@usaf.gov', '678.678.678-67'),
('Scott Lang', 'scott@pymtech.com', '789.789.789-78'),
('Jean Grey', 'jean@xmen.edu', '890.890.890-89'),
('Logan Howlett', 'logan@weaponx.com', '901.901.901-90'),
('Charles Xavier', 'charles@xmen.edu', '012.012.012-01'),
('Cliente Sem Compras 1', 'semcompras1@email.com', '999.999.999-91'),
('Cliente Sem Compras 2', 'semcompras2@email.com', '999.999.999-92');

-- 3.4 Produto (36 registros da Loja Pegasus com caminhos de imagem)
INSERT INTO PRODUTO (nome, preco, url_imagem, id_categoria, id_fornecedor) VALUES 
('Mangá One Piece Volume 01', 34.90, 'img/mangas/one_piece_vol_01.jpg', 1, 1),
('Mangá One Piece Volume 02', 34.90, 'img/mangas/one_piece_vol_02.jpg', 1, 1),
('Mangá One Piece Volume 03', 34.90, 'img/mangas/one_piece_vol_03.jpg', 1, 1),
('Mangá One Piece Volume 04', 34.90, 'img/mangas/one_piece_vol_04.jpg', 1, 1),
('Mangá One Piece Volume 05', 34.90, 'img/mangas/one_piece_vol_05.jpg', 1, 1),
('Mangá One Piece Volume 06', 34.90, 'img/mangas/one_piece_vol_06.jpg', 1, 1),
('Mangá One Piece Volume 07', 34.90, 'img/mangas/one_piece_vol_07.jpg', 1, 1),
('Mangá One Piece Volume 08', 34.90, 'img/mangas/one_piece_vol_08.jpg', 1, 1),
('Mangá One Piece Volume 09', 34.90, 'img/mangas/one_piece_vol_09.jpg', 1, 1),
('Mangá One Piece Volume 10', 34.90, 'img/mangas/one_piece_vol_10.jpg', 1, 1),
('Mangá One Piece Volume 11', 34.90, 'img/mangas/one_piece_vol_11.jpg', 1, 1),
('Mangá One Piece Volume 12', 34.90, 'img/mangas/one_piece_vol_12.jpg', 1, 1),
('Mangá One Piece Volume 13', 34.90, 'img/mangas/one_piece_vol_13.jpg', 1, 1),
('Mangá One Piece Volume 14', 34.90, 'img/mangas/one_piece_vol_14.jpg', 1, 1),
('Mangá One Piece Volume 15', 34.90, 'img/mangas/one_piece_vol_15.jpg', 1, 1),
('HQ Homem-Aranha Volume 01', 49.90, 'img/hqs/spiderman_vol_01.jpg', 2, 1),
('HQ Homem-Aranha Volume 02', 49.90, 'img/hqs/spiderman_vol_02.jpg', 2, 1),
('HQ Batman Volume 01', 54.90, 'img/hqs/batman_vol_01.jpg', 2, 1),
('HQ Batman Volume 02', 54.90, 'img/hqs/batman_vol_02.jpg', 2, 1),
('Figure Roronoa Zoro 15cm', 250.00, 'img/figures/zoro_15cm.jpg', 3, 3),
('Figure Monkey D. Luffy 15cm', 250.00, 'img/figures/luffy_15cm.jpg', 3, 3),
('Figure Nami 15cm', 240.00, 'img/figures/nami_15cm.jpg', 3, 3),
('Figure Tony Tony Chopper 10cm', 180.00, 'img/figures/chopper_10cm.jpg', 3, 3),
('Figure Sanji 15cm', 245.00, 'img/figures/sanji_15cm.jpg', 3, 3),
('Figure Usopp 15cm', 235.00, 'img/figures/usopp_15cm.jpg', 3, 3),
('Camiseta Gojo (Tamanho P)', 79.90, 'img/camisetas/gojo_p.jpg', 4, 5),
('Camiseta Gojo (Tamanho M)', 79.90, 'img/camisetas/gojo_m.jpg', 4, 5),
('Camiseta Sukuna (Tamanho P)', 79.90, 'img/camisetas/sukuna_p.jpg', 4, 5),
('Camiseta Sukuna (Tamanho G)', 79.90, 'img/camisetas/sukuna_g.jpg', 4, 5),
('Camiseta Ichigo (Tamanho M)', 79.90, 'img/camisetas/ichigo_m.jpg', 4, 5),
('Camiseta Ichigo (Tamanho G)', 79.90, 'img/camisetas/ichigo_g.jpg', 4, 5),
('Caneca Marvel Comics', 45.00, 'img/canecas/marvel.jpg', 5, 6),
('Caneca DC Comics', 45.00, 'img/canecas/dc.jpg', 5, 6),
('Caneca Attack on Titan', 49.90, 'img/canecas/aot.jpg', 5, 6),
('Caneca Star Wars Saga', 49.90, 'img/canecas/star_wars.jpg', 5, 6),
('Caneca Banguela (Como Treinar o Seu Dragão)', 52.00, 'img/canecas/banguela.jpg', 5, 6);

-- 3.5 Pedido (20 registros)
INSERT INTO PEDIDO (data_pedido, id_cliente) VALUES 
('2026-10-01 10:30:00', 1), ('2026-10-02 11:15:00', 2), ('2026-10-03 14:20:00', 3),
('2026-10-04 16:45:00', 4), ('2026-10-05 09:10:00', 5), ('2026-10-06 18:00:00', 6),
('2026-10-07 13:25:00', 7), ('2026-10-08 15:50:00', 8), ('2026-10-09 12:40:00', 9),
('2026-10-10 17:30:00', 10), ('2026-10-11 10:00:00', 11), ('2026-10-12 11:30:00', 12),
('2026-10-13 14:00:00', 13), ('2026-10-14 16:10:00', 14), ('2026-10-15 19:20:00', 15),
('2026-10-16 10:45:00', 16), ('2026-10-17 15:00:00', 17), ('2026-10-18 18:30:00', 18),
('2026-10-19 11:00:00', 1),  ('2026-10-20 14:30:00', 2);

-- 3.6 Endereço de Entrega (20 registros)
INSERT INTO ENDERECO_ENTREGA (id_pedido, rua, cidade, cep) VALUES 
(1, 'Rua dos Bobos, 0', 'São Paulo', '01000-000'),
(2, 'Mansão Wayne, 100', 'Gotham City', '02000-000'),
(3, 'Torre Stark, 200', 'Nova York', '03000-000'),
(4, 'Av. Paulista, 1500', 'São Paulo', '01310-100'),
(5, 'Rua das Amazonas, 50', 'Rio de Janeiro', '20000-000'),
(6, 'Rua Velocidade, 99', 'Campinas', '13000-000'),
(7, 'Alameda dos Heróis, 77', 'Belo Horizonte', '30000-000'),
(8, 'Av. SHIELD, 888', 'Curitiba', '80000-000'),
(9, 'Rua Lanterna, 12', 'Porto Alegre', '90000-000'),
(10, 'Av. Atlântica, 500', 'Salvador', '40000-000'),
(11, 'Rua das Chimichangas, 69', 'Fortaleza', '60000-000'),
(12, 'Rua Hell`s Kitchen, 45', 'Recife', '50000-000'),
(13, 'Av. Arqueiro, 101', 'Brasília', '70000-000'),
(14, 'Rua Estelar, 33', 'Goiânia', '74000-000'),
(15, 'Rua Homem-Formiga, 12', 'Manaus', '69000-000'),
(16, 'Av. Fênix, 90', 'Florianópolis', '88000-000'),
(17, 'Rua Arma X, 300', 'Belém', '66000-000'),
(18, 'Instituto Xavier, 1', 'São Paulo', '04000-000'),
(19, 'Rua dos Bobos, 0', 'São Paulo', '01000-000'),
(20, 'Mansão Wayne, 100', 'Gotham City', '02000-000');

-- 3.7 Item Pedido (32 registros - Produtos 35 e 36 propositalmente sem vendas)
INSERT INTO ITEM_PEDIDO (id_pedido, id_produto, quantidade, preco_unitario) VALUES 
(1, 1, 1, 34.90), (1, 20, 1, 250.00),
(2, 16, 2, 49.90), (2, 26, 1, 79.90),
(3, 21, 1, 250.00), (3, 32, 2, 45.00),
(4, 18, 1, 54.90), (4, 33, 1, 45.00),
(5, 22, 1, 240.00), (6, 23, 1, 180.00),
(7, 27, 2, 79.90), (8, 28, 1, 79.90),
(9, 2, 1, 34.90), (9, 3, 1, 34.90),
(10, 24, 1, 245.00), (11, 25, 1, 235.00),
(12, 17, 1, 49.90), (13, 19, 1, 54.90),
(14, 29, 1, 79.90), (15, 30, 1, 79.90),
(16, 31, 1, 79.90), (17, 34, 1, 49.90),
(18, 4, 1, 34.90), (18, 5, 1, 34.90),
(19, 6, 1, 34.90), (19, 7, 1, 34.90),
(20, 8, 1, 34.90), (20, 9, 1, 34.90), (20, 10, 1, 34.90),
(1, 11, 1, 34.90), (2, 12, 1, 34.90);

-- ============================================================
-- 4. CONSULTAS OPERACIONAIS (PARTE 5 - 8 CONSULTAS)
-- ============================================================

-- Consulta 1: Pesquisa com Filtros (WHERE, AND, OR, BETWEEN)
SELECT * FROM PRODUTO 
WHERE preco BETWEEN 40.00 AND 200.00 AND (id_categoria = 2 OR id_categoria = 4);

-- Consulta 2: Pesquisa Textual (LIKE)
SELECT id_produto, nome, preco FROM PRODUTO 
WHERE nome LIKE '%One Piece%' OR nome LIKE '%Gojo%';

-- Consulta 3: Ordenação (ORDER BY em 2+ campos)
SELECT id_produto, nome, id_categoria, preco FROM PRODUTO 
ORDER BY id_categoria ASC, preco DESC;

-- Consulta 4: Relacionamento Simples (INNER JOIN entre 2 tabelas)
SELECT p.nome AS produto, p.preco, c.nome AS categoria 
FROM PRODUTO p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria;

-- Consulta 5: Relacionamento Intermediário (INNER JOIN entre 3 tabelas)
SELECT p.nome AS produto, c.nome AS categoria, f.nome_fantasia AS fornecedor
FROM PRODUTO p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
INNER JOIN FORNECEDOR f ON p.id_fornecedor = f.id_fornecedor;

-- Consulta 6: Registros sem Relacionamento (LEFT JOIN - Clientes sem Pedidos)
SELECT c.id_cliente, c.nome, c.email 
FROM CLIENTE c
LEFT JOIN PEDIDO p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;

-- Consulta 7: Estatísticas por Grupo (GROUP BY, HAVING, COUNT, SUM, AVG)
SELECT c.nome AS categoria, COUNT(p.id_produto) AS total_produtos, AVG(p.preco) AS preco_medio
FROM PRODUTO p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome
HAVING AVG(p.preco) > 50.00;

-- Consulta 8: Classificação de Dados (CASE)
SELECT nome, preco,
    CASE 
        WHEN preco < 50.00 THEN 'Econômico'
        WHEN preco BETWEEN 50.00 AND 150.00 THEN 'Intermediário'
        ELSE 'Colecionável Premium'
    END AS faixa_categoria
FROM PRODUTO;

-- ============================================================
-- 5. VIEWS (PARTE 7 - 2 VIEWS)
-- ============================================================

-- View Operacional (mínimo 3 tabelas com JOIN)
CREATE VIEW vw_detalhes_produtos AS
SELECT p.id_produto, p.nome AS produto, p.preco, p.url_imagem, c.nome AS categoria, f.nome_fantasia AS fornecedor,
    CASE 
        WHEN p.preco < 50.00 THEN 'Econômico'
        WHEN p.preco BETWEEN 50.00 AND 150.00 THEN 'Intermediário'
        ELSE 'Colecionável Premium'
    END AS faixa_preco
FROM PRODUTO p
INNER JOIN CATEGORIA c ON p.id_categoria = c.id_categoria
INNER JOIN FORNECEDOR f ON p.id_fornecedor = f.id_fornecedor;

-- View Gerencial (mínimo 3 tabelas com GROUP BY e agregação)
CREATE VIEW vw_desempenho_categorias AS
SELECT c.nome AS categoria, COUNT(DISTINCT pr.id_produto) AS qtd_produtos_cadastrados,
       COALESCE(SUM(ip.quantidade), 0) AS total_unidades_vendidas,
       COALESCE(SUM(ip.quantidade * ip.preco_unitario), 0) AS faturamento_total
FROM CATEGORIA c
LEFT JOIN PRODUTO pr ON c.id_categoria = pr.id_categoria
LEFT JOIN ITEM_PEDIDO ip ON pr.id_produto = ip.id_produto
GROUP BY c.id_categoria, c.nome;

-- ============================================================
-- 6. CONSULTAS GERENCIAIS (PARTE 6 - 9 CONSULTAS)
-- ============================================================

-- Consulta 1: Ranking Principal (Top 5 Clientes que mais compraram)
SELECT c.nome, COUNT(p.id_pedido) AS total_pedidos
FROM CLIENTE c
INNER JOIN PEDIDO p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY total_pedidos DESC
LIMIT 5;

-- Consulta 2: Indicador Financeiro (Faturamento por Categoria)
SELECT c.nome AS categoria, SUM(ip.quantidade * ip.preco_unitario) AS faturamento_total
FROM ITEM_PEDIDO ip
INNER JOIN PRODUTO pr ON ip.id_produto = pr.id_produto
INNER JOIN CATEGORIA c ON pr.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome;

-- Consulta 3: Registros Acima da Média (Produtos com preço acima da média geral)
SELECT nome, preco FROM PRODUTO
WHERE preco > (SELECT AVG(preco) FROM PRODUTO)
ORDER BY preco DESC;

-- Consulta 4: Relatório Integrado (4 Tabelas: Cliente, Pedido, Item, Produto)
SELECT c.nome AS cliente, p.id_pedido, p.data_pedido, pr.nome AS produto, ip.quantidade, ip.preco_unitario
FROM CLIENTE c
INNER JOIN PEDIDO p ON c.id_cliente = p.id_cliente
INNER JOIN ITEM_PEDIDO ip ON p.id_pedido = ip.id_pedido
INNER JOIN PRODUTO pr ON ip.id_produto = pr.id_produto;

-- Consulta 5: Relatório Integrado Avançado (5 Tabelas: Cliente, Pedido, Item, Produto, Categoria)
SELECT c.nome AS cliente, p.id_pedido, cat.nome AS categoria, pr.nome AS produto, (ip.quantidade * ip.preco_unitario) AS total_item
FROM CLIENTE c
INNER JOIN PEDIDO p ON c.id_cliente = p.id_cliente
INNER JOIN ITEM_PEDIDO ip ON p.id_pedido = ip.id_pedido
INNER JOIN PRODUTO pr ON ip.id_produto = pr.id_produto
INNER JOIN CATEGORIA cat ON pr.id_categoria = cat.id_categoria
ORDER BY p.data_pedido DESC;

-- Consulta 6: Identificação de Problemas (Produtos cadastrados sem NENHUMA venda)
SELECT pr.id_produto, pr.nome, pr.preco 
FROM PRODUTO pr
LEFT JOIN ITEM_PEDIDO ip ON pr.id_produto = ip.id_produto
WHERE ip.id_produto IS NULL;

-- Consulta 7: Dashboard Executivo (COUNT, SUM, AVG, MAX, MIN em uma única consulta)
SELECT 
    COUNT(DISTINCT id_pedido) AS total_pedidos_realizados,
    SUM(quantidade * preco_unitario) AS faturamento_geral,
    AVG(quantidade * preco_unitario) AS ticket_medio_item,
    MAX(preco_unitario) AS item_mais_caro_vendido,
    MIN(preco_unitario) AS item_mais_barato_vendido
FROM ITEM_PEDIDO;

-- Consulta 8: Consulta Complexa (JOIN + GROUP BY + HAVING + Subconsulta)
SELECT cat.nome AS categoria, SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM ITEM_PEDIDO ip
INNER JOIN PRODUTO pr ON ip.id_produto = pr.id_produto
INNER JOIN CATEGORIA cat ON pr.id_categoria = cat.id_categoria
GROUP BY cat.id_categoria, cat.nome
HAVING faturamento > (
    SELECT AVG(sub.total_cat) FROM (
        SELECT SUM(ip2.quantidade * ip2.preco_unitario) AS total_cat
        FROM ITEM_PEDIDO ip2
        INNER JOIN PRODUTO pr2 ON ip2.id_produto = pr2.id_produto
        GROUP BY pr2.id_categoria
    ) sub
);

-- Consulta 9: Consulta Utilizando View
SELECT * FROM vw_detalhes_produtos WHERE faixa_preco = 'Colecionável Premium';

-- ============================================================
-- 7. ÍNDICES (PARTE 8)
-- ============================================================

CREATE INDEX idx_produto_nome ON PRODUTO(nome);
CREATE INDEX idx_produto_preco ON PRODUTO(preco);
CREATE INDEX idx_cliente_email ON CLIENTE(email);
CREATE INDEX idx_pedido_data ON PEDIDO(data_pedido);

SHOW INDEX FROM PRODUTO;

-- ============================================================
-- 8. PROCEDURE (PARTE 9)
-- ============================================================

DELIMITER //
CREATE PROCEDURE sp_relatorio_vendas_cliente(IN p_id_cliente INT)
BEGIN
    SELECT c.nome AS cliente, p.id_pedido, p.data_pedido, pr.nome AS produto, ip.quantidade, ip.preco_unitario, (ip.quantidade * ip.preco_unitario) AS total_item
    FROM CLIENTE c
    INNER JOIN PEDIDO p ON c.id_cliente = p.id_cliente
    INNER JOIN ITEM_PEDIDO ip ON p.id_pedido = ip.id_pedido
    INNER JOIN PRODUTO pr ON ip.id_produto = pr.id_produto
    WHERE c.id_cliente = p_id_cliente
    ORDER BY p.data_pedido DESC;
END //
DELIMITER ;

-- Teste da Procedure
CALL sp_relatorio_vendas_cliente(1);

-- ============================================================
-- 9. FUNCTION (PARTE 10)
-- ============================================================

DELIMITER //
CREATE FUNCTION fn_calcular_desconto(p_valor DECIMAL(10,2), p_percentual DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_valor - (p_valor * (p_percentual / 100));
END //
DELIMITER ;

-- Teste da Function
SELECT nome, preco, fn_calcular_desconto(preco, 10.00) AS preco_com_10_desconto 
FROM PRODUTO WHERE id_categoria = 3;

-- ============================================================
-- 10. SEGURANÇA E CONTROLE DE ACESSO (PARTE 11 E 12)
-- ============================================================

CREATE USER IF NOT EXISTS 'usuario_consulta'@'localhost' IDENTIFIED BY 'Senha123!';
CREATE USER IF NOT EXISTS 'usuario_operador'@'localhost' IDENTIFIED BY 'Senha123!';
CREATE USER IF NOT EXISTS 'usuario_gerente'@'localhost' IDENTIFIED BY 'Senha123!';
CREATE USER IF NOT EXISTS 'usuario_administrador'@'localhost' IDENTIFIED BY 'SenhaAdmin123!';

GRANT SELECT ON loja_pegasus.* TO 'usuario_consulta'@'localhost';
GRANT SELECT, INSERT, UPDATE ON loja_pegasus.* TO 'usuario_operador'@'localhost';
GRANT SELECT ON loja_pegasus.vw_detalhes_produtos TO 'usuario_gerente'@'localhost';
GRANT SELECT ON loja_pegasus.vw_desempenho_categorias TO 'usuario_gerente'@'localhost';
GRANT ALL PRIVILEGES ON loja_pegasus.* TO 'usuario_administrador'@'localhost';

FLUSH PRIVILEGES;
