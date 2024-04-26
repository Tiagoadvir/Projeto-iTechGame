# Projeto-iTechGame
Prova técnica para Cód.X

Cenário:
O cliente solicitou um sistema de estatística onde irá fornecer informações de seus
usuários e saber quais são os jogos que eles mais preferem.
A proposta é criar um breve formulário onde o usuário irá informar o seu nome, o
tipo de console que ele utiliza, categoria de jogo que mais gosta (só pode ser um) e
o seu jogo preferido (só pode ser um).
Com essas informações a empresa terá um norte para dar uma boa experiência aos
seus usuários no jogo mais votado.
Cenário Técnico:
O sistema deve ter uma interface bonita e intuitiva para o usuário, dando a ele uma
experiência agradável no preenchimento do formulário.
O sistema deve ser multiplataforma (desktop e mobile). Nesse caso pode criar uma
aplicação em VCL para desktop e outra em FMX para mobile, ou se preferir pode
criar uma única aplicação em FMX para desktop e mobile.
O sistema deve seguir um padrão de projeto (a sua escolha), o código deve ser bem
identado e bem escrito seguindo as boas práticas de programação.
O banco de dados do sistema deve ser o SQLite.
Deve-se criar um repositório no github para subir o projeto e enviar o link desse
repositório para nós.
Além do formulário criado para o usuário preencher, deve criar um outro sistema em
VCL que irá mostrar os dados da pesquisa, com uma grid mostrando todas as
respostas dos usuários e um filtro por categoria de jogo.
O sistema deve apresentar as estatística( total de respostas, total de categorias,
total melhor jogo), esses dados podem ser apresentados em tela para o usuário
como gráfico ou como indicadores.

Nessse projeto utilizei o restrequest4delphi do vinicius, os dados são providos apartir de uma api, tanto  para a aplicação hibrida (desktop / mobile), quanto para a aplicação vcl.
Foi utilizado duas units que o Heber da 99codes utiliza, que gera mensagens alerts personalizadas,e um combobox personalizados.
