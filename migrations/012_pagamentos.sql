CREATE TABLE public.pagamentos (
    id_pagamento uuid NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    pedido_id uuid NOT NULL UNIQUE REFERENCES public.pedidos(id_pedido) ON DELETE CASCADE,
    consumidor_id uuid NOT NULL REFERENCES public.consumidores(id_usuario),
    forma varchar(50) NOT NULL,

    CONSTRAINT validar_forma_pagamento CHECK (
        forma IN ('PIX', 'CARTAO_CREDITO', 'CARTAO_DEBITO', 'DINHEIRO')
    )
);