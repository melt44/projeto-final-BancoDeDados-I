-- =====================================================================
-- SCRIPT DE SEED COMPLEMENTAR: PEDIDOS EM 05 DE JULHO DE 2026
-- HORÁRIOS VARIADOS (Manhã, Almoço, Tarde e Noite)
-- =====================================================================

-- 1. INSERÇÃO DOS PEDIDOS (Dia 05/07/2026)
INSERT INTO public.pedidos (id_pedido, consumidor_id, distribuidora_id, endereco_entrega, entregador_id, data, status, valor_total) VALUES

-- ⏰ 10:15 - Pedido da Manhã (Abastecendo cedo)
('726f07a0-2f91-4e4b-9703-aeef5c830001', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'contato@depositopaes.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'thiago.entregas@email.com' LIMIT 1), 
  '2026-07-05 10:15:00', 'ENTREGUE', 41.88),

-- ⏰ 12:45 - Horário do Almoço
('726f07a0-2f91-4e4b-9703-aeef5c830002', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'carlos.silva@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'financeiro@cervejarianorte.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'carlos.silva@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'bruno.moto@email.com' LIMIT 1), 
  '2026-07-05 12:45:00', 'ENTREGUE', 39.00),

-- ⏰ 15:30 - Meio da Tarde
('726f07a0-2f91-4e4b-9703-aeef5c830003', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'ana.santos@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'central.ambev@email.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'ana.santos@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'amanda.flash@email.com' LIMIT 1), 
  '2026-07-05 15:30:00', 'ENTREGUE', 62.00),

-- ⏰ 18:20 - Início da Noite / Happy Hour
('726f07a0-2f91-4e4b-9703-aeef5c830004', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'patricia.souza@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'belem.bebidas@email.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'patricia.souza@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'lucas.express@email.com' LIMIT 1), 
  '2026-07-05 18:20:00', 'ENTREGUE', 23.97),

-- ⏰ 21:10 - Noite
('726f07a0-2f91-4e4b-9703-aeef5c830005', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'disk.gelada@email.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'diego.veloz@email.com' LIMIT 1), 
  '2026-07-05 21:10:00', 'ENTREGUE', 17.98),

-- ⏰ 23:45 - Fim de Noite
('726f07a0-2f91-4e4b-9703-aeef5c830006', 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com' LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'central.ambev@email.com' LIMIT 1), 
  (SELECT id_endereco FROM public.enderecos WHERE id_usuario = (SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com' LIMIT 1) LIMIT 1), 
  (SELECT id_usuario FROM public.usuarios WHERE email = 'bruno.moto@email.com' LIMIT 1), 
  '2026-07-05 23:45:00', 'ENTREGUE', 35.88);


-- 2. INSERÇÃO DOS ITENS DO PEDIDO (Vinculação segura por produto_id)
INSERT INTO public.itempedido (pedido_id, produto_id, estoque_id, quantidade, preco_unitario) VALUES
-- Itens das 10:15
('726f07a0-2f91-4e4b-9703-aeef5c830001', (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata' LIMIT 1), (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata' LIMIT 1) LIMIT 1), 12, 3.49),

-- Itens das 12:45
('726f07a0-2f91-4e4b-9703-aeef5c830002', (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa' LIMIT 1), (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Brahma Duplo Malte Garrafa' LIMIT 1) LIMIT 1), 6, 6.50),

-- Itens das 15:30
('726f07a0-2f91-4e4b-9703-aeef5c830003', (SELECT id_produto FROM public.produtos WHERE nome = 'Refrigerante Guaraná Antarctica Pet' LIMIT 1), (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Refrigerante Guaraná Antarctica Pet' LIMIT 1) LIMIT 1), 10, 6.20),

-- Itens das 18:20
('726f07a0-2f91-4e4b-9703-aeef5c830004', (SELECT id_produto FROM public.produtos WHERE nome = 'Vinho Chalise Tinto Suave' LIMIT 1), (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Vinho Chalise Tinto Suave' LIMIT 1) LIMIT 1), 3, 7.99),

-- Itens das 21:10
('726f07a0-2f91-4e4b-9703-aeef5c830005', (SELECT id_produto FROM public.produtos WHERE nome = 'Energético Monster Energy Latão' LIMIT 1), (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Energético Monster Energy Latão' LIMIT 1) LIMIT 1), 2, 8.99),

-- Itens das 23:45
('726f07a0-2f91-4e4b-9703-aeef5c830006', (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata' LIMIT 1), (SELECT id_estoque FROM public.estoques WHERE produto_id = (SELECT id_produto FROM public.produtos WHERE nome = 'Cerveja Skol Lata' LIMIT 1) LIMIT 1), 12, 2.99);


-- 3. INSERÇÃO DOS PAGAMENTOS
INSERT INTO public.pagamentos (pedido_id, consumidor_id, forma) VALUES
('726f07a0-2f91-4e4b-9703-aeef5c830001', (SELECT id_usuario FROM public.usuarios WHERE email = 'luis.leonam@email.com' LIMIT 1), 'PIX'),
('726f07a0-2f91-4e4b-9703-aeef5c830002', (SELECT id_usuario FROM public.usuarios WHERE email = 'carlos.silva@email.com' LIMIT 1), 'CARTAO_CREDITO'),
('726f07a0-2f91-4e4b-9703-aeef5c830003', (SELECT id_usuario FROM public.usuarios WHERE email = 'ana.santos@email.com' LIMIT 1), 'PIX'),
('726f07a0-2f91-4e4b-9703-aeef5c830004', (SELECT id_usuario FROM public.usuarios WHERE email = 'patricia.souza@email.com' LIMIT 1), 'CARTAO_DEBITO'),
('726f07a0-2f91-4e4b-9703-aeef5c830005', (SELECT id_usuario FROM public.usuarios WHERE email = 'guilherme.pimenta@email.com' LIMIT 1), 'DINHEIRO'),
('726f07a0-2f91-4e4b-9703-aeef5c830006', (SELECT id_usuario FROM public.usuarios WHERE email = 'maria.luiza@email.com' LIMIT 1), 'PIX');