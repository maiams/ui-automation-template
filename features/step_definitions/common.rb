Dado('O usuário acessa o site {string}') do |url|
  visit url
end

Quando('O usuário digita {string} na caixa de pesquisas e pressiona o botão ENTER no teclado') do |texto_pesquisa|
  fill_in 'q', with: texto_pesquisa
  click_button 'Pesquisa Google'
end

Então('O usuário deve visualizar resultados da busca apontando para o site {string}') do |resultado|
  expect(page).to have_content resultado
end