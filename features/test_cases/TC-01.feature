#language: pt

Funcionalidade: Caso de teste de exemplo
  Como estudante de testes automatizados,
  Eu quero aprender a utilizar os principais comandos do Capybara
  Para que eu aprenda a automatizar qualquer aplicativo da Web

  @wip
  Cenário: Acessar o site do Google e realizar uma consulta simples
    Dado O usuário acessa o site "https://www.google.com.br"
    Quando O usuário digita "GSW" na caixa de pesquisas e pressiona o botão ENTER no teclado
    Então O usuário deve visualizar resultados da busca apontando para o site "http://www.gsw.com.br"
