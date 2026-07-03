CREATE TABLE public.estoques(
    id_estoque uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    distribuidora_id uuid NOT NULL,
    produto_id uuid NOT NULL,
    quantidade INTEGER NOT NULL,
    preco NUMERIC(6,2) NOT NULL,

    CONSTRAINT validar_quantidade CHECK(
        quantidade >= 0
    ),

    CONSTRAINT validar_preco CHECK(
        preco > 0
    ),

    CONSTRAINT uq_distribuidora_produto
        UNIQUE (distribuidora_id, produto_id)

    CONSTRAINT fk_estoque_produto
        FOREIGN KEY (produto_id)
        REFERENCES produtos(id_produto)
        ON DELETE CASCADE,

    CONSTRAINT fk_estoque_distribuidora
        FOREIGN KEY (distribuidora_id)
        REFERENCES distribuidoras(id_usuario)
        ON DELETE CASCADE

);