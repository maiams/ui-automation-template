#language: pt

@screenshot
Funcionalidade: Caso de teste de exemplo
  Como estudante de testes automatizados,
  Eu quero aprender a utilizar os principais comandos do Capybara
  Para que eu aprenda a automatizar qualquer aplicativo da Web

  @wip
  Cenário: Acessar o site do Google e realizar uma consulta simples
    Dado O usuário acessa o site "https://www.google.com.br"
    Quando O usuário digita "GSW" na caixa de pesquisas e pressiona o botão ENTER no teclado
    Então O usuário deve visualizar resultados da busca apontando para o site "http://www.gsw.com.br"

  @facebook
  Cenário: Acessar o Facebook e causar muito
    Dado O usuário acessa o site "https://fb.com"
    E O usuário se autentica no sistema
    Quando O usuário escrever uma publicação com o texto "oi mundo"
    Então A publicação deve aparecer no feed de notícias do Facebook

  @contas
  Cenário: Comparar contas exibidas na tela do sistema com os registros em banco
    Dado O usuário acessa o site de Aprovação Fiscal
    Quando O usuário se conecta ao banco de dados
    Então O usuário compara os dados do banco de dados com os exibidos no sistema
