# language: pt
@issue_8
Funcionalidade: Gestão de restaurantes e catracas
  Como administrador
  Quero cadastrar, editar e remover restaurantes e suas respectivas catracas
  Para que os funcionários possam selecioná-los na Aplicação de Controle

  Contexto:
    Dado que o administrador está autenticado

  Cenário: Cadastrar um restaurante
    Dado que não existe um restaurante chamado "Darcy Ribeiro"
    Quando o administrador cadastrar o restaurante "Darcy Ribeiro"
    Então o restaurante "Darcy Ribeiro" deve ficar disponível para seleção na Aplicação de Controle

  Cenário: Editar um restaurante
    Dado que existe o restaurante "Darcy Ribeiro"
    Quando o administrador alterar o nome do restaurante para "RU Darcy Ribeiro"
    Então o restaurante "RU Darcy Ribeiro" deve ficar disponível para seleção na Aplicação de Controle
    E o restaurante "Darcy Ribeiro" não deve mais ficar disponível para seleção

  Cenário: Remover um restaurante
    Dado que existem os restaurantes Darcy Ribeiro e Gama
    Quando o administrador remover o restaurante "Darcy Ribeiro"
    Então o restaurante "Darcy Ribeiro" não deve mais ficar disponível para seleção
    E o restaurante "Gama" deve continuar disponível para seleção

  Cenário: Cadastrar uma catraca em um restaurante
    Dado que existe o restaurante "Darcy Ribeiro"
    E que não existe a catraca "Entrada 1"
    Quando o administrador cadastrar a catraca "Entrada 1" no restaurante "Darcy Ribeiro"
    Então a catraca "Entrada 1" deve ficar associada ao restaurante "Darcy Ribeiro"
    E deve ficar disponível para seleção na Aplicação de Controle

  Cenário: Editar uma catraca
    Dado que a catraca "Entrada 1" está associada ao restaurante "Darcy Ribeiro"
    Quando o administrador alterar o nome da catraca para "Entrada 2"
    Então a catraca "Entrada 2" deve ficar associada ao restaurante "Darcy Ribeiro"
    E a catraca "Entrada 1" não deve mais ficar disponível para seleção

  Cenário: Remover uma catraca
    Dado que as catracas "Entrada 1" e "Entrada 2" estão associadas ao restaurante "Darcy Ribeiro"
    Quando o administrador remover a catraca "Entrada 1"
    Então a catraca "Entrada 1" não deve mais ficar disponível para seleção
    E a catraca "Entrada 2" deve continuar disponível para seleção
