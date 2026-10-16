# language: pt
@issue_bonus_2 @bonus
Funcionalidade: Validação rigorosa do FastPass
  Como Aplicação de Controle
  Quero checar se o estudante sorteado para o FastPass chegou no time-frame vigente
  Para liberar a catraca e debitar a refeição apenas de quem chegou no horário, bloqueando a entrada dos demais

  Contexto:
    Dado que o valor vigente da refeição é de R$ 6,00
    E que o ponto de acesso está configurado para o restaurante "Darcy Ribeiro"
    E que o estudante "100001" foi sorteado para o FastPass do almoço no time-frame das 11:00 às 11:15

  Cenário: Liberar a entrada e debitar a refeição do sorteado que chegou no time-frame
    Dado que o estudante "100001" possui saldo de R$ 10,00
    E que o horário atual é 11:05
    Quando a Aplicação de Controle ler a identificação "100001" na entrada do FastPass
    Então deve enviar o comando de liberação para a catraca
    E o saldo do estudante deve continuar em R$ 10,00
    Quando a passagem do estudante pela catraca for confirmada
    Então deve debitar R$ 6,00 do saldo do estudante
    E o saldo do estudante deve ser de R$ 4,00

  Esquema do Cenário: Liberar a entrada nos limites do time-frame
    Dado que o estudante "100001" possui saldo de R$ 10,00
    E que o horário atual é <horário>
    Quando a Aplicação de Controle ler a identificação "100001" na entrada do FastPass
    Então deve enviar o comando de liberação para a catraca

    Exemplos:
      | horário |
      | 11:00   |
      | 11:15   |

  Cenário: Bloquear a entrada do sorteado que chegou antes do time-frame
    Dado que o estudante "100001" possui saldo de R$ 10,00
    E que o horário atual é 10:55
    Quando a Aplicação de Controle ler a identificação "100001" na entrada do FastPass
    Então não deve enviar o comando de liberação para a catraca
    E não deve efetuar débito no saldo do estudante
    E deve informar que o estudante está fora do time-frame do FastPass
    E portanto, deve voltar para o final da fila.

  Cenário: Bloquear a entrada do sorteado que chegou depois do time-frame
    Dado que o estudante "100001" possui saldo de R$ 10,00
    E que o horário atual é 11:20
    Quando a Aplicação de Controle ler a identificação "100001" na entrada do FastPass
    Então não deve enviar o comando de liberação para a catraca
    E não deve efetuar débito no saldo do estudante
    E deve informar que o estudante está fora do time-frame do FastPass
    E portanto, deve voltar para o final da fila.

  Cenário: Bloquear a entrada de estudante não sorteado
    Dado que o estudante "100002" não foi sorteado para o FastPass do almoço
    E que o estudante "100002" possui saldo de R$ 10,00
    E que o horário atual é 11:05
    Quando a Aplicação de Controle ler a identificação "100002" na entrada do FastPass
    Então não deve enviar o comando de liberação para a catraca
    E não deve efetuar débito no saldo do estudante
    E deve informar que o estudante não possui FastPass para o turno vigente

  Cenário: Bloquear a entrada do sorteado com saldo insuficiente
    Dado que o estudante "100001" possui saldo de R$ 5,99
    E que o horário atual é 11:05
    Quando a Aplicação de Controle ler a identificação "100001" na entrada do FastPass
    Então não deve enviar o comando de liberação para a catraca
    E não deve efetuar débito no saldo do estudante
    E deve informar que o saldo é insuficiente

  Cenário: Bloquear uma segunda entrada com o mesmo FastPass
    Dado que o estudante "100001" possui saldo de R$ 10,00
    E que o estudante "100001" já entrou pelo FastPass no almoço
    E que o horário atual é 11:10
    Quando a Aplicação de Controle ler a identificação "100001" na entrada do FastPass
    Então não deve enviar o comando de liberação para a catraca
    E não deve efetuar débito no saldo do estudante
    E deve informar que o FastPass já foi utilizado
