-- =====================================================================
-- SCRIPT DE SEED CORRIGIDO: PROJETO ZÉ DELIVERY
-- SOLUÇÃO: Remoção de UUIDs manuais em formato string.
-- O banco agora gera os UUIDs e os relacionamentos usam subconsultas.
-- =====================================================================

-- 1. POVOAR USUÁRIOS (20 registros com UUIDs automáticos)
INSERT INTO public.usuarios (email, senha, telefone, status) VALUES
('guilherme.pimenta@email.com', 'hash_senha_1', '+5591981111101', 'ATIVO'),
('maria.luiza@email.com', 'hash_senha_2', '+5591981111102', 'ATIVO'),
('luis.leonam@email.com', 'hash_senha_3', '+5591981111103', 'ATIVO'),
('carlos.silva@email.com', 'hash_senha_4', '+5511992222204', 'ATIVO'),
('ana.santos@email.com', 'hash_senha_5', '+5521993333305', 'ATIVO'),
('marcos.oliveira@email.com', 'hash_senha_6', '+5531994444406', 'ATIVO'),
('julia.lima@email.com', 'hash_senha_7', '+5571995555507', 'ATIVO'),
('fernando.costa@email.com', 'hash_senha_8', '+5581996666608', 'ATIVO'),
('patricia.souza@email.com', 'hash_senha_9', '+5591997777709', 'ATIVO'),
('roberto.almeida@email.com', 'hash_senha_10', '+5591998888810', 'ATIVO'),
('contato@depositopaes.com', 'hash_dist_1', '+559132221101', 'ATIVO'),
('financeiro@cervejarianorte.com', 'hash_dist_2', '+559132221102', 'ATIVO'),
('belem.bebidas@email.com', 'hash_dist_3', '+559132221103', 'ATIVO'),
('disk.gelada@email.com', 'hash_dist_4', '+559132221104', 'ATIVO'),
('central.ambev@email.com', 'hash_dist_5', '+559132221105', 'ATIVO'),
('thiago.entregas@email.com', 'hash_ent_1', '+5591983333316', 'ATIVO'),
('bruno.moto@email.com', 'hash_ent_2', '+5591983333317', 'ATIVO'),
('amanda.flash@email.com', 'hash_ent_3', '+5591983333318', 'ATIVO'),
('lucas.express@email.com', 'hash_ent_4', '+5591983333319', 'ATIVO'),
('diego.veloz@email.com', 'hash_ent_5', '+5591983333320', 'ATIVO');


-- 2. POVOAR ENDEREÇOS (Buscando o id_usuario gerado pelo banco via Email)
INSERT INTO public.enderecos (id_usuario, estado_sigla, estado, cidade, bairro, complemento, numero, cep, logradouro) VALUES
((SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com'), 'PA', 'Pará', 'Belém', 'Umarizal', 'Apt 402', '1234', '66055000', 'Avenida Visconde de Souza Franco'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com'), 'PA', 'Pará', 'Belém', 'Nazaré', 'Bloco B', '567', '66035000', 'Avenida Nazaré'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com'), 'PA', 'Pará', 'Belém', 'Marco', 'Casa', '89', '66093000', 'Trv. Alferes Costa'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'carlos.silva@email.com'), 'SP', 'São Paulo', 'São Paulo', 'Centro', 'Fundos', '12', '01001000', 'Praça da Sé'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'ana.santos@email.com'), 'RJ', 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Apt 1201', '456', '22020001', 'Avenida Atlântica'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'marcos.oliveira@email.com'), 'MG', 'Minas Gerais', 'Belo Horizonte', 'Savassi', 'Sala 4', '78', '30140010', 'Rua Pernambuco'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'julia.lima@email.com'), 'BA', 'Bahia', 'Salvador', 'Barra', 'Casa azul', '15', '40140130', 'Avenida Oceanica'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'fernando.costa@email.com'), 'PE', 'Pernambuco', 'Recife', 'Boa Viagem', 'Apt 50', '2300', '51020010', 'Avenida Boa Viagem'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'patricia.souza@email.com'), 'PA', 'Pará', 'Belém', 'Batista Campos', 'Apt 201', '345', '66033000', 'Rua dos Mundurucus'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'roberto.almeida@email.com'), 'PA', 'Pará', 'Belém', 'Reduto', 'Casa', '100', '66053000', 'Rua Ó de Almeida'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com'), 'PA', 'Pará', 'Belém', 'Pedreira', 'Galpão A', '1500', '66085000', 'Avenida Pedro Miranda'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com'), 'PA', 'Pará', 'Belém', 'Cremação', 'Galpão Principal', '200', '66060000', 'Rua dos Pariquis'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'belem.bebidas@email.com'), 'PA', 'Pará', 'Belém', 'Telégrafo', 'Loja 1', '405', '66113000', 'Avenida Senador Lemos'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'disk.gelada@email.com'), 'PA', 'Pará', 'Belém', 'Jurunas', 'Esquina', '99', '66030000', 'Rua Roberto Camelier'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'central.ambev@email.com'), 'PA', 'Pará', 'Ananindeua', 'Centro', 'Galpão 3', '10', '67020500', 'Rodovia BR-316'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'thiago.entregas@email.com'), 'PA', 'Pará', 'Belém', 'Guamá', 'Altos', '412', '66075000', 'Avenida José Bonifácio'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'bruno.moto@email.com'), 'PA', 'Pará', 'Belém', 'Canudos', 'Casa 2', '31', '66070000', 'Trv. Guerra Passos'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'amanda.flash@email.com'), 'PA', 'Pará', 'Belém', 'Sacramenta', 'Fundos', '88', '66123000', 'Avenida Baía de Antonina'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'lucas.express@email.com'), 'PA', 'Pará', 'Belém', 'Condor', 'Casa A', '25', '66033100', 'Trv. Padre Eutíquio'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'diego.veloz@email.com'), 'PA', 'Pará', 'Belém', 'Val-de-Cans', 'Apt 101', '2', '66110000', 'Avenida Júlio Cezar');


