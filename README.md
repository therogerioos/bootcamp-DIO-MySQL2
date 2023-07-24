# Bootcamp DIO & Potência Tech - Ciência de Dados com Python
### Projeto de banco de dados - Desafio 2

Este repositório foi criado para a entrega do desafio de projeto da DIO sobre desenvolvimento lógico de um banco de dados utilizando o diagrama EER e, consequentemente, o script dos schemas de um banco de dados relacional utilizando o MySQL.

Abaixo está a descrição de todos os passos utilizados neste projeto:

## Diagrama EER
### Clique aqui: [Diagrama-EER-Desafio-de-projeto-2](https://github.com/therogerioos/bootcamp-DIO-MySQL2/blob/main/Diagrama-EER-Desafio-de-projeto-2.mwb)

O especialista da DIO solicitou a criação de um banco de dados relacional com as seguintes ponderações:
* Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.
* Clientes levam veículos à oficina mêcanica para serem consertados ou para passarem por revisões periódicas.
* Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
* A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.
* O valor de cada peça também irá compor a OS.
* O cliente autoriza a execução dos serviços.
* A mesma equipe avalia e executa os serviços.
* Os mecânicos possuem código, nome, endereço e especialidade.
* Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.
* Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contido em mais de uma OS.
* Uma OS pode ter vários tipos  de peça e uma peça pode estar presente em mais de uma OS.

Diante dessas informações criei as seguintes entidades:

* __Cliente__: Contendo a chave primária de identificação da entidade, o nome completo, CPF, endereço, contato.
* __Carros__: Um cliente poderá possuir vários carros, por isso, a criação dessa entidade, que contém a chave primária de identificação e chave estrangeira do cliente, além, de marca, modelo, categoria, ano, modelo e a placa.
* __Equipe__: Como o requisito solicitava que uma equipe de mecânico cuidaria do serviço a ser utilizado, agrupei os mecânicos em sua hierarquia de equipe, que contém o nome do supervisor e o setor de atuação.
* __Mecânico__: Vários mecânicos podem atuar nos setores diversos dentro de uma oficina, com isso, criei, a identificação do mecânico, a chave estrangeira para identificar a equipe a qual pertence, assim como, os atributos, nome completo, endereço e especialidade.
* __Ordem de Serviço__: A entidade mais central deste projeto, ela se relaciona com carros, cliente, equipe e Peças/Serviços, gerando todo o mecanismo de controle a qual foi solicitado no enunciado, contendo os atributos, chave primária, chaves estrangeiras de carros, cliente e equipe, além disso, contém a data de emissão, status e previsão de conclusão.
* __Peças/Serviços__: Foi solicitado que existisse uma tabela de preços, com isso, a união de peças e serviços numa única tabela, tende a melhorar a visualização dos dados, com êxito na exibição de dados agrupados. Contém, os atributos - Descrição, ValorUnitário e Tipo.
* __Relacao Serviço - OrdemDeServiço__: É gerada a partir da relação de N:M entre Peças/Serviços e Ordem de Serviço, deixando bastante organizado a sincronização entre tabelas.


## Criação dos schemas do banco de dados
### Clique aqui: [Script-SQL-Desafio-de-projeto-2](https://github.com/therogerioos/bootcamp-DIO-MySQL2/blob/main/Script-SQL-Desafio-de-projeto-2.sql)

Com base no modelo conceitual em EER, desenvolvi o modelo lógico.
1) __Tabela Cliente__:

    Armazena informações sobre os clientes da oficina mecânica, como IDCliente, NomeCompleto, CPF, Endereco e Contato.
    Possui uma chave primária (IDCliente) e algumas restrições UNIQUE para garantir a unicidade dos dados.

2) __Tabela Carros__:

    Armazena informações sobre os carros dos clientes, como IDCarros, Cliente_IDCliente, Marca, Modelo, Categoria, AnoModelo e Placa.
    Possui uma chave primária composta (IDCarros, Cliente_IDCliente) e uma chave estrangeira (Cliente_IDCliente) que referencia a tabela Cliente.

3) __Tabela Equipe__:

    Armazena informações sobre as equipes de mecânicos da oficina, como IDEquipe, Supervisor e Setor.
    Possui uma chave primária (IDEquipe).

4) __Tabela Mecanico__:

    Armazena informações sobre os mecânicos da oficina, como IDMecanico, Equipe_IDEquipe, NomeCompleto, Endereco e Especialidade.
    Possui uma chave primária composta (IDMecanico, Equipe_IDEquipe) e uma chave estrangeira (Equipe_IDEquipe) que referencia a tabela Equipe.

