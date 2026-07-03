CREATE TABLE public.produtos(
    id_produto uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    volume_ml INTEGER NOT NULL,
    teor_alcoolico NUMERIC(4,2) NOT NULL,
    categoria VARCHAR(20) NOT NULL,

    CONSTRAINT validar_categoria CHECK(
        categoria IN ('CERVEJA',
                      'DESTILADO', 
                      'VINHO', 
                      'DRINK', 
                      'REFRIGERANTE', 
                      'ENERGÉTICO', 
                      'SUCO', 
                      'ÁGUA')
    ),

    CONSTRAINT validar_teor_alcoolico CHECK(
        teor_alcoolico >= 0 AND 
        teor_alcoolico <= 100
    ),

    CONSTRAINT validar_volume_ml CHECK(
        volume_ml > 0
    )

);