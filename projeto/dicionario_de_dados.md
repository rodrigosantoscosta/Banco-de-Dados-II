# Dicionário de Dados — Modelo Lógico


- Cliente
  - cpf VARCHAR(11) PK — CPF do cliente
  - rg VARCHAR(20)
  - nome VARCHAR(100) NOT NULL
  - telefone VARCHAR(20)
  - data_nascimento DATE

  Restrições:
  - PK: pk_cliente PRIMARY KEY (cpf)
  - CHECK: ck_cliente_cpf_len CHECK (LEN(cpf) BETWEEN 11 AND 11) — validar formato de CPF (11 dígitos)
  - CHECK: ck_cliente_nome CHECK (nome <> '')
  - CHECK: ck_cliente_rg CHECK (rg <> '')

- Financiamento
  - id_financiamento INT IDENTITY PK
  - cpf_cliente VARCHAR(11) FK -> Cliente(cpf)
  - entrada DECIMAL(12,2)
  - parcela DECIMAL(12,2)
  - data DATE

  Restrições:
  - PK: pk_financiamento PRIMARY KEY (id_financiamento)
  - FK: fk_financiamento_cliente FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
  - CHECK: ck_financiamento_parcelas CHECK (parcela > 0)
  - CHECK: ck_financiamento_entrada CHECK (entrada >= 0)

- Teste_Drive
  - id_teste_drive INT IDENTITY PK
  - cpf_cliente VARCHAR(11) FK -> Cliente(cpf)
  - data DATE
  - id_veiculo INT FK -> Veiculo(id_veiculo)
  - supervisor VARCHAR(100)
  - tipo CHAR(1) -- C=Carro, M=Moto, V=Van

  Restrições:
  - PK: pk_testedrive PRIMARY KEY (id_teste_drive)
  - FK: fk_testedrive_cliente FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
  - FK: fk_testedrive_veiculo FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
  - CHECK: ck_testedrive_tipo CHECK (tipo IN ('C','M','V'))

- Pedido
  - id_pedido INT IDENTITY PK
  - cpf_cliente VARCHAR(11) FK -> Cliente(cpf)
  - id_vendedor INT FK -> Vendedor(id_vendedor)
  - data DATE
  - pagamento VARCHAR(2) -- D=Débito, C=Crédito, P=Pix
  - preco_total DECIMAL(12,2)

  Restrições:
  - PK: pk_pedido PRIMARY KEY (id_pedido)
  - FK: fk_pedido_cliente FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
  - FK: fk_pedido_vendedor FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
  - CHECK: ck_pedido_pagamento CHECK (pagamento IN ('D','C','P'))
  - CHECK: ck_pedido_preco CHECK (preco_total >= 0)

- Vendedor
  - id_vendedor INT IDENTITY PK
  - nome VARCHAR(100)
  - cep VARCHAR(10)
  - salario DECIMAL(12,2)
  - id_departamento INT FK -> Departamento(id_departamento)

  Restrições:
  - PK: pk_vendedor PRIMARY KEY (id_vendedor)
  - FK: fk_vendedor_departamento FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
  - CHECK: ck_vendedor_salario CHECK (salario >= 0)
  - CHECK: ck_vendedor_nome CHECK (nome <> '')

- Departamento
  - id_departamento INT IDENTITY PK
  - nome VARCHAR(100)
  - localizacao VARCHAR(100)
  - tipo_departamento VARCHAR(50)

  Restrições:
  - PK: pk_departamento PRIMARY KEY (id_departamento)
  - CHECK: ck_departamento_nome CHECK (nome <> '')

- Relatorio_Vendas
  - id_relatorio INT IDENTITY PK
  - data DATE
  - numero_vendas INT
  - valor_total DECIMAL(14,2)
  - id_vendedor INT FK -> Vendedor(id_vendedor)

  Restrições:
  - PK: pk_relatoriovendas PRIMARY KEY (id_relatorio)
  - FK: fk_relatoriovendas_vendedor FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
  - CHECK: ck_relatoriovendas_valor CHECK (valor_total >= 0)
  - CHECK: ck_relatoriovendas_num CHECK (numero_vendas >= 0)

- Modelo
  - id_modelo INT IDENTITY PK
  - marca VARCHAR(50)
  - nome VARCHAR(50)
  - categoria VARCHAR(50)

  Restrições:
  - PK: pk_modelo PRIMARY KEY (id_modelo)
  - CHECK: ck_modelo_marca CHECK (marca <> '')