5) __Tabela OrdemDeServico__:

    Armazena informações sobre as ordens de serviço, como IDOrdemDeServico, Carros_IDCarros, Carros_Cliente_IDCliente, Equipe_IDEquipe, DataDeEmissao, StatusOS e PrevisaoConclusao.
    Possui uma chave primária composta (IDOrdemDeServico, Carros_IDCarros, Carros_Cliente_IDCliente, Equipe_IDEquipe) e várias chaves estrangeiras que referenciam as tabelas Carros e Equipe.

6) __Tabela PecasServicos__:

    Armazena informações sobre as peças e serviços disponíveis, como IDPecasServicos, Descricao, ValorUnitario e Tipo (Peças ou Serviços).
    Possui uma chave primária (IDPecasServicos).

7) __Tabela Relacao_PecaServico_OrdemDeServico__:

    Cria uma relação entre as ordens de serviço, peças e serviços utilizados em cada ordem.
    Possui várias chaves estrangeiras que referenciam as tabelas OrdemDeServico e PecasServicos.
    Essas tabelas e relacionamentos permitem que o sistema da oficina mecânica gerencie informações sobre clientes, carros, equipes de mecânicos, ordens de serviço e peças/serviços utilizados. Essa estrutura de banco de dados é importante para registrar e rastrear todas as atividades realizadas na oficina, garantindo um controle eficiente e organizado das operações.


## Inserção de dados fakes no banco de dados
### Clique aqui: [Inserção-de-dados-Desafio-de-projeto-2](https://github.com/therogerioos/bootcamp-DIO-MySQL2/blob/main/Inser%C3%A7%C3%A3o-de-dados-Desafio-de-projeto-2.sql)

Importei dados fakes para gerar consultas que demonstre o potenncial desse banco de dados desenvolvido.

## Consultas no banco de dados
### Clique aqui: [consultas-Desafio-de-projeto-2](https://github.com/therogerioos/bootcamp-DIO-MySQL2/blob/main/consultas-Desafio-de-projeto-2.sql)

1) Consulta sem refinamento de colunas e junção através de relacionamento de FK:
Nesta consulta, todas as tabelas são unidas utilizando a cláusula __FROM__, sem refinamento de colunas específicas a serem exibidas. Ela faz uma junção entre as tabelas OrdemDeServico, Carros, Cliente, Equipe, Relacao_PecaServico_OrdemDeServico e PecasServicos usando as chaves estrangeiras (FK) para relacioná-las. Isso resulta em um grande conjunto de resultados com todas as colunas de todas as tabelas envolvidas.

2) Consulta com refinamento de colunas e junção através de relacionamento de FK:
Nesta consulta, as tabelas são unidas usando a cláusula __INNER JOIN__ e refinamos as colunas a serem exibidas usando a cláusula __SELECT__. Ela produz os mesmos resultados da consulta anterior, mas agora apenas exibe as colunas que foram selecionadas.

3) Consulta refinada com junção e uso de alias para renomear colunas:
Nesta consulta, as tabelas são unidas com __INNER JOIN__ e refinamos as colunas a serem exibidas usando a cláusula __SELECT__. Também utilizamos aliases (apelidos) para renomear algumas colunas, tornando o resultado mais claro e legível.

4) Consulta refinada com junção, uso de alias e agrupamento com __GROUP BY__:
Nesta consulta, adicionamos a cláusula __GROUP BY__ para agrupar os resultados com base no nome do cliente, descrição do veículo, status da OS, data de emissão e previsão de conclusão. Isso permite obter um resumo do valor total do serviço, resultados em dados derivativos, agrupado por cliente e outros detalhes relacionados.

5) Consulta refinada com junção, uso de alias, agrupamento com __GROUP BY__ e filtro com __HAVING__:
Nesta consulta, adicionamos a cláusula __HAVING__ para filtrar apenas as ordens de serviço com status "Finalizado". Assim, obtemos o resumo do valor total do serviço agrupado apenas para as ordens de serviço que foram finalizadas.

*Essas consultas permitem acessar e exibir informações detalhadas sobre ordens de serviço, clientes, veículos, peças e serviços em uma oficina mecânica. As consultas refinadas com junções e filtros permitem obter resultados mais específicos e organizados, facilitando a visualização das informações relevantes para o sistema de gerenciamento da oficina.*