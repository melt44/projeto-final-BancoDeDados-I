CREATE TABLE public.itempedido(
    id_itempedido uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    pedido_id uuid NOT NULL,
    produto_id uuid NOT NULL,
    estoque_id uuid NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario NUMERIC(6,2) NOT NULL,

    CONSTRAINT uq_pedido_produto
        UNIQUE (pedido_id, produto_id),

    CONSTRAINT fk_itemproduto_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id_pedido)
        ON DELETE CASCADE,

    CONSTRAINT fk_itemproduto_produto
        FOREIGN KEY (produto_id)
        REFERENCES produtos(id_produto)
        ON DELETE CASCADE,

    CONSTRAINT fk_itemproduto_estoque
        FOREIGN KEY (estoque_id)
        REFERENCES estoques(id_estoque)
        ON DELETE CASCADE,

    CONSTRAINT validar_quantidade CHECK(
        quantidade > 0
    ),

    CONSTRAINT validar_preco CHECK(
        preco_unitario > 0 AND
        preco_unitario < 9999.99
    )


);