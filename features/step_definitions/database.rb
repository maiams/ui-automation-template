Dado('O usuário se conecta ao banco de dados') do
  @client = TinyTds::Client.new username: 'sa', password: 'teste123', host: 'localhost'
end

When(/^O usuário compara os dados do banco de dados com os exibidos no sistema$/) do
  # a query abaixo deve ser EXATAMENTE igual a query utilizada para exibir os dados na tela
  result = @client.execute("SELECT * FROM test")
  expect(result.count).to eq(@aprovacao_fiscal.linha.size)

  # agregando falhas. sem esse recurso, o teste sempre vai parar na primeira falha e deixar de testar o resto.
  aggregate_failures "testando aprovação fiscal" do

    #otimizando o loop com .zip. supondo o seguinte cenário:
    # array1 = ["pão", "ovo", "batata"]
    # array2 = [1, 2, 3]
    # array1.zip(array2) une os dois arrays em um só:
    # [[1, "pão"], [2, "ovo"], [3, "batata"]]
    # Com isso, fica mais simples iterar sobre os elementos do array.
    @aprovacao_fiscal.linha.zip(result).each do |dados_web, dados_banco|
      expect(dados_web.status_payments.text.strip).to eq(dados_banco["status_payments"].to_s.strip)
      expect(dados_web.empresa.text.strip).to eq(dados_banco["empresa"].to_s.strip)
      expect(dados_web.obrigacao_fiscal.text.strip).to eq(dados_banco["obrigacao_fiscal"].to_s.strip)
      expect(dados_web.valor_principal.text.strip).to eq(dados_banco["valor_principal"].to_s.strip)
      expect(dados_web.total_a_pagar.text.strip).to eq(dados_banco["total_a_pagar"].to_s.strip)
      expect(dados_web.data_vencimento.text.strip).to eq(dados_banco["data_vencimento"].to_s.strip)
      expect(dados_web.responsavel_atual.text.strip).to eq(dados_banco["responsavel_atual"].to_s.strip)

      # Caso queira imprimir os valores das comparações, descomente as linhas abaixo
      # puts "#{dados_web.status_payments.text.strip} == #{dados_banco['status_payments'].to_s.strip}"
      # puts "#{dados_web.empresa.text.strip} == #{dados_banco['empresa'].to_s.strip}"
      # puts "#{dados_web.obrigacao_fiscal.text.strip} == #{dados_banco['obrigacao_fiscal'].to_s.strip}"
      # puts "#{dados_web.valor_principal.text.strip} == #{dados_banco['valor_principal'].to_s.strip}"
      # puts "#{dados_web.total_a_pagar.text.strip} == #{dados_banco['total_a_pagar'].to_s.strip}"
      # puts "#{dados_web.data_vencimento.text.strip} == #{dados_banco['data_vencimento'].to_s.strip}"
      # puts "#{dados_web.responsavel_atual.text.strip} == #{dados_banco['responsavel_atual'].to_s.strip}"
    end
  end
end

When(/^O usuário acessa o site de Aprovação Fiscal$/) do
  require_relative "#{ROOT_PATH}/page_objects/aprovacao_fiscal_page"
  @aprovacao_fiscal = AprovacaoFiscalPage.new
  @aprovacao_fiscal.load
end
