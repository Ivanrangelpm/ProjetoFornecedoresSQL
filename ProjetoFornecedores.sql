
--CRIANDO DIAGRAMA

CREATE TABLE tbl_estados_RM551005(
    sigla CHAR(2) NOT NULL PRIMARY KEY,
    nome_estado VARCHAR2(20) NOT NULL
);
    
CREATE TABLE tbl_cidades_RM551005(
    id_cidade INTEGER NOT NULL PRIMARY KEY,
    nome_cidade VARCHAR2(30) NOT NULL,
    sigla CHAR(2) NOT NULL
);

CREATE TABLE tbl_fornecedores_rm551005(
    id_fornecedor INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR2(60) NOT NULL,
    endereco VARCHAR2(100) NOT NULL,
    numero VARCHAR2(10) NOT NULL,
    bairro VARCHAR2(40) NOT NULL,
    complemento VARCHAR2(10),
    cep VARCHAR2(8) NOT NULL,
    id_cidade INTEGER NOT NULL,
    dt_cadastro DATE NOT NULL,
    email VARCHAR2(80),
    status VARCHAR2(7)
);

CREATE TABLE tbl_categorias_RM551005(
    id_categoria INTEGER NOT NULL PRIMARY KEY,
    descricao VARCHAR2(30)NOT NULL
);

CREATE TABLE tbl_tipo_telefones_RM551005(
    id_tipo_tel INTEGER NOT NULL PRIMARY KEY,
    tipo_tel VARCHAR2(20) NOT NULL,
    descricao VARCHAR2(30)
);

CREATE TABLE tbl_despesas_RM551005(
    id_despesas INTEGER NOT NULL PRIMARY KEY,
    dt_cadastro DATE NOT NULL,
    id_fornecedor INTEGER NOT NULL,
    numero_docto INTEGER NOT NULL,
    parcela_atual INTEGER NOT NULL,
    parcela_maxima INTEGER NOT NULL,
    dt_vencimento DATE NOT NULL,
    valor NUMBER(10,2) NOT NULL,
    valor_pago NUMBER(10,2),
    id_categoria INTEGER NOT NULL,
    dt_pagamento DATE
);

CREATE TABLE tbl_telefones_RM551005(
    id_telefones INTEGER NOT NULL PRIMARY KEY,
    id_fornecedor INTEGER NOT NULL,
    numero VARCHAR2(20) NOT NULL,
    id_tipo_tel INTEGER NOT NULL
);

--CRIANDO CHAVES ESTRANGEIRAS
ALTER TABLE tbl_cidades_rm551005 ADD CONSTRAINT tbl_cidades_RM551005_tbl_estados_RM551005_FK FOREIGN KEY(sigla)
REFERENCES TBL_ESTADOS_RM551005(sigla);

ALTER TABLE TBL_FORNECEDORES_RM551005 ADD CONSTRAINT TBL_FORNECEDORES_RM551005_tbl_cidades_RM551005_FK FOREIGN KEY(id_cidade)
REFERENCES tbl_cidades_rm551005(id_cidade);

ALTER TABLE TBL_DESPESAS_RM551005 ADD CONSTRAINT TBL_DESPESAS_RM551005_TBL_FORNECEDORES_RM551005_FK FOREIGN KEY(id_fornecedor)
REFERENCES TBL_FORNECEDORES_RM551005(id_fornecedor);

ALTER TABLE TBL_DESPESAS_RM551005 ADD CONSTRAINT TBL_DESPESAS_RM551005_TBL_CATEGORIAS_RM551005_FK FOREIGN KEY (id_categoria)
REFERENCES TBL_CATEGORIAS_RM551005(id_categoria);

ALTER TABLE TBL_TELEFONES_RM551005 ADD CONSTRAINT TBL_TELEFONES_RM551005_TBL_FORNECEDORES_RM551005_FK FOREIGN KEY (id_fornecedor)
REFERENCES TBL_FORNECEDORES_RM551005(id_fornecedor);

ALTER TABLE TBL_TELEFONES_RM551005 ADD CONSTRAINT TBL_TELEFONES_RM551005_TBL_TIPO_TELEFONES_RM551005_FK FOREIGN KEY(id_tipo_tel)
REFERENCES TBL_TIPO_TELEFONES_RM551005(id_tipo_tel);



--INSERT DE ESTADOS
INSERT INTO TBL_ESTADOS_RM551005 VALUES ('SP', 'SAO PAULO');
--INSERT DE CIDADES
INSERT INTO tbl_cidades_rm551005 VALUES (1,'São Paulo','SP');
INSERT INTO tbl_cidades_rm551005 VALUES (2,'Campinas','SP');
INSERT INTO tbl_cidades_rm551005 VALUES (3,'Mariporã','SP');


