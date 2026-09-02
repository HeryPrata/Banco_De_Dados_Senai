-- DELETA O BANCO SE EXISTIR PARA GARANTIR A CRIAÇÃO SEM ERROS
DROP DATABASE IF EXISTS sistema_vendas;

-- CRIA O BANCO COM O UTF CORRETO
CREATE DATABASE IF NOT EXISTS sistema_vendas
DEFAULT CHARACTER SET utf8
COLLATE utf8_unicode_ci;

-- UTILIZA O BANCO PARA AS PRÓXIMAS OPERAÇÕES
USE sistema_vendas;

-- -----------------------------------------------------
-- Table USUÁRIOS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
  `id_usuario` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `cargo` VARCHAR(50) NOT NULL,
  `departamento` VARCHAR(50) NULL DEFAULT NULL,
  `ativo` BOOLEAN DEFAULT TRUE,
  `email` VARCHAR(45) NULL UNIQUE,
  `senha` VARCHAR(45) NULL,
  `perfil` ENUM('ADM', 'GERENTE', 'VENDEDOR', 'ESTOQUISTA', 'VISUALIZADOR')
  );

-- -----------------------------------------------------
-- Table CLIENTES
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS clientes (
  -- DADOS PESSOAIS
  `id_cliente` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `CPF_CNPJ` VARCHAR(20) UNIQUE,
  `email` VARCHAR(100) UNIQUE,
  `telefone` VARCHAR(20),
  `tipo` ENUM('FÍSICO', 'JURÍDICO'),
  -- ENDEREÇO
  `cidade` VARCHAR(100),
  `estado` CHAR(2),
  `cep` VARCHAR(10),
  `logradouro` VARCHAR(100),
  `pais` VARCHAR (20),
  `numero` VARCHAR(5),
  `bairro` VARCHAR(20),
  `complemento` VARCHAR(50),
  -- ADICIONAIS 
  `limite_credito` DECIMAL(10,2) NULL DEFAULT '0.00',
  `data_cadastro` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- -----------------------------------------------------
-- Table PRODUTOS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS produtos(
  `id_produto` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `categoria` VARCHAR(50) NOT NULL,
  `sku` VARCHAR(50) NOT NULL,
  `preco_custo` DECIMAL(10,2) NOT NULL,
  `preco_venda` DECIMAL(10,2) NOT NULL,
  `quantidade_estoque` INT(11) NOT NULL DEFAULT 0,
  `estoque_minimo` INT DEFAULT 0,
  `status` BOOLEAN DEFAULT TRUE,
  `fornecedor` VARCHAR(50) NOT NULL
  );


-- -----------------------------------------------------
-- Table PEDIDOS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pedidos (
  `id_pedido` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `id_cliente` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  `data_pedido`  DATETIME DEFAULT CURRENT_TIMESTAMP ,
  `status_pedido` ENUM('PENDENTE', 'CONCLUIDO', 'CANCELADO', 'EM ANDAMENTO'),
  `valor_total` DECIMAL(10,2) DEFAULT 0.00,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
  );

-- -----------------------------------------------------
-- Table ITENS-PEDIDOS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS itens_pedido (
  `id_item` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `id_pedido` INT(11) NOT NULL,
  `id_produto` INT(11) NOT NULL,
  `quantidade` INT NOT NULL,
  `preco_unitario` DECIMAL(10,2),
  `desconto_percentual` DECIMAL(5,2) DEFAULT 0.00,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
  );

-- -----------------------------------------------------
-- Table PAGAMENTOS
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pagamentos (
  `id_pagamento` INT(11) AUTO_INCREMENT PRIMARY KEY,
  `id_pedido` INT(11) NOT NULL,
  `metodo_pagamento` ENUM('PIX', 'CREDITO', 'DEBITO', 'DINHEIRO', 'BOLETO', 'TICKET'),
  `valor_pago` DECIMAL(10,2) NOT NULL,
  `status` ENUM('PENDENTE', 'APROVADO', 'RECUSADO') DEFAULT 'PENDENTE',
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);



-- ÁREA INSERTS:

-- -----------------------------------------------------
-- 1. INSERTS: USUÁRIOS (5 registros)
-- -----------------------------------------------------
INSERT INTO usuarios (nome, cargo, departamento, ativo, email, senha, perfil) VALUES
('Ana Silva', 'Administradora', 'TI', TRUE, 'ana.silva@empresa.com', 'senha123', 'ADM'),
('Carlos Moura', 'Gerente de Vendas', 'Vendas', TRUE, 'carlos.moura@empresa.com', 'senha123', 'GERENTE'),
('Mariana Costa', 'Vendedora Sênior', 'Vendas', TRUE, 'mariana.costa@empresa.com', 'senha123', 'VENDEDOR'),
('Roberto Dias', 'Estoquista Pleno', 'Logística', TRUE, 'roberto.dias@empresa.com', 'senha123', 'ESTOQUISTA'),
('Fernanda Lima', 'Analista de Dados', 'Diretoria', TRUE, 'fernanda.lima@empresa.com', 'senha123', 'VISUALIZADOR');


-- -----------------------------------------------------
-- 2. INSERTS: CLIENTES (20 registros)
-- -----------------------------------------------------
INSERT INTO clientes (nome, CPF_CNPJ, email, telefone, tipo, cidade, estado, cep, logradouro, pais, numero, bairro, complemento, limite_credito) VALUES
('João Pedro Alves', '11122233344', 'joao.alves@gmail.com', '11988887777', 'FÍSICO', 'São Paulo', 'SP', '01001000', 'Praça da Sé', 'Brasil', '10', 'Sé', 'Apto 12', 1500.00),
('Tech Solutions LTDA', '12345678000199', 'contato@techsolutions.com', '1133334444', 'JURÍDICO', 'Campinas', 'SP', '13010100', 'Av. Brasil', 'Brasil', '1500', 'Centro', 'Sala 4', 15000.00),
('Maria Joaquina', '22233344455', 'maria.j@hotmail.com', '21977776666', 'FÍSICO', 'Rio de Janeiro', 'RJ', '20040000', 'Av. Rio Branco', 'Brasil', '200', 'Centro', '', 2000.00),
('Lucas Martins', '33344455566', 'lucas.martins@yahoo.com', '31966665555', 'FÍSICO', 'Belo Horizonte', 'MG', '30110000', 'Av. Afonso Pena', 'Brasil', '35', 'Centro', 'Casa', 800.00),
('Comércio de Alimentos S.A', '98765432000188', 'compras@alimentos.sa.com', '4132221111', 'JURÍDICO', 'Curitiba', 'PR', '80010010', 'Rua XV de Novembro', 'Brasil', '105', 'Centro', 'Térreo', 25000.00),
('Camila Rocha', '44455566677', 'camila.rocha@gmail.com', '51955554444', 'FÍSICO', 'Porto Alegre', 'RS', '90010020', 'Rua dos Andradas', 'Brasil', '55', 'Centro Histórico', 'Apto 402', 1200.00),
('Bruno Gomes', '55566677788', 'bruno.gomes@outlook.com', '61944443333', 'FÍSICO', 'Brasília', 'DF', '70040010', 'Eixo Monumental', 'Brasil', '1', 'Plano Piloto', 'Bloco B', 3000.00),
('Informatica Express', '11222333000144', 'vendas@infoexpress.com', '7131112222', 'JURÍDICO', 'Salvador', 'BA', '40010000', 'Av. Sete de Setembro', 'Brasil', '400', 'Centro', 'Loja 2', 10000.00),
('Patrícia Mendes', '66677788899', 'patricia.mendes@gmail.com', '81933332222', 'FÍSICO', 'Recife', 'PE', '50010000', 'Av. Boa Viagem', 'Brasil', '1200', 'Boa Viagem', 'Apto 101', 5000.00),
('Roberto Faria', '77788899900', 'roberto.faria@uol.com.br', '85922221111', 'FÍSICO', 'Fortaleza', 'CE', '60010000', 'Av. Beira Mar', 'Brasil', '250', 'Meireles', 'Casa', 2500.00),
('Consultoria Financeira ABC', '44555666000177', 'contato@consultoriaabc.com', '1134445555', 'JURÍDICO', 'São Paulo', 'SP', '01310100', 'Av. Paulista', 'Brasil', '1000', 'Bela Vista', 'Andar 15', 50000.00),
('Tatiana Borges', '88899900011', 'tatiana.borges@gmail.com', '62911110000', 'FÍSICO', 'Goiânia', 'GO', '74000000', 'Av. Goiás', 'Brasil', '50', 'Centro', '', 1800.00),
('Eduardo Nogueira', '99900011122', 'eduardo.n@hotmail.com', '92999998888', 'FÍSICO', 'Manaus', 'AM', '69010000', 'Av. Eduardo Ribeiro', 'Brasil', '30', 'Centro', 'Apto 5', 2200.00),
('Construções Brasil LTDA', '55666777000188', 'obras@construbrasil.com', '2733332222', 'JURÍDICO', 'Vitória', 'ES', '29010000', 'Av. Vitória', 'Brasil', '800', 'Forte São João', 'Galpão', 35000.00),
('Aline Freitas', '00011122233', 'aline.f@yahoo.com', '48988887777', 'FÍSICO', 'Florianópolis', 'SC', '88010000', 'Rua Felipe Schmidt', 'Brasil', '12', 'Centro', 'Casa 2', 900.00),
('Mercado Central', '88999000000111', 'gerencia@mercadocentral.com', '8432223333', 'JURÍDICO', 'Natal', 'RN', '59010000', 'Av. Rio Branco', 'Brasil', '90', 'Cidade Alta', '', 8000.00),
('Igor Maciel', '12312312344', 'igor.maciel@gmail.com', '83977776666', 'FÍSICO', 'João Pessoa', 'PB', '58010000', 'Av. Epitácio Pessoa', 'Brasil', '150', 'Torre', 'Apto 202', 1300.00),
('Sofia Lourenço', '23423423455', 'sofia.lourenco@gmail.com', '86966665555', 'FÍSICO', 'Teresina', 'PI', '64000000', 'Av. Frei Serafim', 'Brasil', '85', 'Centro', 'Casa', 1600.00),
('Transportes Rápidos', '99000111000122', 'logistica@transrapido.com', '6531114444', 'JURÍDICO', 'Cuiabá', 'MT', '78000000', 'Av. do CPA', 'Brasil', '210', 'Centro Político', 'Sala 2', 20000.00),
('Vitor Hugo', '34534534566', 'vitor.hugo@hotmail.com', '67955554444', 'FÍSICO', 'Campo Grande', 'MS', '79000000', 'Av. Afonso Pena', 'Brasil', '300', 'Centro', 'Apto 110', 2100.00);


-- -----------------------------------------------------
-- 3. INSERTS: PRODUTOS (35 registros)
-- -----------------------------------------------------
INSERT INTO produtos (nome, categoria, sku, preco_custo, preco_venda, quantidade_estoque, estoque_minimo, status, fornecedor) VALUES
('Notebook Dell XPS 13', 'Informática', 'NOTE-DELL-XPS13', 4500.00, 6500.00, 20, 5, TRUE, 'Dell Computadores'),
('Notebook Lenovo ThinkPad', 'Informática', 'NOTE-LEN-THINK', 3200.00, 4800.00, 30, 10, TRUE, 'Lenovo BR'),
('Mouse Sem Fio Logitech', 'Acessórios', 'MOUSE-LOGI-WLESS', 50.00, 120.00, 150, 20, TRUE, 'Logitech'),
('Teclado Mecânico Redragon', 'Acessórios', 'TECL-RED-MEC', 120.00, 250.00, 80, 15, TRUE, 'Redragon'),
('Monitor LG Ultrawide 29"', 'Informática', 'MON-LG-UW29', 800.00, 1350.00, 40, 5, TRUE, 'LG Eletronics'),
('Smartphone Samsung Galaxy S23', 'Telefonia', 'SMART-SAM-S23', 2800.00, 4300.00, 50, 10, TRUE, 'Samsung Brasil'),
('Smartphone Apple iPhone 14', 'Telefonia', 'SMART-APP-IP14', 3500.00, 5200.00, 45, 10, TRUE, 'Apple Inc'),
('Fone de Ouvido JBL Bluetooth', 'Áudio', 'FONE-JBL-BT', 150.00, 300.00, 100, 15, TRUE, 'JBL Harman'),
('Cadeira Gamer XT Racer', 'Móveis', 'CAD-GMR-XT', 600.00, 1100.00, 25, 5, TRUE, 'XT Móveis'),
('Mesa de Escritório em L', 'Móveis', 'MESA-ESC-L', 350.00, 700.00, 15, 3, TRUE, 'Móveis Silva'),
('Impressora HP Multifuncional', 'Informática', 'IMP-HP-MULTI', 450.00, 800.00, 30, 5, TRUE, 'HP do Brasil'),
('Roteador TP-Link Gigabit', 'Redes', 'ROT-TP-GIG', 120.00, 250.00, 60, 10, TRUE, 'TP-Link'),
('Cabo de Rede Cat6 10m', 'Acessórios', 'CAB-RED-CAT6', 15.00, 45.00, 200, 50, TRUE, 'Cabos Express'),
('Webcam Logitech C920', 'Acessórios', 'WEBC-LOGI-C920', 200.00, 400.00, 40, 10, TRUE, 'Logitech'),
('Microfone HyperX QuadCast', 'Áudio', 'MIC-HYP-QUAD', 500.00, 950.00, 20, 5, TRUE, 'Kingston'),
('Placa de Vídeo RTX 3060', 'Hardware', 'VGA-RTX-3060', 1600.00, 2400.00, 15, 3, TRUE, 'Nvidia/Asus'),
('Processador Intel Core i7', 'Hardware', 'PROC-INT-I7', 1200.00, 1900.00, 25, 5, TRUE, 'Intel'),
('Memória RAM 16GB Corsair', 'Hardware', 'RAM-COR-16G', 250.00, 450.00, 70, 15, TRUE, 'Corsair'),
('SSD 1TB Kingston M.2', 'Hardware', 'SSD-KIN-1TB', 300.00, 550.00, 80, 20, TRUE, 'Kingston'),
('Fonte Corsair 650W', 'Hardware', 'FON-COR-650W', 350.00, 600.00, 35, 10, TRUE, 'Corsair'),
('Gabinete Gamer NZXT', 'Hardware', 'GAB-NZXT-GMR', 400.00, 750.00, 20, 5, TRUE, 'NZXT'),
('Tablet Samsung Galaxy Tab A8', 'Informática', 'TAB-SAM-A8', 900.00, 1400.00, 40, 10, TRUE, 'Samsung Brasil'),
('iPad Air 5ª Geração', 'Informática', 'TAB-APP-AIR5', 3000.00, 4500.00, 25, 5, TRUE, 'Apple Inc'),
('Smart TV LG 55" 4K', 'Eletrônicos', 'TV-LG-554K', 1800.00, 2800.00, 20, 5, TRUE, 'LG Eletronics'),
('Smart TV Samsung 65" QLED', 'Eletrônicos', 'TV-SAM-65QL', 2500.00, 4000.00, 15, 3, TRUE, 'Samsung Brasil'),
('Caixa de Som Bluetooth Sony', 'Áudio', 'CX-SONY-BT', 200.00, 450.00, 50, 10, TRUE, 'Sony'),
('Projetor Epson Full HD', 'Eletrônicos', 'PROJ-EPS-FHD', 2200.00, 3500.00, 10, 2, TRUE, 'Epson'),
('Headset Gamer Razer', 'Áudio', 'HEAD-RAZ-GMR', 350.00, 650.00, 30, 5, TRUE, 'Razer'),
('Mousepad Gigante Speed', 'Acessórios', 'MPAD-GIG-SPD', 30.00, 80.00, 150, 20, TRUE, 'Generico Import.'),
('Filtro de Linha 5 Tomadas', 'Acessórios', 'FILT-LIN-5T', 20.00, 45.00, 100, 15, TRUE, 'Clamper'),
('Cartão de Memória 128GB', 'Acessórios', 'CART-SD-128G', 40.00, 90.00, 120, 20, TRUE, 'SanDisk'),
('Pen Drive 64GB USB 3.0', 'Acessórios', 'PEN-64G-U3', 25.00, 60.00, 200, 30, TRUE, 'SanDisk'),
('Hub USB 4 Portas', 'Acessórios', 'HUB-USB-4P', 15.00, 40.00, 80, 10, TRUE, 'Multilaser'),
('Suporte para Monitor Articulado', 'Acessórios', 'SUP-MON-ART', 150.00, 280.00, 40, 5, TRUE, 'ELG'),
('Cabo HDMI 2.0 3 Metros', 'Acessórios', 'CAB-HDMI-3M', 12.00, 35.00, 150, 20, TRUE, 'Cabos Express');


-- -----------------------------------------------------
-- 4. INSERTS: PEDIDOS (50 registros)
-- DISTRIBUIÇÃO: id_cliente (1-20), id_usuario (1-5)
-- Os valores totais estão aproximados e coerentes com os itens
-- -----------------------------------------------------
INSERT INTO pedidos (id_cliente, id_usuario, status_pedido, valor_total) VALUES
(1, 2, 'CONCLUIDO', 6620.00), (2, 3, 'PENDENTE', 5050.00), (3, 2, 'EM ANDAMENTO', 4300.00), (4, 3, 'CANCELADO', 250.00), (5, 2, 'CONCLUIDO', 5200.00),
(6, 3, 'CONCLUIDO', 345.00), (7, 2, 'PENDENTE', 1100.00), (8, 3, 'EM ANDAMENTO', 2800.00), (9, 2, 'CONCLUIDO', 120.00), (10, 3, 'CONCLUIDO', 1400.00),
(11, 2, 'PENDENTE', 1350.00), (12, 3, 'CONCLUIDO', 800.00), (13, 2, 'CANCELADO', 400.00), (14, 3, 'CONCLUIDO', 2400.00), (15, 2, 'EM ANDAMENTO', 550.00),
(16, 3, 'CONCLUIDO', 750.00), (17, 2, 'PENDENTE', 650.00), (18, 3, 'CONCLUIDO', 45.00), (19, 2, 'CONCLUIDO', 3500.00), (20, 3, 'EM ANDAMENTO', 600.00),
(1, 2, 'CONCLUIDO', 1900.00), (2, 3, 'CONCLUIDO', 250.00), (3, 2, 'PENDENTE', 450.00), (4, 3, 'CONCLUIDO', 950.00), (5, 2, 'CANCELADO', 280.00),
(6, 3, 'EM ANDAMENTO', 90.00), (7, 2, 'CONCLUIDO', 60.00), (8, 3, 'CONCLUIDO', 40.00), (9, 2, 'PENDENTE', 35.00), (10, 3, 'CONCLUIDO', 4800.00),
(11, 2, 'CONCLUIDO', 80.00), (12, 3, 'EM ANDAMENTO', 45.00), (13, 2, 'CONCLUIDO', 300.00), (14, 3, 'CANCELADO', 4300.00), (15, 2, 'PENDENTE', 1100.00),
(16, 3, 'CONCLUIDO', 700.00), (17, 2, 'CONCLUIDO', 4500.00), (18, 3, 'EM ANDAMENTO', 5200.00), (19, 2, 'CONCLUIDO', 4000.00), (20, 3, 'CONCLUIDO', 1350.00),
(1, 3, 'PENDENTE', 250.00), (2, 2, 'CONCLUIDO', 120.00), (3, 3, 'CANCELADO', 2400.00), (4, 2, 'CONCLUIDO', 550.00), (5, 3, 'EM ANDAMENTO', 1900.00),
(6, 2, 'CONCLUIDO', 600.00), (7, 3, 'CONCLUIDO', 800.00), (8, 2, 'PENDENTE', 1400.00), (9, 3, 'CONCLUIDO', 650.00), (10, 2, 'CONCLUIDO', 2800.00);


-- -----------------------------------------------------
-- 5. INSERTS: ITENS DO PEDIDO (75 registros)
-- DISTRIBUIÇÃO: Para garantir exatos 75, os primeiros 25 pedidos terão 2 itens,
-- e os 25 últimos pedidos (26 a 50) terão 1 item. (25*2 + 25*1 = 75 itens).
-- -----------------------------------------------------
-- Itens dos Pedidos 1 a 25 (2 itens cada)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario, desconto_percentual) VALUES
(1, 1, 1, 6500.00, 0.00), (1, 3, 1, 120.00, 0.00),
(2, 2, 1, 4800.00, 0.00), (2, 4, 1, 250.00, 0.00),
(3, 6, 1, 4300.00, 0.00), (3, 30, 2, 45.00, 0.00),
(4, 12, 1, 250.00, 0.00), (4, 33, 1, 40.00, 0.00),
(5, 7, 1, 5200.00, 0.00), (5, 31, 1, 90.00, 0.00),
(6, 8, 1, 300.00, 0.00), (6, 30, 1, 45.00, 0.00),
(7, 9, 1, 1100.00, 0.00), (7, 29, 1, 80.00, 0.00),
(8, 24, 1, 2800.00, 0.00), (8, 35, 1, 35.00, 0.00),
(9, 3, 1, 120.00, 0.00), (9, 32, 1, 60.00, 0.00),
(10, 22, 1, 1400.00, 0.00), (10, 31, 1, 90.00, 0.00),
(11, 5, 1, 1350.00, 0.00), (11, 34, 1, 280.00, 0.00),
(12, 11, 1, 800.00, 0.00), (12, 32, 1, 60.00, 0.00),
(13, 14, 1, 400.00, 0.00), (13, 33, 1, 40.00, 0.00),
(14, 16, 1, 2400.00, 0.00), (14, 21, 1, 750.00, 0.00),
(15, 19, 1, 550.00, 0.00), (15, 32, 1, 60.00, 0.00),
(16, 21, 1, 750.00, 0.00), (16, 29, 1, 80.00, 0.00),
(17, 28, 1, 650.00, 0.00), (17, 29, 1, 80.00, 0.00),
(18, 13, 1, 45.00, 0.00), (18, 35, 1, 35.00, 0.00),
(19, 27, 1, 3500.00, 0.00), (19, 35, 1, 35.00, 0.00),
(20, 20, 1, 600.00, 0.00), (20, 30, 1, 45.00, 0.00),
(21, 17, 1, 1900.00, 0.00), (21, 18, 1, 450.00, 0.00),
(22, 4, 1, 250.00, 0.00), (22, 29, 1, 80.00, 0.00),
(23, 26, 1, 450.00, 0.00), (23, 31, 1, 90.00, 0.00),
(24, 15, 1, 950.00, 0.00), (24, 29, 1, 80.00, 0.00),
(25, 34, 1, 280.00, 0.00), (25, 30, 1, 45.00, 0.00);

