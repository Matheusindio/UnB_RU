# language: pt
@issue_bonus_1 @bonus
Funcionalidade: Gestão de turnos
  Como administrador
  Quero definir os horários dos turnos e dividi-los em time-frames configuráveis
  Para organizar a distribuição do FastPass

  Contexto:
    Dado que o administrador está autenticado
    E que existe o restaurante "Darcy Ribeiro"

  Cenário: Cadastrar um turno
    Dado que não existe o turno "almoço" no restaurante "Darcy Ribeiro"
    Quando o administrador cadastrar o turno "almoço" das 11:00 às 14:00 no restaurante "Darcy Ribeiro"
    Então o turno "almoço" deve ficar cadastrado das 11:00 às 14:00 no restaurante "Darcy Ribeiro"

  Cenário: Dividir um turno em time-frames
    Dado que existe o turno "almoço" das 11:00 às 14:00 no restaurante "Darcy Ribeiro"
    Quando o administrador definir a duração dos time-frames do turno "almoço" em 15 minutos
    Então o turno "almoço" deve ser dividido em 12 time-frames
    E o primeiro time-frame deve ser das 11:00 às 11:15
    E o último time-frame deve ser das 13:45 às 14:00

  Cenário: Alterar a duração dos time-frames de um turno
    Dado que o turno "almoço" das 11:00 às 14:00 está dividido em time-frames de 15 minutos
    Quando o administrador alterar a duração dos time-frames do turno "almoço" para 30 minutos
    Então o turno "almoço" deve ser dividido em 6 time-frames
    E o primeiro time-frame deve ser das 11:00 às 11:30

  Cenário: Disponibilizar os time-frames para inscrição no FastPass
    Dado que o turno "almoço" das 11:00 às 14:00 está dividido em time-frames de 15 minutos
    Quando um estudante consultar os time-frames do almoço para inscrição no FastPass
    Então deve visualizar os 12 time-frames do turno "almoço"

  Cenário: Recusar um turno com horário de término anterior ao de início
    Quando o administrador cadastrar o turno "almoço" das 14:00 às 11:00 no restaurante "Darcy Ribeiro"
    Então o turno não deve ser cadastrado
    E deve informar que o horário de término deve ser posterior ao de início

  Cenário: Recusar turnos sobrepostos no mesmo restaurante
    Dado que existe o turno "almoço" das 11:00 às 14:00 no restaurante "Darcy Ribeiro"
    Quando o administrador cadastrar o turno "jantar" das 13:30 às 19:30 no restaurante "Darcy Ribeiro"
    Então o turno "jantar" não deve ser cadastrado
    E deve informar que o horário conflita com o turno "almoço"

  Cenário: Recusar uma duração de time-frame maior que o turno
    Dado que existe o turno "almoço" das 11:00 às 14:00 no restaurante "Darcy Ribeiro"
    Quando o administrador definir a duração dos time-frames do turno "almoço" em 240 minutos
    Então os time-frames não devem ser alterados
    E deve informar que a duração do time-frame não pode ser maior que a duração do turno