-- 3. POVOAR CONSUMIDORES (10 registros ligados pelo email correspondente)
INSERT INTO public.consumidores (id_usuario, cpf, nome_completo, data_nascimento) VALUES
((SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com'), '12345678901', 'Guilherme da Gama Pimenta', '2000-05-15'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com'), '98765432100', 'Maria Luiza Rodrigues Siqueira', '2001-08-20'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com'), '45678912344', 'Luis Leonam Mendes da Silva', '1999-12-01'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'carlos.silva@email.com'), '11122233344', 'Carlos Silva Antunes', '1985-03-10'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'ana.santos@email.com'), '55566677788', 'Ana dos Santos Medeiros', '1993-07-24'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'marcos.oliveira@email.com'), '99988877766', 'Marcos Oliveira Castro', '1990-11-05'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'julia.lima@email.com'), '22233344455', 'Julia Lima de Albuquerque', '2004-01-18'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'fernando.costa@email.com'), '77744411122', 'Fernando Costa Ferreira', '1978-06-30'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'patricia.souza@email.com'), '88855522211', 'Patrícia Souza Magalhães', '1988-09-12'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'roberto.almeida@email.com'), '33366699900', 'Roberto Almeida Góes', '1995-02-28');


-- 4. POVOAR DISTRIBUIDORAS
INSERT INTO public.distribuidoras (id_usuario, razao_social, nome_fantasia, cnpj, camara_fria, servico_entrega, refrigerador) VALUES
((SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com'), 'Paes e Bebidas Comercio LTDA', 'Depósito do Paes', 'CNPJ1234567810', TRUE, TRUE, 4),
((SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com'), 'Distribuidora de Bebidas Norte S.A.', 'Cervejaria Norte', 'CNPJ8765432120', TRUE, TRUE, 8),
((SELECT id_usuario FROM public.usuarios WHERE email = 'belem.bebidas@email.com'), 'Comercio de Bebidas Belém EIRELI', 'Belém Bebidas', 'CNPJ4561237830', FALSE, TRUE, 2),
((SELECT id_usuario FROM public.usuarios WHERE email = 'disk.gelada@email.com'), 'Disk Gelada Comercio de Bebidas', 'Disk Gelada', 'CNPJ7894561240', FALSE, TRUE, 3),
((SELECT id_usuario FROM public.usuarios WHERE email = 'central.ambev@email.com'), 'Central de Bebidas Ambev Dist.', 'Central Ambev', 'CNPJ9991112250', TRUE, FALSE, 12);


-- 5. POVOAR ENTREGADORES
INSERT INTO public.entregadores (id_usuario, documento_veiculo, data_nascimento, cnh) VALUES
((SELECT id_usuario FROM public.usuarios WHERE email = 'thiago.entregas@email.com'), 'ABC1D23PLACA78901', '1995-04-10', '12345678901'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'bruno.moto@email.com'), 'XYZ9K87PLACA12345', '1998-11-22', '98765432109'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'amanda.flash@email.com'), 'MOT1A23MOTO888888', '2000-01-15', '45678912300'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'lucas.express@email.com'), 'ENT7V89CARRO99999', '1992-07-08', '74125896300'),
((SELECT id_usuario FROM public.usuarios WHERE email = 'diego.veloz@email.com'), 'SPD4F56MOTO111111', '1987-03-30', '96325874100');


-- 6. POVOAR PRODUTOS (Deixando o DEFAULT gen_random_uuid() agir livremente)
INSERT INTO public.produtos (nome, marca, volume_ml, teor_alcoolico, categoria) VALUES
('Cerveja Skol Lata', 'Ambev', 350, 4.70, 'CERVEJA'),
('Cerveja Brahma Duplo Malte Garrafa', 'Ambev', 600, 4.70, 'CERVEJA'),
('Cachaça 51 Garrafa', 'Cia Müller', 965, 39.00, 'DESTILADO'),
('Vodka Smirnoff', 'Diageo', 998, 37.50, 'DESTILADO'),
('Vinho Chalise Tinto Suave', 'Salton', 750, 10.50, 'VINHO'),
('Refrigerante Guaraná Antarctica Pet', 'Ambev', 2000, 0.00, 'REFRIGERANTE'),
('Refrigerante Pepsi Cola Lata', 'Ambev', 350, 0.00, 'REFRIGERANTE'),
('Energético Monster Energy Latão', 'Monster Energy', 473, 0.00, 'ENERGÉTICO'),
('Suco de Uva Integral Del Valle', 'Coca-Cola', 1000, 0.00, 'SUCO'),
('Água Mineral Indaiá Sem Gás', 'Minalba', 500, 0.00, 'ÁGUA');


-- 7. POVOAR ESTOQUES (Fazendo o cruzamento seguro por nome de produto e email da distribuidora)
INSERT INTO public.estoques (distribuidora_id, produto_id, quantidade, preco) VALUES
((SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata'), 500, 3.49),
((SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa'), 200, 6.99),
((SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Refrigerante Guaraná Antarctica Pet'), 150, 7.50),

((SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata'), 1200, 3.29),
((SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa'), 800, 6.50),
((SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Cachaça 51 Garrafa'), 100, 14.90),

((SELECT id_usuario FROM public.usuarios WHERE email = 'belem.bebidas@email.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Vinho Chalise Tinto Suave'), 40, 12.00),
((SELECT id_usuario FROM public.usuarios WHERE email = 'belem.bebidas@email.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Água Mineral Indaiá Sem Gás'), 500, 1.99),

((SELECT id_usuario FROM public.usuarios WHERE email = 'disk.gelada@email.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Refrigerante Pepsi Cola Lata'), 200, 3.49),
((SELECT id_usuario FROM public.usuarios WHERE email = 'disk.gelada@email.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Energético Monster Energy Latão'), 120, 9.50),

((SELECT id_usuario FROM public.usuarios WHERE email = 'central.ambev@email.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata'), 5000, 2.99),
((SELECT id_usuario FROM public.usuarios WHERE email = 'central.ambev@email.com'), (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa'), 3000, 5.99);


-- 8. POVOAR PEDIDOS (Criando 3 cenários de simulação mapeando chaves dinamicamente)
INSERT INTO public.pedidos (id_pedido, consumidor_id, distribuidora_id, endereco_entrega, entregador_id, status, valor_total) VALUES
('b19f07a0-2f91-4e4b-9703-aeef5c830001', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com'), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com'), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com')), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'thiago.entregas@email.com'), 
  'ENTREGUE', 41.88),

('b19f07a0-2f91-4e4b-9703-aeef5c830002', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com'), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com'), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com')), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'bruno.moto@email.com'), 
  'ENTREGUE', 39.00),

('b19f07a0-2f91-4e4b-9703-aeef5c830003', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com'), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'belem.bebidas@email.com'), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com')), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'amanda.flash@email.com'), 
  'A_CAMINHO', 23.97);


-- 9. POVOAR ITENS DO PEDIDO (Buscando o id_estoque correto dinamicamente para não dar conflito de UUID)
INSERT INTO public.itempedido (pedido_id, produto_id, estoque_id, quantidade, preco_unitario) VALUES
('b19f07a0-2f91-4e4b-9703-aeef5c830001', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata'),
  (SELECT id_estoque FROM public.estoques WHERE distribuidora_id = (SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com') AND produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata')),
  12, 3.49),

('b19f07a0-2f91-4e4b-9703-aeef5c830002', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa'),
  (SELECT id_estoque FROM public.estoques WHERE distribuidora_id = (SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com') AND produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa')),
  6, 6.50),

('b19f07a0-2f91-4e4b-9703-aeef5c830003', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Vinho Chalise Tinto Suave'),
  (SELECT id_estoque FROM public.estoques WHERE distribuidora_id = (SELECT id_usuario FROM public.usuarios WHERE email = 'belem.bebidas@email.com') AND produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Vinho Chalise Tinto Suave')),
  3, 7.99);


-- 10. POVOAR PAGAMENTOS
INSERT INTO public.pagamentos (pedido_id, consumidor_id, forma) VALUES
('b19f07a0-2f91-4e4b-9703-aeef5c830001', (SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com'), 'PIX'),
('b19f07a0-2f91-4e4b-9703-aeef5c830002', (SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com'), 'CARTAO_CREDITO');


-- 11. POVOAR AVALIAÇÕES
INSERT INTO public.avaliacoes (pedido_id, consumidor_id, avaliacao_pedido, avaliacao_entregador) VALUES
('b19f07a0-2f91-4e4b-9703-aeef5c830001', (SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com'), 5, 5),
('b19f07a0-2f91-4e4b-9703-aeef5c830002', (SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com'), 4, 5);