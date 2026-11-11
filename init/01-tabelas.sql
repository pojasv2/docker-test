-- Executado automaticamente pelo Postgres na PRIMEIRA inicialização
-- (somente quando o volume de dados está vazio).

CREATE TABLE usuario (
    id        VARCHAR(20)   PRIMARY KEY,
    nome      VARCHAR(255) NOT NULL,
    email     VARCHAR(255) NOT NULL UNIQUE,
    senha     VARCHAR(255) NOT NULL,   
    username  VARCHAR(255)  NOT NULL UNIQUE
);

CREATE TABLE cliente (
    id             VARCHAR(20)  PRIMARY KEY,
    nome_fantasia  VARCHAR(255),
    razao_social   VARCHAR(255) NOT NULL,
    cpf_cnpj       VARCHAR(14)  NOT NULL UNIQUE, 
    tipo           VARCHAR(8)   NOT NULL CHECK (tipo IN ('FISICO', 'JURIDICO')),
    email          VARCHAR(255),
);

CREATE TABLE produto (
    id             VARCHAR(20)      PRIMARY KEY,
    descricao      VARCHAR(255)  NOT NULL,
    departamento   VARCHAR(255),
    codigo_barras  CHAR(13)      NOT NULL UNIQUE,
    preco          NUMERIC(10,2) NOT NULL CHECK (preco >= 0)
);
