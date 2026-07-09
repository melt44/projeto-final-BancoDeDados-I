SELECT 
    c.nome_completo,
    u.email,
    COUNT(p.id_pedido) AS total_pedidos_junho
FROM public.pedidos p
JOIN public.usuarios u ON p.consumidor_id = u.id_usuario
JOIN public.consumidores c ON u.id_usuario = c.id_usuario
WHERE p.data >= '2026-06-01 00:00:00' 
  AND p.data < '2026-07-01 00:00:00'
GROUP BY c.nome_completo, u.email
ORDER BY total_pedidos_junho DESC
LIMIT 1;