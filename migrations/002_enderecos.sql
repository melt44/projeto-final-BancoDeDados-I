CREATE TABLE public.enderecos (
  id_endereco uuid NOT NULL PRIMARY KEY default gen_random_uuid (),
  id_usuario uuid NOT NULL REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE,
  estado_sigla char(2),
  estado varchar(30) NOT NULL,
  cidade varchar(40) NOT NULL,
  bairro varchar(40) NOT NULL,
  complemento varchar(50),
  numero varchar(20),
  cep char(8) NOT NULL,
  logradouro varchar(200) NOT NULL,

  -- verificações / constraints

  CONSTRAINT validar_cep_numero CHECK (cep ~ '^\d{8}$'), -- check pra ver se o cep tem apenas números
  CONSTRAINT validar_estado_sigla CHECK (estado_sigla ~ '^[A-Z]{2}$') -- garante que esse campo contenha apenas 2 siglas maiúsculas
)