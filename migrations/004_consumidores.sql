CREATE TABLE public.consumidores(
    id_usuario uuid PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    nome_completo VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,

    CONSTRAINT validar_data_nascimento CHECK (
    data_nascimento <= CURRENT_DATE AND
    data_nascimento <= CURRENT_DATE - INTERVAL '18 years'
    ),

    CONSTRAINT validar_cpf_numero CHECK (
        cpf ~ '^\d{11}$'
    ),

    CONSTRAINT fk_consumidor_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE
);
