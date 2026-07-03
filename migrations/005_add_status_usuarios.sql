ALTER TABLE public.usuarios
ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'ATIVO';

ALTER TABLE public.usuarios
ADD CONSTRAINT validar_status
CHECK (
    status in ('ATIVO', 'INATIVO')
);
