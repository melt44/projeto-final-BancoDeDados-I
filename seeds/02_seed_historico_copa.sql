-- =====================================================================
-- SCRIPT DE SEEDO: HISTÓRICO COPA DO MUNDO 2026
-- =====================================================================

-- 1. INSERÇÃO DOS PEDIDOS (2 pedidos por dia de jogo real do Brasil)
INSERT INTO public.pedidos (id_pedido, consumidor_id, distribuidora_id, endereco_entrega, entregador_id, data, status, valor_total) VALUES

-- 🇧🇷 JOGO 1: 14 de Junho de 2026 
('e26f07a0-2f91-4e4b-9703-aeef5c830001', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'thiago.entregas@email.com' LIMIT 1), 
  '2026-06-14 14:30:00', 'ENTREGUE', 41.88),

('e26f07a0-2f91-4e4b-9703-aeef5c830002', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'carlos.silva@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'carlos.silva@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'bruno.moto@email.com' LIMIT 1), 
  '2026-06-14 15:55:00', 'ENTREGUE', 39.00),


-- 🇧🇷 JOGO 2: 19 de Junho de 2026
('e26f07a0-2f91-4e4b-9703-aeef5c830003', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'ana.santos@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'central.ambev@email.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'ana.santos@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'amanda.flash@email.com' LIMIT 1), 
  '2026-06-19 11:15:00', 'ENTREGUE', 62.00),

('e26f07a0-2f91-4e4b-9703-aeef5c830004', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'patricia.souza@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'belem.bebidas@email.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'patricia.souza@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'lucas.express@email.com' LIMIT 1), 
  '2026-06-19 12:45:00', 'ENTREGUE', 23.97),


-- 🇧🇷 JOGO 3: 23 de Junho de 2026
('e26f07a0-2f91-4e4b-9703-aeef5c830005', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'roberto.almeida@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'disk.gelada@email.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'roberto.almeida@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'diego.veloz@email.com' LIMIT 1), 
  '2026-06-23 19:00:00', 'ENTREGUE', 17.98),

('e26f07a0-2f91-4e4b-9703-aeef5c830006', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'julia.lima@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'central.ambev@email.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'julia.lima@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'bruno.moto@email.com' LIMIT 1), 
  '2026-06-23 20:30:00', 'ENTREGUE', 35.88);


-- 2. INSERÇÃO DOS ITENS DO PEDIDO (Garantia de estoque_id dinâmico e seguro)
INSERT INTO public.itempedido (pedido_id, produto_id, estoque_id, quantidade, preco_unitario) VALUES

-- Itens do dia 14/06
('e26f07a0-2f91-4e4b-9703-aeef5c830001', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata' LIMIT 1), 
  (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata' LIMIT 1) LIMIT 1), 
  12, 3.49),
  
('e26f07a0-2f91-4e4b-9703-aeef5c830002', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa' LIMIT 1), 
  (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa' LIMIT 1) LIMIT 1), 
  6, 6.50),

-- Itens do dia 19/06
('e26f07a0-2f91-4e4b-9703-aeef5c830003', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Refrigerante Guaraná Antarctica Pet' LIMIT 1), 
  (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Refrigerante Guaraná Antarctica Pet' LIMIT 1) LIMIT 1), 
  10, 6.20),
  
('e26f07a0-2f91-4e4b-9703-aeef5c830004', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Vinho Chalise Tinto Suave' LIMIT 1), 
  (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Vinho Chalise Tinto Suave' LIMIT 1) LIMIT 1), 
  3, 7.99),

-- Itens do dia 23/06
('e26f07a0-2f91-4e4b-9703-aeef5c830005', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Energético Monster Energy Latão' LIMIT 1), 
  (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Energético Monster Energy Latão' LIMIT 1) LIMIT 1), 
  2, 8.99),
  
('e26f07a0-2f91-4e4b-9703-aeef5c830006', 
  (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata' LIMIT 1), 
  (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata' LIMIT 1) LIMIT 1), 
  12, 2.99);


-- 3. INSERÇÃO DOS PAGAMENTOS
INSERT INTO public.pagamentos (pedido_id, consumidor_id, forma) VALUES
('e26f07a0-2f91-4e4b-9703-aeef5c830001', (SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com' LIMIT 1), 'PIX'),
('e26f07a0-2f91-4e4b-9703-aeef5c830002', (SELECT id_usuario FROM public.usuarios WHERE email = 'carlos.silva@email.com' LIMIT 1), 'CARTAO_CREDITO'),
('e26f07a0-2f91-4e4b-9703-aeef5c830003', (SELECT id_usuario FROM public.usuarios WHERE email = 'ana.santos@email.com' LIMIT 1), 'PIX'),
('e26f07a0-2f91-4e4b-9703-aeef5c830004', (SELECT id_usuario FROM public.usuarios WHERE email = 'patricia.souza@email.com' LIMIT 1), 'CARTAO_DEBITO'),
('e26f07a0-2f91-4e4b-9703-aeef5c830005', (SELECT id_usuario FROM public.usuarios WHERE email = 'roberto.almeida@email.com' LIMIT 1), 'DINHEIRO'),
('e26f07a0-2f91-4e4b-9703-aeef5c830006', (SELECT id_usuario FROM public.usuarios WHERE email = 'julia.lima@email.com' LIMIT 1), 'PIX');