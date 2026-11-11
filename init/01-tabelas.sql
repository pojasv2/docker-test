-- Executado automaticamente pelo Postgres na PRIMEIRA inicialização
-- (somente quando o volume de dados está vazio).

CREATE TABLE usuario (
    id        SERIAL       PRIMARY KEY,
    nome      VARCHAR(255) NOT NULL,
    email     VARCHAR(255) NOT NULL UNIQUE,
    senha     VARCHAR(255) NOT NULL,          -- guardar o HASH da senha, nunca a senha pura
    username  VARCHAR(50)  NOT NULL UNIQUE
);

CREATE TABLE cliente (
    id             VARCHAR(20)  PRIMARY KEY,
    nome_fantasia  VARCHAR(255),
    razao_social   VARCHAR(255) NOT NULL,
    cpf_cnpj       VARCHAR(14)  NOT NULL UNIQUE,  -- somente números
    tipo           VARCHAR(8)   NOT NULL CHECK (tipo IN ('FISICO', 'JURIDICO')),
    email          VARCHAR(255),
    -- CPF tem 11 dígitos (pessoa física); CNPJ tem 14 (pessoa jurídica)
    CONSTRAINT cpf_cnpj_valido CHECK (
        (tipo = 'FISICO'   AND cpf_cnpj ~ '^[0-9]{11}$') OR
        (tipo = 'JURIDICO' AND cpf_cnpj ~ '^[0-9]{14}$')
    )
);

CREATE TABLE produto (
    id             SERIAL        PRIMARY KEY,
    descricao      VARCHAR(255)  NOT NULL,
    departamento   VARCHAR(100),
    codigo_barras  CHAR(13)      UNIQUE CHECK (codigo_barras ~ '^[0-9]{13}$'),  -- EAN-13
    preco          NUMERIC(10,2) NOT NULL CHECK (preco >= 0)
);
