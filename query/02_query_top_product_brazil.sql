SELECT 
    pr.nome AS nome_produto,
    pr.marca,
    COUNT(DISTINCT ip.pedido_id) AS total_pedidos,
    SUM(ip.quantidade) AS quantidade_total_itens
FROM public.itempedido ip
JOIN public.produtos pr ON ip.produto_id = pr.id_produto
JOIN public.pedidos p ON ip.pedido_id = p.id_pedido
WHERE p.data >= '2026-07-05 15:00:00' 
  AND p.data <= '2026-07-05 21:00:00'
GROUP BY pr.id_produto, pr.nome, pr.marca
ORDER BY total_pedidos DESC, quantidade_total_itens DESC;