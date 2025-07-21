CREATE DATABASE `ecommerce`;
USE `ecommerce`;

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `codigo_cliente` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`codigo_cliente`)
);

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `codigo_categoria` int NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_categoria`)
);


--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `numero_pedido` int NOT NULL AUTO_INCREMENT,
  `codigo_cliente` int DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status` enum('pago','enviado','entregue','cancelado') DEFAULT NULL,
  PRIMARY KEY (`numero_pedido`),
  KEY `codigo_cliente` (`codigo_cliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`)
);

--
-- Table structure for table `produto`
--

CREATE TABLE `produto` (
  `codigo_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` text,
  `preco` decimal(10,2) DEFAULT NULL, -- Alterado aqui para 2 casas decimais
  `codigo_categoria` int DEFAULT NULL,
  PRIMARY KEY (`codigo_produto`),
  KEY `codigo_categoria` (`codigo_categoria`),
  CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo_categoria`)
);

--
-- Table structure for table `itempedido`
--

CREATE TABLE `itempedido` (
  `numero_pedido` int NOT NULL,
  `codigo_produto` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`numero_pedido`,`codigo_produto`),
  KEY `codigo_produto` (`codigo_produto`),
  CONSTRAINT `itempedido_ibfk_1` FOREIGN KEY (`numero_pedido`) REFERENCES `pedido` (`numero_pedido`),
  CONSTRAINT `itempedido_ibfk_2` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo_produto`)
);

-- Inserção de dados para as tabelas
insert into categoria (codigo_categoria, nome_categoria) values (1, 'higiene');
insert into categoria (codigo_categoria, nome_categoria) values (2, 'carnes');
insert into categoria (codigo_categoria, nome_categoria) values (3, 'grãos');
insert into categoria (codigo_categoria, nome_categoria) values (4, 'refrigerantes');
insert into categoria (codigo_categoria, nome_categoria) values (5, 'laticínios');
insert into categoria (codigo_categoria, nome_categoria) values (6, 'sucos');
insert into categoria (codigo_categoria, nome_categoria) values (7, 'doces');
insert into categoria (codigo_categoria, nome_categoria) values (8, 'massas');
insert into categoria (codigo_categoria, nome_categoria) values (9, 'frutas');
insert into categoria (codigo_categoria, nome_categoria) values (10, 'verduras');

insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (1, 'Iris Bastista Lima', 'ibl3020@gmail.com', 37544685912, 'Rua Lindamar Franco, 324');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (2, 'Diego Brando', 'theworld@gmail.com',65616000174,'Rua da Inglaterra');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (3, 'Susana Oliveira da Silva', 'SOS1616@gmail.com',14535401100,'Rua Livina da Esperança');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (4, 'Michele Ribeiro Costa', 'michelecosta2@gmail.com',74411100330,'Rua Alcides de Miranda');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (5, 'Viviane de Conceição Araujo ', 'vca40@gmail.com',12498655513,'Rua da Luz Candida');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (6, 'Romeu Alencar', 'romeu.alencar@gmail.com',12398754600,'Avenida Senador Roberto Cruz');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (7, 'Uriel Araujo Freitas dos Santos', 'Urieç.Freitas@gmail.com',14516023785,'Rua Imperador Tadeu');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (8, 'Juliana Pereira Alencar', 'jpa.2022@gmail.com',54216100031,'Rua das Morangueiras');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (9, 'Cintia Cavalcante Melo', 'cintia201@gmail.com',10317862402,'Avenida Presidenta Dilma');
insert into cliente (codigo_cliente, nome_completo, email, cpf, endereco) values (10, 'Raynara de Alencar Pereira', 'ray444.ap@gmail.com',22202540656,'Rua São José');

insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (1, 5, '2025-03-21', 16.00 ,'entregue');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (2, 5, '2025-03-20', 40.00 ,'cancelado');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (3, 8, '2025-05-02', 20.80 ,'pago');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (4, 1, '2025-05-16', 31.6 ,'entregue');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (5, 9, '2025-05-12', 14.00 ,'enviado');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (6, 10, '2025-05-15', 82.5 ,'pago');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (7, 8, '2025-05-21', 8.79 ,'pago');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (8, 4, '2025-05-03', 35.16 ,'cancelado');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (9, 2, '2025-05-05', 10.00,'pago');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (10, 6, '2025-05-18', 20.6 ,'pago');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (11, 7, '2025-05-25', 46.5 ,'enviado');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (12, 3, '2025-05-04', 51.45 ,'entregue');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (13, 4, '2025-05-09', 36.4 ,'pago');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (14, 9, '2025-05-30', 19.05 ,'enviado');
insert into pedido (numero_pedido, codigo_cliente, data_pedido, valor_total, status) values (15, 8, '2025-05-27', 52.8 ,'entregue');

insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (1, 'leite', "é uma secreção nutritiva de cor branca, opaca, produzida pelas glândulas mamárias das fêmeas dos mamíferos.", 8.80, 5);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (2, 'iogurte', 'produto lácteo fermentado, caracterizado por sua textura pastosa e sabor ligeiramente ácido, resultante da fermentação láctica do leite.', 7.75, 5);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (3, 'feijão', 'uma leguminosa do gênero Phaseolus, originária da América Central e do Sul, e é uma importante fonte de proteína, ferro, vitaminas (principalmente do complexo B), carboidratos e fibras.', 10.00, 3);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (4, 'arroz', 'é uma planta da família das gramíneas (Poaceae) que se destaca como um cereal essencial na alimentação humana, sendo o principal alimento para mais da metade da população mundial, especialmente na Ásia e na África.', 7.50, 3);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (5, 'frango', 'é uma ave de corte, também conhecida como galinha, que é uma espécie de ave da família Galliformes, pertencente à subfamília Gallinae.', 20.80, 2);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (6, 'peixe', 'animais vertebrados aquáticos que habitam diversos ambientes aquáticos, como oceanos, rios, lagos e outros.', 18.30, 2);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (7, 'laranja', 'é uma bebida refrescante e nutritiva obtida através da extração do líquido da polpa da laranja. Ele é conhecido por ser rico em vitamina C, que fortalece o sistema imunológico, e outros nutrientes.', 8.79, 6);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (8, 'maracuja', 'é uma bebida refrescante e saborosa, muito apreciada por seu sabor tropical e leve acidez, que é equilibrada com o toque de doçura do maracujá.', 3.50, 6);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (9, 'macarrão', 'é uma massa alimentícia seca, geralmente feita de farinha de trigo (sêmola de trigo duro) e água, e pode incluir ovos em algumas variedades.', 7.35, 8);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (10, 'pão', 'é um alimento básico obtido pelo cozimento de uma massa, geralmente de farinha de trigo, água, sal e, em alguns casos, levedura ou fermento.', 1.50, 8);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (11, 'maçã', 'é um fruto globoso ou deprimido, de sabor doce e levemente ácido, que pode variar em cor, tamanho e forma dependendo da variedade.', 4.75, 9);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (12, 'banana', 'é uma secreção nutritiva de cor branca, opaca, produzida pelas glândulas mamárias das fêmeas dos mamíferos.', 15.80, 5);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (13, 'alface', 'é uma planta herbácea anual da família Asteraceae, cultivada por suas folhas, que podem ser lisas, crespas ou frisadas, e de várias cores, como verde, vermelho ou roxo.', 2.00, 10);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (14, 'beterraba', 'é uma hortaliça de raiz tuberosa, pertencente à família Chenopodiaceae, conhecida por sua cor vibrante e sabor adocicado.', 4.90, 10);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (15, 'pudim', 'é uma sobremesa doce e cremosa, geralmente feita com leite, ovos, açúcar e, em alguns casos, outros ingredientes como chocolate ou frutas.', 25.15, 7);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (16, 'bolacha', 'é um alimento seco, normalmente plano e crocante, feito de farinha e outros ingredientes como açúcar, gordura e levedura.', 3.50, 7);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (17, 'coca-cola', 'é um refrigerante com sabor inconfundível e único, considerado uma das maiores marcas do mundo', 10.30, 4);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (18, 'guarana', 'O refrigerante brasileiro que tem sabor único e natural, feito do fruto do guaraná plantado e colhido na Fazenda Santa Helena na Amazônia.', 8.50, 4);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (19, 'creme dental', 'é um produto essencial para a higiene oral diária, utilizado em conjunto com a escova de dentes', 6.35 , 1);
insert into produto (codigo_produto, nome, descricao, preco, codigo_categoria)
values (20, 'fio dental', 'possui como principal função remover a placa bacteriana e os restos de comida que ficam presos nos dentes e nas gengivas.', 9.10 , 1);

insert into itempedido (numero_pedido, codigo_produto, quantidade) values (2, 3, 4);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (13, 20, 4);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (7, 8, 3);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (1, 13, 8);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (6, 4, 11);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (9, 10, 8); 
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (15, 1, 6);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (4, 12, 2);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (12, 9, 7);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (3, 5, 1);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (14, 19, 3);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (8, 7, 4);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (11, 2, 6);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (5, 16, 4);
insert into itempedido (numero_pedido, codigo_produto, quantidade) values (10, 17, 2);