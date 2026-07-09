CREATE TABLE public.pedidos (
    id_pedido uuid NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    consumidor_id uuid NOT NULL REFERENCES public.consumidores(id_usuario),
    distribuidora_id uuid NOT NULL REFERENCES public.distribuidoras(id_usuario),
    endereco_entrega uuid NOT NULL REFERENCES public.enderecos(id_endereco),
    
    entregador_id uuid REFERENCES public.entregadores(id_usuario), 
    
    data timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status varchar(50) NOT NULL DEFAULT 'AGUARDANDO_PAGAMENTO',
    valor_total numeric(8,2) NOT NULL DEFAULT 0.00,

    CONSTRAINT validar_valor_total CHECK (valor_total >= 0)
);