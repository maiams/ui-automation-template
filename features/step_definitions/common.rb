Dado('O usuário acessa o site {string}') do |url|
  visit url
end

Quando('O usuário digita {string} na caixa de pesquisas e pressiona o botão ENTER no teclado') do |texto_pesquisa|
  fill_in 'q', with: texto_pesquisa
  find(:xpath, "//input[@name='q']").send_keys :return
end

Então('O usuário deve visualizar resultados da busca apontando para o site {string}') do |resultado|
  expect(page).to have_content resultado
end

Dado('O usuário se autentica no sistema') do
  fill_in 'email', with: 'maiams@msn.com'
  fill_in 'pass', with: "*******"
  find('login').click
end

Quando('O usuário escrever uma publicação com o texto {string}') do |texto|
  find(:xpath, "//span[contains(text(),'No que você está pensando, Ricardo?')]").click
  fill_in :xpath, "//div[@class='_1mf _1mj']", with: texto
  find(:xpath, "//span[contains(text(),'Publicar')]").click
end

Então('A publicação deve aparecer no feed de notícias do Facebook') do
  pending
end
