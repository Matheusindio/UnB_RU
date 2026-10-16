# language: pt
@issue_5
Funcionalidade: Configuração do ponto de acesso
  Como funcionário do restaurante
  Quero selecionar o restaurante que vou gerenciar logo após o login
  Para que o sistema aplique as regras e grave os registros no restaurante correto

  Contexto:
    Dado que o funcionário está autenticado na Aplicação de Controle

  Cenário: Exibir os restaurantes disponíveis após o login
    Dado que os restaurantes "Darcy Ribeiro" e "Gama" estão disponíveis
    Quando o login for concluído
    Então o sistema deve solicitar a seleção do restaurante
    E deve exibir os restaurantes Darcy Ribeiro e Gama

  Cenário: Selecionar o restaurante que será gerenciado
    Dado que o restaurante "Darcy Ribeiro" está disponível
    Quando o funcionário selecionar o restaurante "Darcy Ribeiro"
    Então o ponto de acesso deve ficar configurado para o restaurante "Darcy Ribeiro"
    E as operações seguintes devem usar as regras do restaurante "Darcy Ribeiro"

  Cenário: Impedir operações antes da seleção do restaurante
    Dado que o funcionário ainda não selecionou um restaurante
    Quando tentar iniciar uma operação de controle de acesso
    Então o sistema não deve iniciar a operação
    E deve solicitar a seleção do restaurante

  Cenário: Registrar operações no restaurante selecionado
    Dado que o funcionário selecionou o restaurante "Darcy Ribeiro"
    Quando uma operação de controle de acesso for registrada
    Então o registro da operação deve estar associado ao restaurante "Darcy Ribeiro"
    E não deve estar associado a outro restaurante