-- Itens dos Pedidos 26 a 50 (1 item cada)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario, desconto_percentual) VALUES
(26, 31, 1, 90.00, 0.00),
(27, 32, 1, 60.00, 0.00),
(28, 33, 1, 40.00, 0.00),
(29, 35, 1, 35.00, 0.00),
(30, 2, 1, 4800.00, 0.00),
(31, 29, 1, 80.00, 0.00),
(32, 13, 1, 45.00, 0.00),
(33, 8, 1, 300.00, 0.00),
(34, 6, 1, 4300.00, 0.00),
(35, 9, 1, 1100.00, 0.00),
(36, 10, 1, 700.00, 0.00),
(37, 23, 1, 4500.00, 0.00),
(38, 7, 1, 5200.00, 0.00),
(39, 25, 1, 4000.00, 0.00),
(40, 5, 1, 1350.00, 0.00),
(41, 12, 1, 250.00, 0.00),
(42, 3, 1, 120.00, 0.00),
(43, 16, 1, 2400.00, 0.00),
(44, 19, 1, 550.00, 0.00),
(45, 17, 1, 1900.00, 0.00),
(46, 20, 1, 600.00, 0.00),
(47, 11, 1, 800.00, 0.00),
(48, 22, 1, 1400.00, 0.00),
(49, 28, 1, 650.00, 0.00),
(50, 24, 1, 2800.00, 0.00);