- Veiculo
  - id_veiculo INT IDENTITY PK
  - id_modelo INT FK -> Modelo(id_modelo)
  - id_estoque INT FK -> Estoque(id_estoque)
  - crv VARCHAR(50) UNIQUE
  - ano SMALLINT
  - cor VARCHAR(30)
  - quilometragem INT
  - cod_vendedor INT FK -> Vendedor(id_vendedor)

  Restrições:
  - PK: pk_veiculo PRIMARY KEY (id_veiculo)
  - FK: fk_veiculo_modelo FOREIGN KEY (id_modelo) REFERENCES Modelo(id_modelo)
  - FK: fk_veiculo_estoque FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
  - FK: fk_veiculo_vendedor FOREIGN KEY (cod_vendedor) REFERENCES Vendedor(id_vendedor)
  - CHECK: ck_veiculo_ano CHECK (ano BETWEEN 1886 AND YEAR(GETDATE()))
  - CHECK: ck_veiculo_quilometragem CHECK (quilometragem >= 0)

- Estoque
  - id_estoque INT IDENTITY PK
  - localizacao VARCHAR(100)
  - data_entrada DATE
  - status VARCHAR(30)

  Restrições:
  - PK: pk_estoque PRIMARY KEY (id_estoque)
  - CHECK: ck_estoque_status CHECK (status IS NOT NULL)

- Fornecedor
  - cnpj VARCHAR(14) PK
  - nome VARCHAR(100)
  - cep VARCHAR(10)
  - id_estoque INT FK -> Estoque(id_estoque)

  Restrições:
  - PK: pk_fornecedor PRIMARY KEY (cnpj)
  - FK: fk_fornecedor_estoque FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
  - CHECK: ck_fornecedor_nome CHECK (nome <> '')

- Insumo
  - id_insumo INT IDENTITY PK
  - nome VARCHAR(100)
  - tipo VARCHAR(4) -- O=Óleo, V=Vela, PA=Pastilha, PN=Pneu
  - quantidade INT

  Restrições:
  - PK: pk_insumo PRIMARY KEY (id_insumo)
  - CHECK: ck_tipo_insumo CHECK (tipo IN ('O','V','PA','PN'))
  - CHECK: ck_insumo_quantidade CHECK (quantidade >= 0)

- Servico
  - ordem_servico INT IDENTITY PK
  - data DATE
  - tipo VARCHAR(1) -- R=Revisão, A=Alinhamento, B=Balanceamento, T=Troca Óleo
  - preco DECIMAL(12,2)
  - crv VARCHAR(50)
  - id_veiculo INT FK -> Veiculo(id_veiculo)
  - id_agendamento INT FK -> Agendamento(id_agendamento)

  Restrições:
  - PK: pk_servico PRIMARY KEY (ordem_servico)
  - FK: fk_servico_veiculo FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
  - FK: fk_servico_agendamento FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id_agendamento)
  - CHECK: ck_tipo_servico CHECK (tipo IN ('R','A','B','T'))
  - CHECK: ck_servico_preco CHECK (preco >= 0)

- Usa (relacionamento Insumo ↔ Servico)
  - ordem_servico INT FK -> Servico(ordem_servico)
  - id_insumo INT FK -> Insumo(id_insumo)
  - quantidade INT
  - PK (ordem_servico, id_insumo)

  Restrições:
  - PK: pk_usa PRIMARY KEY (ordem_servico, id_insumo)
  - FK: fk_usa_servico FOREIGN KEY (ordem_servico) REFERENCES Servico(ordem_servico)
  - FK: fk_usa_insumo FOREIGN KEY (id_insumo) REFERENCES Insumo(id_insumo)
  - CHECK: ck_usa_quantidade CHECK (quantidade > 0)

- Agendamento
  - id_agendamento INT IDENTITY PK
  - nome_cliente VARCHAR(100)
  - data DATE
  - status VARCHAR(30)

  Restrições:
  - PK: pk_agendamento PRIMARY KEY (id_agendamento)
  - CHECK: ck_agendamento_status CHECK (status IS NOT NULL)
  - CHECK: ck_agendamento_nome CHECK (nome_cliente <> '')

Observações:
- Nomes de colunas e tamanhos são sugestivos; adaptar para padrões do projeto (usar NVARCHAR se necessário).
- Chaves artificiais (INT IDENTITY) foram usadas onde o diagrama mostra identificadores sem chave natural óbvia.
- Rever cardinalidades (1:N, N:M) e adicionar tabelas-associação quando necessário (ex.: Usa).
- Para validação de CPF/CNPJ mais rigorosa use funções específicas ou expressões regulares em procedimentos/funções.
- Ajuste nomes das constraints conforme padrões do seu SGBD antes de aplicar.