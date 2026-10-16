# language: pt
@issue_6
Funcionalidade: Validação de entrada
  Como Aplicação de Controle
  Quero identificar o estudante, verificar seu saldo, liberar a catraca e debitar a refeição
  Para permitir a entrada apenas quando o estudante puder pagar pela refeição

  Contexto:
    Dado que o valor vigente da refeição é de R$ 6,00

  Cenário: Liberar a entrada e debitar a refeição após a passagem
    Dado que o estudante "100001" possui saldo de R$ 10,00
    Quando a Aplicação de Controle ler a identificação "100001"
    Então deve enviar o comando de liberação para a catraca
    E o saldo do estudante deve continuar em R$ 10,00
    Quando a passagem do estudante pela catraca for confirmada
    Então deve debitar R$ 6,00 do saldo do estudante
    E o saldo do estudante deve ser de R$ 4,00

  Cenário: Liberar a entrada quando o saldo for igual ao valor da refeição
    Dado que o estudante "100001" possui saldo de R$ 6,00
    Quando a Aplicação de Controle ler a identificação "100001"
    Então deve enviar o comando de liberação para a catraca
    Quando a passagem do estudante pela catraca for confirmada
    Então deve debitar R$ 6,00 do saldo do estudante
    E o saldo do estudante deve ser de R$ 0,00

  Cenário: Recusar a entrada por saldo insuficiente
    Dado que o estudante "100001" possui saldo de R$ 5,99
    Quando a Aplicação de Controle ler a identificação "100001"
    Então não deve enviar o comando de liberação para a catraca
    E não deve efetuar débito no saldo do estudante
    E deve informar que o saldo é insuficiente

  Cenário: Não debitar quando o estudante não passar pela catraca
    Dado que o estudante "100001" possui saldo de R$ 10,00
    Quando a Aplicação de Controle ler a identificação "100001"
    Então deve enviar o comando de liberação para a catraca
    Mas enquanto a passagem não for confirmada, o saldo do estudante deve continuar em R$ 10,00

  Cenário: Recusar uma identificação de estudante desconhecida
    Dado que não existe estudante com a identificação "999999"
    Quando a Aplicação de Controle ler a identificação "999999"
    Então não deve enviar o comando de liberação para a catraca
    E não deve efetuar débito
    E deve informar que o estudante não foi encontrado
