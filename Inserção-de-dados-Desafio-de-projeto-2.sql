USE oficina;

desc oficina.cliente;

INSERT INTO Cliente (NomeCompleto, CPF, Endereco, Contato)
	VALUES ('Bernardo Cauê Araújo', 94368926676, 'Rua Nove, 113, Nossa Senhora da Conceição, Contagem - MG', '31993664510'),
		   ('Sophia Fátima Joana Pinto', 32549841611, 'Rua Águas Marinhas, 259, Carajás, Contagem - MG', '31984955370'),
           ('Aurora Rafaela da Mata', 52670653669, 'Rua Wenceslau Braz, 979, JK, Contagem - MG', '31982383546'),
           ('Francisco Benedito Raul Jesus', 51303414651, 'Rua Olhos DÁgua, 911, "Chácara Contagem", Contagem - MG', '31994003688'),
           ('Nelson André Figueiredo', 55324284688, 'Beco Lindóia, 819, Ressaca, Contagem - MG', '31984337617'),
           ('Marcos Vinicius Heitor Igor Lima', 96194026693, 'Rua C, 138, Estância do Hibisco, Contagem - MG', '31984242899');

select * from cliente;

desc oficina.carros;


INSERT INTO Carros (Cliente_IDCliente, Marca, Modelo, Categoria, AnoModelo, Placa)
			VALUES  (1, 'VOLKSWAGEN', 'AMAROK', 'Caminhonete', '2020/2021', 'GUV-3612'),
					(1, 'VOLKSWAGEN', 'POLO TRACK', 'Carro', '2022/2023', 'HGP-4957'),
                    (2, 'RENAULT', 'KWID', 'Caminhonete', '2020/2021', 'GYV-9887'),
                    (3, 'FIAT', 'TIPO', 'Carro', '1995/1996', 'GVS-4118'),
                    (3, 'VOLKSWAGEN', 'SANTANA', 'Carro', '1999/2000', 'GUV-6544'),
                    (4, 'TOYOTA', 'SW4', 'Carro', '2014/2015', 'GLM-0105'),
                    (4, 'TOYOTA', 'HILUX CABINE SIMPLES', 'Caminhonete', '2015/2016', 'HKT-3766'),
                    (4, 'FIAT', 'STRADA', 'Caminhonete', '2016/2017', 'GVR-7567'),
                    (5, 'NISSAN', 'FRONTIER', 'Caminhonete', '2016/2017', 'HLN-1749'),
                    (5, 'FORD', 'F4000', 'Caminhonete', '2004/2005', 'GKO-5776'),
                    (5, 'NISSAN', 'LIVINA', 'Carro', '2010/2011', 'GSC-1917'),
                    (5, 'FIAT', 'FREEMONT', 'Carro', '2012/2013', 'GME-9570'),
                    (6, 'FIAT', 'UNO MILLE', 'Carro', '2009/2010', 'HKJ-2144');

select * from carros;

desc oficina.equipe;


INSERT INTO Equipe (Supervisor, Setor)
			VALUES  ('Manoel Santos', 'Mecânica Geral'),
					('Marcondes Ferreira', 'Funilaria e Pintura'),
                    ('Rafael Braga', 'Elétrica e Eletrônica'),
                    ('Ailton Santos', 'Troca de Óleo e Lubrificação'),
                    ('André Pereira', 'Pneus e Alinhamento');

select * from equipe;

desc oficina.mecanico;


INSERT INTO Mecanico (Equipe_IDEquipe, NomeCompleto, Endereco, Especialidade)
			VALUES  (1, 'Luís Pedro Ricardo Souza', 'Avenida Chavantes, 288, Vila Pérola, Contagem - MG', 'Mecânico'),
					(2, 'Severino Cavalcanti Melo', 'Rua Rio Sanhoa, 717, Eldoradinho, Contagem - MG', 'Funileiro'),
                    (2, 'Luiz Pedro Bernardes', 'Rua Manoel Jacinto Coelho, 389, Vila Militar, Contagem - MG', 'Pintor automotivo'),
                    (3, 'Roberto Ricardo Sérgio Freitas', 'Rua Safira, 392, Sapucaia II, Contagem - MG', 'Eletricista automotivo'),
                    (4, 'Caio Otávio Anthony Rodrigues', 'Rua Rio Tapajós, 430, Riacho das Pedras, Contagem - MG', 'Manutenção básica'),
                    (5, 'Thales Levi Gomes', 'Avenida Dulce Geralda Diniz, 667, Quintas Coloniais, Contagem - MG', 'Inspeção e troca de pneus');
 
 select * from mecanico;

desc oficina.PecasServicos;



INSERT INTO PecasServicos (Descricao, ValorUnitario, Tipo)
			VALUES  ('Lona de freio', 115.25, 'Peças'),
					('Bico injetor', 185.75, 'Peças'),
                    ('Amortecedor', 205.85, 'Peças'),
                    ('Tinta automotiva', 79.99, 'Peças'),
                    ('Chicote de central de mídia', 350.25, 'Peças'),
                    ('Lampada lanterna traseira', 35.55, 'Peças'),
                    ('Lubrificante', 75.99, 'Peças'),
                    ('Óleo de motor', 55.29, 'Peças'),
                    ('Pneu', 195.75, 'Peças'),
                    ('Serviço de mecânica', 325.00, 'Serviços'),
					('Serviço de funilaria e pintura', 2500.00, 'Serviços'),
                    ('Serviço de reparação elétrica', 500.00, 'Serviços'),
                    ('Serviço de revisão', 250.00, 'Serviços'),
                    ('Troca de pneus', 100.00, 'Serviços'),
                    ('Alinhamento e Balanceamento', 250.00, 'Serviços');

select * from PecasServicos;

desc oficina.OrdemDeServico;


INSERT INTO OrdemDeServico (Carros_IDCarros, Carros_Cliente_IDCliente, Equipe_IDEquipe, DataDeEmissao, StatusOS, PrevisaoConclusao)
			VALUES  (9, 5, 4, '2023-05-01', 'Aprovado', '2023-05-01'),
					(13, 6, 3, '2023-02-01', 'Finalizado', '2023-02-02'),
                    (1, 1, 1, '2023-06-10', 'Em execução', '2023-06-15');

		
select * from OrdemDeServico;
				
INSERT INTO Relacao_PecaServico_OrdemDeServico (OS_IDOrdemDeServico, Servico_IDPecasServicos, OS_Carros_IDCarros, OS_Carros_Cliente_IDCliente, OS_Equipe_IDEquipe)
			VALUES  (1, 13, 9, 5, 4),
					(1, 7, 9, 5, 4),
                    (1, 8, 9, 5, 4),
                    (2, 12, 13, 6, 3),
                    (2, 6, 13, 6, 3),
                    (3, 10, 1, 1, 1),
                    (3, 1, 1, 1, 1),
                    (3, 2, 1, 1, 1),
                    (3, 3, 1, 1, 1);   

select * from Relacao_PecaServico_OrdemDeServico;