-- -----------------------------------------------------
-- 6. INSERTS: PAGAMENTOS (50 registros)
-- DISTRIBUIÇÃO: 1 pagamento para cada pedido (1 a 50)
-- -----------------------------------------------------
INSERT INTO pagamentos (id_pedido, metodo_pagamento, valor_pago, status) VALUES
(1, 'PIX', 6620.00, 'APROVADO'), (2, 'CREDITO', 5050.00, 'PENDENTE'), (3, 'BOLETO', 4300.00, 'PENDENTE'), (4, 'DEBITO', 250.00, 'RECUSADO'), (5, 'CREDITO', 5200.00, 'APROVADO'),
(6, 'PIX', 345.00, 'APROVADO'), (7, 'BOLETO', 1100.00, 'PENDENTE'), (8, 'CREDITO', 2800.00, 'PENDENTE'), (9, 'DEBITO', 120.00, 'APROVADO'), (10, 'PIX', 1400.00, 'APROVADO'),
(11, 'CREDITO', 1350.00, 'PENDENTE'), (12, 'PIX', 800.00, 'APROVADO'), (13, 'BOLETO', 400.00, 'RECUSADO'), (14, 'CREDITO', 2400.00, 'APROVADO'), (15, 'DEBITO', 550.00, 'PENDENTE'),
(16, 'PIX', 750.00, 'APROVADO'), (17, 'BOLETO', 650.00, 'PENDENTE'), (18, 'DINHEIRO', 45.00, 'APROVADO'), (19, 'CREDITO', 3500.00, 'APROVADO'), (20, 'DEBITO', 600.00, 'PENDENTE'),
(21, 'PIX', 1900.00, 'APROVADO'), (22, 'CREDITO', 250.00, 'APROVADO'), (23, 'BOLETO', 450.00, 'PENDENTE'), (24, 'PIX', 950.00, 'APROVADO'), (25, 'DEBITO', 280.00, 'RECUSADO'),
(26, 'CREDITO', 90.00, 'PENDENTE'), (27, 'PIX', 60.00, 'APROVADO'), (28, 'DINHEIRO', 40.00, 'APROVADO'), (29, 'BOLETO', 35.00, 'PENDENTE'), (30, 'CREDITO', 4800.00, 'APROVADO'),
(31, 'PIX', 80.00, 'APROVADO'), (32, 'DEBITO', 45.00, 'PENDENTE'), (33, 'CREDITO', 300.00, 'APROVADO'), (34, 'BOLETO', 4300.00, 'RECUSADO'), (35, 'PIX', 1100.00, 'PENDENTE'),
(36, 'CREDITO', 700.00, 'APROVADO'), (37, 'PIX', 4500.00, 'APROVADO'), (38, 'BOLETO', 5200.00, 'PENDENTE'), (39, 'CREDITO', 4000.00, 'APROVADO'), (40, 'PIX', 1350.00, 'APROVADO'),
(41, 'DEBITO', 250.00, 'PENDENTE'), (42, 'PIX', 120.00, 'APROVADO'), (43, 'CREDITO', 2400.00, 'RECUSADO'), (44, 'PIX', 550.00, 'APROVADO'), (45, 'BOLETO', 1900.00, 'PENDENTE'),
(46, 'CREDITO', 600.00, 'APROVADO'), (47, 'PIX', 800.00, 'APROVADO'), (48, 'BOLETO', 1400.00, 'PENDENTE'), (49, 'CREDITO', 650.00, 'APROVADO'), (50, 'PIX', 2800.00, 'APROVADO');

