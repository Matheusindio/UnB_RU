# language: pt
@issue_bonus_3 @bonus
Funcionalidade: Notificação do sorteio
  Como estudante
  Quero ser notificado se ganhei ou não o FastPass 1 hora antes do turno
  Para que eu possa planejar meu horário de ida ao RU

  Contexto:
    Dado que o turno "almoço" do restaurante "Darcy Ribeiro" começa às 11:00
    E que o estudante "100001" está inscrito no time-frame das 11:00 às 11:15 do almoço

  Cenário: Notificar o estudante sorteado
    Dado que o estudante "100001" foi sorteado para o FastPass do almoço
    Quando o horário atual for 10:00
    Então o estudante "100001" deve receber uma notificação informando que ganhou o FastPass
    E a notificação deve informar o time-frame das 11:00 às 11:15

  Cenário: Notificar o estudante não sorteado
    Dado que o estudante "100001" não foi sorteado para o FastPass do almoço
    Quando o horário atual for 10:00
    Então o estudante "100001" deve receber uma notificação informando que não ganhou o FastPass

  Cenário: Não notificar antes de 1 hora do início do turno
    Dado que o estudante "100001" foi sorteado para o FastPass do almoço
    Quando o horário atual for 09:59
    Então o estudante "100001" não deve ter recebido notificação do sorteio do almoço

  Cenário: Não notificar estudante que não se inscreveu
    Dado que o estudante "100002" não está inscrito no FastPass do almoço
    Quando o horário atual for 10:00
    Então o estudante "100002" não deve receber notificação do sorteio do almoço

  Cenário: Enviar apenas uma notificação por turno
    Dado que o estudante "100001" foi sorteado para o FastPass do almoço
    E que o estudante "100001" já recebeu a notificação do sorteio do almoço
    Quando o horário atual for 10:30
    Então o estudante "100001" não deve receber uma nova notificação do sorteio do almoço
