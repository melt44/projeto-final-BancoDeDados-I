CREATE TABLE public.usuarios (
  id_usuario uuid NOT NULL PRIMARY KEY DEFAULT gen_random_uuid (),
  email varchar(100) NOT NULL UNIQUE, -- o limite oficial é 320, mas optamos por deixar 100,
  senha varchar(255) NOT NULL, -- a senha seria criptografada em um hash único usando algum algoritmo
  telefone varchar(15) NOT NULL UNIQUE,
  cpf char(11) NOT NULL UNIQUE,

  -- verificações / contraints

  CONSTRAINT validar_telefone_e164 CHECK (telefone ~ '^\+[1-9]\d{6,14}$'), -- estamos utilizando o padrão internacional de número de telefone E.164
  CONSTRAINT validar_email CHECK (email ~* '^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$'), -- check pra ver se o email é válido
  CONSTRAINT validar_cpf_numero CHECK (cpf ~ '^\d{11}$') -- check pra ver se o cpf tem apenas números
)