-- LISTA DE VIEWS

-- lista de produtos ativos
create view vw_produtos_ativos as
select id_produto, sku, nome, categoria, preco_venda, quantidade_estoque
from produtos
where status = true;

select * from vw_produtos_ativos;

-- lista de produtos com estoque abaixo do minimo
create or replace view vW_alerta_estoque_minimo as 
select sku, nome, fornecedor, quantidade_estoque, estoque_minimo
from produtos
where quantidade_estoque <= estoque_minimo and status = true;

select * from vw_alerta_estoque_minimo;

-- VIEWS PARA GESTÃO DE CLIENTES
create or replace view vw_contatos_marketing as
select nome, email, telefone, cidade, estado
from clientes
where email is not null;

-- views de pessoas fisicas e juridicas
create or replace view vw_pessoas_fisicas as
select nome, id_cliente,tipo
from clientes
where tipo = 'FÍSICO';

create or replace view vw_pessoas_fisicas as
select nome, id_cliente,tipo
from clientes
where tipo = 'JURÍDICO';

-- view para resumo de vendas
create or replace view vw_resumo_pedidos as
select p.id_pedido, p.data_pedido, c.nome as cliente, p.status_pedido, p.valor_total
from pedidos as p
join clintes as c on p.id_cliente = c.id_cliente
join usarios as u on p.id_usario = u.id_usario;