--INSERT FORNECEDORES

--INSERT INTO tbl_fornecedores_rm551005(id_fornecedor, nome, endereco, numero,bairro, complemento, cep, id_cidade, dt_cadastro, email, status)

INSERT INTO tbl_fornecedores_rm551005(id_fornecedor, nome, endereco, numero,bairro, cep, id_cidade, dt_cadastro, email, status)
VALUES(1,'Ferrementaria do Josué Ltda', 'Avenida Paulista', '1515', 'Paulista', '01101010', 1,TO_DATE('01-08-2023', 'DD-MM-YYYY'), 'fe.josue@gmail.com','ATIVO' );

INSERT INTO tbl_fornecedores_rm551005(id_fornecedor, nome, endereco, numero,bairro, complemento, cep, id_cidade, dt_cadastro, email, status)
VALUES(2,'Flix Tecnologia e Serviços Ltda', 'Rua Brasilia', '23', 'Lapa', 'Sala 5', '01101012', 1,TO_DATE('01-08-2023', 'DD-MM-YYYY'),'flix@flix.com.br','INATIVO' );

INSERT INTO tbl_fornecedores_rm551005(id_fornecedor, nome, endereco, numero,bairro, cep, id_cidade, dt_cadastro, status)
VALUES (3, 'Rei dos Descartáveis Ltda', 'Voluntários da Pátria', '356', 'Santana', '01106012', 1,TO_DATE('05-08-2023', 'DD-MM-YYYY'),'ATIVO');

INSERT INTO tbl_fornecedores_rm551005(id_fornecedor, nome, endereco, numero,bairro, cep, id_cidade, dt_cadastro, status)
VALUES(4, 'Manut Serviços de manutenção Ltda', 'Avenida Aquidaban', '2000', 'Centro', '13250123', 2,TO_DATE('06-08-2023', 'DD-MM-YYYY'),'ATIVO');

INSERT INTO tbl_fornecedores_rm551005(id_fornecedor, nome, endereco, numero,bairro, cep, id_cidade, dt_cadastro, status)
VALUES (5, 'Serviços de Jardinagem Ltda', 'Rua Campinas', '15', 'Centro', '01152222', 3,TO_DATE('06-08-2023', 'DD-MM-YYYY'),'ATIVO');

INSERT INTO tbl_fornecedores_rm551005(id_fornecedor, nome, endereco, numero,bairro, complemento, cep, id_cidade, dt_cadastro, email)
VALUES (6, 'ES Serviços Contábeis Ltda.', 'Avenida Pompéia', '1500', 'Lapa', 'Sala 10', '01101013', 1,TO_DATE('06-08-2023', 'DD-MM-YYYY'), 'esservicocontabeis@gmail.com');

--INSERT  TIPO TELEFONES

INSERT INTO tbl_tipo_telefones_rm551005(id_tipo_tel, tipo_tel, descricao) 
VALUES (1, 'Telefone', 'telefone para contato');

INSERT INTO tbl_tipo_telefones_rm551005(id_tipo_tel, tipo_tel, descricao) 
VALUES (2, 'SAC', 'Serviço de Atendimento');

--INSERT INTO  TELEFONES

INSERT INTO tbl_telefones_rm551005 (id_telefones, id_fornecedor, numero, id_tipo_tel)
VALUES (1, 1, '(11)9965-2532', 1);

INSERT INTO tbl_telefones_rm551005 (id_telefones, id_fornecedor, numero, id_tipo_tel)
VALUES (2, 2, '(11)9965-2533', 1);

INSERT INTO tbl_telefones_rm551005 (id_telefones, id_fornecedor, numero, id_tipo_tel)
VALUES (3, 3, '1133556677', 2);

INSERT INTO tbl_telefones_rm551005 (id_telefones, id_fornecedor, numero, id_tipo_tel)
VALUES (4, 4, '1925526565', 1);

INSERT INTO tbl_telefones_rm551005 (id_telefones, id_fornecedor, numero, id_tipo_tel)
VALUES (5, 5, '1156565656', 1);

--INSERT INTO CATEGORIAS 

INSERT INTO tbl_categorias_rm551005 (id_categoria, descricao)
VALUES (1, 'Ferramentas');

INSERT INTO tbl_categorias_rm551005 (id_categoria, descricao)
VALUES (2, 'Serviços T.I');

INSERT INTO tbl_categorias_rm551005 (id_categoria, descricao)
VALUES (3, 'Serviços contábeis');

INSERT INTO tbl_categorias_rm551005 (id_categoria, descricao)
VALUES (4, 'Diversos');

--FAZENDO INSERT NAS DESPESAS

--INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, valor_pago, id_categoria, dt_pagamento)


INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, valor_pago, id_categoria, dt_pagamento)
VALUES (1, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 1, 10, TO_DATE('15-08-2023', 'DD-MM-YYYY'), 300.50, 300.50, 1,TO_DATE('15-08-2023', 'DD-MM-YYYY') );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, valor_pago, id_categoria, dt_pagamento)
VALUES (2, TO_DATE('15-08-2023', 'DD-MM-YYYY'), 2, 16988, 1, 1, TO_DATE('15-08-2023', 'DD-MM-YYYY'), 1356.60, 1356.60, 2,TO_DATE('15-08-2023', 'DD-MM-YYYY') );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, valor_pago, id_categoria, dt_pagamento)
VALUES (3, TO_DATE('02-08-2023', 'DD-MM-YYYY'), 6, 2023, 1, 5, TO_DATE('19-08-2023', 'DD-MM-YYYY'), 759.60, 759.60, 3,TO_DATE('19-08-2023', 'DD-MM-YYYY') );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, valor_pago, id_categoria, dt_pagamento)
VALUES (4, TO_DATE('30-08-2023', 'DD-MM-YYYY'), 5, 2023080, 1, 3, TO_DATE('30-08-2023', 'DD-MM-YYYY'), 150.00, 150.00, 4,TO_DATE('30-08-2023', 'DD-MM-YYYY') );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, valor_pago, id_categoria, dt_pagamento)
VALUES (5, TO_DATE('30-08-2023', 'DD-MM-YYYY'), 5, 2023080, 2, 3, TO_DATE('30-08-2023', 'DD-MM-YYYY'), 150.00, 150.00, 4,TO_DATE('30-08-2023', 'DD-MM-YYYY') );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, valor_pago, id_categoria, dt_pagamento)
VALUES (6, TO_DATE('30-08-2023', 'DD-MM-YYYY'), 5, 2023080, 3, 3, TO_DATE('30-08-2023', 'DD-MM-YYYY'), 150.00, 150.00, 4,TO_DATE('30-08-2023', 'DD-MM-YYYY') );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, valor_pago, id_categoria, dt_pagamento)
VALUES (7, TO_DATE('02-09-2023', 'DD-MM-YYYY'), 3, 20230902, 1, 1, TO_DATE('02-09-2023', 'DD-MM-YYYY'), 120.00, 120.00, 4,TO_DATE('02-08-2023', 'DD-MM-YYYY') );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES  (8, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 2, 10, TO_DATE('15-09-2023', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (10, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 3, 10, TO_DATE('15-10-2023', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (12, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 4, 10, TO_DATE('15-11-2023', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (14, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 5, 10, TO_DATE('15-12-2023', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (16, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 6, 10, TO_DATE('15-01-2024', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (18, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 7, 10, TO_DATE('15-02-2024', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (20, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 8, 10, TO_DATE('15-03-2024', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (22, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 9, 10, TO_DATE('15-04-2024', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (24, TO_DATE('01-08-2023', 'DD-MM-YYYY'), 1, 1516, 10, 10, TO_DATE('15-05-2024', 'DD-MM-YYYY'), 300.50, 1);

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (9, TO_DATE('02-08-2023', 'DD-MM-YYYY'), 6, 2023, 2, 5, TO_DATE('19-09-2023', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (11, TO_DATE('02-08-2023', 'DD-MM-YYYY'), 6, 2023, 3, 5, TO_DATE('19-10-2023', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (13, TO_DATE('02-08-2023', 'DD-MM-YYYY'), 6, 2023, 4, 5, TO_DATE('19-11-2023', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (15, TO_DATE('02-08-2023', 'DD-MM-YYYY'), 6, 2023, 5, 5, TO_DATE('19-12-2023', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (17, TO_DATE('02-08-2023', 'DD-MM-YYYY'), 5, 2024, 1, 12, TO_DATE('19-01-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (19, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 2, 12, TO_DATE('19-02-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (21, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 3, 12, TO_DATE('19-03-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (23, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 4, 12, TO_DATE('19-04-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (25, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 5, 12, TO_DATE('19-05-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (26, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 6, 12, TO_DATE('19-06-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (27, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 7, 12, TO_DATE('19-07-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (28, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 8, 12, TO_DATE('19-08-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (29, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 9, 12, TO_DATE('19-09-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (30, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 10, 12, TO_DATE('19-10-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (31, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 11, 12, TO_DATE('19-11-2024', 'DD-MM-YYYY'), 759.60, 3 );

INSERT INTO tbl_despesas_rm551005 (id_despesas, dt_cadastro, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor,id_categoria)
VALUES (32, TO_DATE('03-08-2023', 'DD-MM-YYYY'), 6, 2024, 12, 12, TO_DATE('19-12-2024', 'DD-MM-YYYY'), 759.60, 3 );

--Alterando a tabela fornecedores para a data padrao ser a atual

ALTER TABLE tbl_fornecedores_rm551005
MODIFY dt_cadastro DATE DEFAULT SYSDATE;

--Alterando todos os campos sem status para inativo
UPDATE tbl_fornecedores_rm551005
SET status = 'INATIVO'
WHERE status IS NULL;


-- Modificando status para ser obrigatório e só permitir ativo ou inativo
ALTER TABLE tbl_fornecedores_rm551005
MODIFY status VARCHAR2(7) NOT NULL
CHECK (status IN ('ATIVO', 'INATIVO'));

--Alterando a tabela despesas para a data padrao ser a atual
ALTER TABLE tbl_despesas_rm551005
MODIFY dt_cadastro DATE DEFAULT SYSDATE;

--Verificando se a data de vencimento é maior ou igual a data de cadastro
ALTER TABLE tbl_despesas_RM551005
ADD CONSTRAINT check_data_vencimento
CHECK (dt_vencimento >= dt_cadastro);

--Mudando nome da data de cadastro
ALTER TABLE tbl_despesas_RM551005
RENAME COLUMN dt_cadastro TO dt_lancamento;


--Criando novo atributo 
ALTER TABLE tbl_despesas_RM551005
ADD situacao VARCHAR2(10) 
CHECK (situacao IN ('PENDENTE', 'PAGO', 'EM ATRASO'));

--Checando se o valor é maior do que zero
ALTER TABLE tbl_despesas_RM551005
MODIFY valor NUMBER(10, 2)
CHECK (valor > 0);

--Checando se a parcela é menor que o total de parcelas
ALTER TABLE tbl_despesas_RM551005
ADD CONSTRAINT valor_parcela_ck
CHECK (parcela_atual <= parcela_maxima);

--Aumentando o vlor em 10% a partir de 2024
UPDATE tbl_despesas_RM551005
SET valor = valor * 1.10
WHERE id_fornecedor = 6
AND dt_vencimento >= TO_DATE('01-01-2024', 'DD-MM-YYYY');

--Mudando nome do fornecedor 4
UPDATE tbl_fornecedores_RM551005
SET nome = 'Serviços de Manutenção Ltda'
WHERE id_fornecedor = 4;

--Inativando cidades sem ser São Paulo
UPDATE tbl_fornecedores_RM551005
SET status = 'INATIVO'
WHERE id_cidade NOT IN (SELECT id_cidade FROM tbl_cidades_RM551005 WHERE nome_cidade = 'São Paulo');

--Criando Estado do fornecedor
INSERT INTO TBL_ESTADOS_RM551005 VALUES ('SC', 'SANTA CATARINA');
--Criando cidade do fornecedor
INSERT INTO tbl_cidades_rm551005 VALUES (4,'Balneário Camboriú ','SC');
--Criando fornecedor
INSERT INTO tbl_fornecedores_rm551005(id_fornecedor, nome, endereco, numero, bairro, cep, id_cidade, status)
VALUES (7, 'Hotel Manjubinha-Congressos e Convenções Ltda', 'Rua Beira Rio', '1655', 'Praia Sul', '22333333',4,'ATIVO');
-- Criando telefone do fornecedor
INSERT INTO tbl_telefones_rm551005 (id_telefones, id_fornecedor, numero, id_tipo_tel)
VALUES (7, 7, '(54)6598-9898', 1);
--Criando categoria
INSERT INTO tbl_categorias_rm551005 (id_categoria, descricao)
VALUES (5, 'Congressos e Convenções');


--Criando despesa do novo fornecedor
INSERT INTO tbl_despesas_rm551005(id_despesas, id_fornecedor, numero_docto, parcela_atual, parcela_maxima, dt_vencimento, valor, id_categoria)
VALUES (33, 7, 2025, 1, 1, TO_DATE('15-09-2023', 'DD-MM-YYYY'), 500.00, 5);

UPDATE tbl_despesas_rm551005
SET situacao =
  CASE
    WHEN dt_pagamento IS NULL AND dt_vencimento < SYSDATE THEN 'EM ATRASO'
    WHEN dt_pagamento IS NULL AND dt_vencimento >= SYSDATE THEN 'PENDENTE'
    WHEN dt_pagamento IS NOT NULL THEN 'PAGO'
  END;

DROP TABLE TBL_CATEGORIAS_RM551005;
DROP TABLE TBL_CIDADES_RM551005;
DROP TABLE TBL_DESPESAS_RM551005;
DROP TABLE TBL_ESTADOS_RM551005;
DROP TABLE TBL_FORNECEDORES_RM551005;
DROP TABLE TBL_TELEFONES_RM551005;
DROP TABLE TBL_TIPO_TELEFONES_RM551005;
