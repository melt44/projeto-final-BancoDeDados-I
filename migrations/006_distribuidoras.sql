CREATE TABLE public.distribuidoras (
  
  id_usuario uuid NOT NULL PRIMARY KEY REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE,
  razao_social varchar(150) NOT NULL,
  nome_fantasia varchar(60) NOT NULL,
  cnpj char(14) NOT NULL,
  camara_fria boolean NOT NULL,
  servico_entrega boolean NOT NULL,
  refrigerador smallint NOT NULL,

  -- verificações / constraints  

  CONSTRAINT validar_cnpj_alfanumerico CHECK (cnpj ~ '^[A-Za-z0-9]{12}[0-9]{2}$'), -- Valida se o CNPJ tem 12 caracteres (número ou l etra) seguidos por 2 números
  CONSTRAINT validar_qtd_refrigerador CHECK (refrigerador >= 1) -- valida se a distribuidora tem pelo menos 1 refrigerador

)