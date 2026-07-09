CREATE TABLE public.avaliacoes (
    id_avaliacao uuid NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    pedido_id uuid NOT NULL UNIQUE REFERENCES public.pedidos(id_pedido) ON DELETE CASCADE,
    consumidor_id uuid NOT NULL REFERENCES public.consumidores(id_usuario),
    avaliacao_pedido integer NOT NULL,
    avaliacao_entregador integer, 

    CONSTRAINT validar_notas_pedido CHECK (
        avaliacao_pedido >= 1 AND avaliacao_pedido <= 5
    ),
    CONSTRAINT validar_notas_entregador CHECK (
        avaliacao_entregador >= 1 AND avaliacao_entregador <= 5
    )
);