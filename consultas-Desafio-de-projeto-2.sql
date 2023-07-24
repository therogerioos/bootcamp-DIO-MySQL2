-- Projetando na tela, o resultado de junção através do relacionamento entre FK, sem refinamento de colunas a serem exibidas.
SELECT * 
FROM OrdemDeServico, Carros, Cliente, Equipe, Relacao_PecaServico_OrdemDeServico, PecasServicos
WHERE IDCarros = Carros_IDCarros 
    AND IDCliente = Carros_Cliente_IDCliente 
    AND IDEquipe = Equipe_IDEquipe 
    AND IDOrdemDeServico = OS_IDOrdemDeServico
    AND IDPecasServicos = Servico_IDPecasServicos;

-- Projetando na tela, o resultado de junção através do relacionamento entre FK, sem refinamento de colunas a serem exibidas.
SELECT * 
FROM OrdemDeServico AS OS
	INNER JOIN Carros AS CAR
		ON CAR.IDCarros = OS.Carros_IDCarros
	INNER JOIN Cliente AS CLI
		ON CLI.IDCliente = OS.Carros_Cliente_IDCliente 
	INNER JOIN Equipe AS EQP
		ON IDEquipe = Equipe_IDEquipe 
	INNER JOIN Relacao_PecaServico_OrdemDeServico AS REL
		ON IDOrdemDeServico = OS_IDOrdemDeServico
	INNER JOIN PecasServicos AS PCSER
		ON IDPecasServicos = Servico_IDPecasServicos;

-- Projetando na tela, o resultado de junção através do relacionamento entre FK, com refinamento de colunas a serem exibidas.
SELECT 
	NomeCompleto as 'Cliente',
    Setor as 'Setor do Serviço',
    Descricao as 'Descrição da Peças/Serviço',
    Tipo as 'Ação adotada',
    ValorUnitario as 'Valor por Peça/Serviço',
    CONCAT(Categoria,' - ',Marca,' ',Modelo) as 'Descrição do veículo',
    StatusOS as 'Status da OS',
    DataDeEmissao as 'Data de emissão',
    PrevisaoConclusao as 'Previsão de conclusão'
FROM OrdemDeServico, Carros, Cliente, Equipe, Relacao_PecaServico_OrdemDeServico, PecasServicos
WHERE IDCarros = Carros_IDCarros 
    AND IDCliente = Carros_Cliente_IDCliente 
    AND IDEquipe = Equipe_IDEquipe 
    AND IDOrdemDeServico = OS_IDOrdemDeServico
    AND IDPecasServicos = Servico_IDPecasServicos
ORDER BY Setor ASC, Tipo DESC;


-- Projetando na tela, o resultado de junção através do relacionamento entre FK, com refinamento de colunas a serem exibidas.
SELECT 
	NomeCompleto as 'Cliente',
    Setor as 'Setor do Serviço',
    Descricao as 'Descrição da Peças/Serviço',
    Tipo as 'Ação adotada',
    ValorUnitario as 'Valor por Peça/Serviço',
    CONCAT(Categoria,' - ',Marca,' ',Modelo) as 'Descrição do veículo',
    StatusOS as 'Status da OS',
    DataDeEmissao as 'Data de emissão',
    PrevisaoConclusao as 'Previsão de conclusão'
FROM OrdemDeServico AS OS
	INNER JOIN Carros AS CAR
		ON CAR.IDCarros = OS.Carros_IDCarros
	INNER JOIN Cliente AS CLI
		ON CLI.IDCliente = OS.Carros_Cliente_IDCliente 
	INNER JOIN Equipe AS EQP
		ON IDEquipe = Equipe_IDEquipe 
	INNER JOIN Relacao_PecaServico_OrdemDeServico AS REL
		ON IDOrdemDeServico = OS_IDOrdemDeServico
	INNER JOIN PecasServicos AS PCSER
		ON IDPecasServicos = Servico_IDPecasServicos
ORDER BY Setor ASC, Tipo DESC;

-- Agrupando com uso de GROUP BY para verificar qual o valor a ser pago pelo cliente
SELECT 
	NomeCompleto as 'Cliente',
    ROUND(SUM(ValorUnitario),2) as 'Valor do Serviço',
    CONCAT(Categoria,' - ',Marca,' ',Modelo) as 'Descrição do veículo',
    StatusOS as 'Status da OS',
    DataDeEmissao as 'Data de emissão',
    PrevisaoConclusao as 'Previsão de conclusão'
FROM OrdemDeServico AS OS
	INNER JOIN Carros AS CAR
		ON CAR.IDCarros = OS.Carros_IDCarros
	INNER JOIN Cliente AS CLI
		ON CLI.IDCliente = OS.Carros_Cliente_IDCliente 
	INNER JOIN Equipe AS EQP
		ON IDEquipe = Equipe_IDEquipe 
	INNER JOIN Relacao_PecaServico_OrdemDeServico AS REL
		ON IDOrdemDeServico = OS_IDOrdemDeServico
	INNER JOIN PecasServicos AS PCSER
		ON IDPecasServicos = Servico_IDPecasServicos
GROUP BY NomeCompleto, Categoria, Marca, Modelo, StatusOS, DataDeEmissao, PrevisaoConclusao;

-- Agrupando com uso de GROUP BY para verificar qual o valor a ser pago pelo cliente e HAVING para filtrar somente as ordens de serviço finalizada.
SELECT 
	NomeCompleto as 'Cliente',
    ROUND(SUM(ValorUnitario),2) as 'Valor do Serviço',
    CONCAT(Categoria,' - ',Marca,' ',Modelo) as 'Descrição do veículo',
    StatusOS as 'Status da OS',
    DataDeEmissao as 'Data de emissão',
    PrevisaoConclusao as 'Previsão de conclusão'
FROM OrdemDeServico AS OS
	INNER JOIN Carros AS CAR
		ON CAR.IDCarros = OS.Carros_IDCarros
	INNER JOIN Cliente AS CLI
		ON CLI.IDCliente = OS.Carros_Cliente_IDCliente 
	INNER JOIN Equipe AS EQP
		ON IDEquipe = Equipe_IDEquipe 
	INNER JOIN Relacao_PecaServico_OrdemDeServico AS REL
		ON IDOrdemDeServico = OS_IDOrdemDeServico
	INNER JOIN PecasServicos AS PCSER
		ON IDPecasServicos = Servico_IDPecasServicos
GROUP BY NomeCompleto, Categoria, Marca, Modelo, StatusOS, DataDeEmissao, PrevisaoConclusao
HAVING StatusOS = 'Finalizado';
