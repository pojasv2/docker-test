-- Dados de exemplo (opcional)

INSERT INTO usuario (nome, email, senha, username) VALUES
    ('Administrador', 'admin@exemplo.com', 'trocar_por_hash', 'admin');

INSERT INTO cliente (id, nome_fantasia, razao_social, cpf_cnpj, tipo, email) VALUES
    ('CLI001', NULL,            'João da Silva',              '12345678901',    'FISICO',   'joao@exemplo.com'),
    ('CLI002', 'Mercado Bom',   'Mercado Bom Comércio LTDA',  '12345678000199', 'JURIDICO', 'contato@mercadobom.com');

INSERT INTO produto (descricao, departamento, codigo_barras, preco) VALUES
    ('Arroz 5kg',    'Mercearia', '7891234567890', 27.90),
    ('Detergente',   'Limpeza',   '7899876543210',  2.49);
