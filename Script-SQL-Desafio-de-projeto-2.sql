-- DROP DATABASE OFICINA;
CREATE SCHEMA IF NOT EXISTS oficina;
USE oficina;
-- SHOW TABLES;
-- DESC oficina.Cliente;
-- -----------------------------------------------------
-- Tabela Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente (
  IDCliente INT NOT NULL AUTO_INCREMENT,
  NomeCompleto VARCHAR(100) NOT NULL,
  CPF VARCHAR(45) NOT NULL,
  Endereco VARCHAR(100) NOT NULL,
  Contato VARCHAR(45) NOT NULL,
  PRIMARY KEY (IDCliente),
  UNIQUE idCliente_UNIQUE (IDCliente),
  UNIQUE Nome_UNIQUE (NomeCompleto),
  UNIQUE Endereco_UNIQUE (Endereco),
  UNIQUE Contato_UNIQUE (Contato),
  UNIQUE CPF_UNIQUE (CPF));

-- -----------------------------------------------------
-- Tabela Carros
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Carros (
  IDCarros INT NOT NULL AUTO_INCREMENT,
  Cliente_IDCliente INT NOT NULL,
  Marca VARCHAR(45) NOT NULL,
  Modelo VARCHAR(45) NOT NULL,
  Categoria ENUM('Carro', 'Moto', 'Caminhonete', 'Van', 'Caminhão', 'Ônibus') NOT NULL,
  AnoModelo VARCHAR(45) NOT NULL,
  Placa VARCHAR(45) NOT NULL,
  PRIMARY KEY (IDCarros, Cliente_IDCliente),
  UNIQUE idCarros_UNIQUE (IDCarros),
  CONSTRAINT fk_Carros_Cliente
    FOREIGN KEY (Cliente_IDCliente)
    REFERENCES Cliente (IDCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Tabela Equipe
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Equipe (
  IDEquipe INT NOT NULL AUTO_INCREMENT,
  Supervisor VARCHAR(100) NOT NULL,
  Setor ENUM('Mecânica Geral', 'Funilaria e Pintura', 'Elétrica e Eletrônica', 'Troca de Óleo e Lubrificação', 'Pneus e Alinhamento') NOT NULL,
  PRIMARY KEY (IDEquipe),
  UNIQUE idEquipe_UNIQUE (IDEquipe));


-- -----------------------------------------------------
-- Tabela Mecanico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Mecanico (
  IDMecanico INT NOT NULL AUTO_INCREMENT,
  Equipe_IDEquipe INT NOT NULL,
  NomeCompleto VARCHAR(100) NOT NULL,
  Endereco VARCHAR(100) NOT NULL,
  Especialidade VARCHAR(100) NOT NULL,
  PRIMARY KEY (IDMecanico, Equipe_IDEquipe),
  UNIQUE idMecanico_UNIQUE (IDMecanico),
  CONSTRAINT fk_Mecanico_Equipe
    FOREIGN KEY (Equipe_IDEquipe)
    REFERENCES Equipe (IDEquipe)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Tabela OrdemDeServico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OrdemDeServico (
  IDOrdemDeServico INT NOT NULL AUTO_INCREMENT,
  Carros_IDCarros INT NOT NULL,
  Carros_Cliente_IDCliente INT NOT NULL,
  Equipe_IDEquipe INT NOT NULL,
  DataDeEmissao DATE NOT NULL,
  StatusOS ENUM('Aguardando Aprovação', 'Aprovado', 'Em execução', 'Finalizado') NOT NULL,
  PrevisaoConclusao DATE NOT NULL,
  PRIMARY KEY (IDOrdemDeServico, Carros_IDCarros, Carros_Cliente_IDCliente, Equipe_IDEquipe),
  UNIQUE idOrdemDeServico_UNIQUE (IDOrdemDeServico),
  CONSTRAINT fk_OrdemDeServico_Carros
    FOREIGN KEY (Carros_IDCarros)
    REFERENCES Carros (IDCarros)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_OrdemDeServico_Carros_IDCliente
    FOREIGN KEY (Carros_Cliente_IDCliente)
    REFERENCES Carros (Cliente_IDCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_OrdemDeServico_Equipe
    FOREIGN KEY (Equipe_IDEquipe)
    REFERENCES Equipe (IDEquipe)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Tabela Serviço
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS PecasServicos (
  IDPecasServicos INT NOT NULL AUTO_INCREMENT,
  Descricao VARCHAR(45) NOT NULL,
  ValorUnitario FLOAT NOT NULL,
  Tipo ENUM('Peças', 'Serviços') NOT NULL,
  PRIMARY KEY (IDPecasServicos));


-- -----------------------------------------------------
-- Tabela Relacao_PecasServico_OrdemDeServico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Relacao_PecaServico_OrdemDeServico (
  OS_IDOrdemDeServico INT NOT NULL,
  Servico_IDPecasServicos INT NOT NULL,
  OS_Carros_IDCarros INT NOT NULL,
  OS_Carros_Cliente_IDCliente INT NOT NULL,
  OS_Equipe_IDEquipe INT NOT NULL,
  PRIMARY KEY (OS_IDOrdemDeServico, Servico_IDPecasServicos, OS_Carros_IDCarros, OS_Carros_Cliente_IDCliente, OS_Equipe_IDEquipe),
  CONSTRAINT fk_Servico_IDServico
    FOREIGN KEY (Servico_IDPecasServicos)
    REFERENCES PecasServicos (IDPecasServicos)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_OrdemDeServico
    FOREIGN KEY (OS_IDOrdemDeServico)
    REFERENCES OrdemDeServico (IDOrdemDeServico)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_OrdemDeServico_IDCarros
    FOREIGN KEY (OS_Carros_IDCarros)
    REFERENCES OrdemDeServico (Carros_IDCarros)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_OrdemDeServico_IDCliente
    FOREIGN KEY (OS_Carros_Cliente_IDCliente)
    REFERENCES OrdemDeServico (Carros_Cliente_IDCliente)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_OrdemDeServico_IDEquipe
    FOREIGN KEY (OS_Equipe_IDEquipe)
    REFERENCES OrdemDeServico (Equipe_IDEquipe)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
