# language: pt
@issue_7
Funcionalidade: Histórico local da catraca
  Como funcionário
  Quero visualizar o histórico dos acessos registrados na catraca que estou gerenciando
  Para realizar auditorias e conferências locais de fluxo

  Contexto:
    Dado que o funcionário está autenticado
    E está gerenciando a catraca "Entrada 1"

  Cenário: Visualizar todos os acessos da catraca gerenciada
    Dado que os seguintes acessos foram registrados:
      | catraca   | estudante  |
      | Entrada 1 | 100001     |
      | Entrada 1 | 100002     |
    Quando o funcionário consultar o histórico local
    Então o histórico deve exibir os acessos dos estudantes:
      | estudante  |
      | 100001     |
      | 100002     |

  Cenário: Não exibir acessos de outras catracas
    Dado que os seguintes acessos foram registrados:
      | catraca   | estudante  |
      | Entrada 1 | 100001     |
      | Entrada 2 | 100002     |
    Quando o funcionário consultar o histórico local
    Então o histórico deve exibir o acesso do estudante "100001"
    Mas não deve exibir o acesso do estudante "100002"

  Cenário: Consultar uma catraca sem acessos registrados
    Dado que não há acessos registrados na catraca "Entrada 1"
    Quando o funcionário consultar o histórico local
    Então o histórico deve ser exibido vazio
