CREATE TABLE public.entregadores (
  
  id_usuario uuid NOT NULL PRIMARY KEY REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE,
  documento_veiculo varchar(17) NOT NULL,
  data_nascimento date NOT NULL,
  cnh char(11) NOT NULL,
  
  -- verificações / constraints

  CONSTRAINT validar_numero_cnh CHECK (cnh ~ '^\d{11}$'),
  CONSTRAINT validar_documento_veiculo CHECK (documento_veiculo ~ '^[A-Z0-9]+$'),
  CONSTRAINT verificar_idade_minima CHECK (data_nascimento <= CURRENT_DATE - INTERVAL '21 years')

)