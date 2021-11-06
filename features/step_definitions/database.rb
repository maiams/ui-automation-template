Dado('O usuário se conecta ao banco de dados') do
  @client = TinyTds::Client.new username: 'sa', password: 'teste123', host: 'localhost'
end

When(/^O usuário compara os dados do banco de dados com os exibidos no sistema$/) do
  result = @client.execute("SELECT * FROM test")

  index0 = 0
  @aprovacao_fiscal.linha.each do |l|
    index0 += 1
    index1 = 0
    result.each do |row|
      index1 += 1
      if index0 == index1
        expect(l.status_payments.text.strip).to eq(row["status_payments"].to_s.strip)
        expect(l.empresa.text.strip).to eq(row["empresa"].to_s.strip)
        expect(l.obrigacao_fiscal.text.strip).to eq(row["obrigacao_fiscal"].to_s.strip)
        expect(l.valor_principal.text.strip).to eq(row["valor_principal"].to_s.strip)
        expect(l.total_a_pagar.text.strip).to eq(row["total_a_pagar"].to_s.strip)
        expect(l.data_vencimento.text.strip).to eq(row["data_vencimento"].to_s.strip)
        expect(l.responsavel_atual.text.strip).to eq(row["responsavel_atual"].to_s.strip)

        puts "#{l.status_payments.text.strip} == #{row['status_payments'].to_s.strip}"
        puts "#{l.empresa.text.strip} == #{row['empresa'].to_s.strip}"
        puts "#{l.obrigacao_fiscal.text.strip} == #{row['obrigacao_fiscal'].to_s.strip}"
        puts "#{l.valor_principal.text.strip} == #{row['valor_principal'].to_s.strip}"
        puts "#{l.total_a_pagar.text.strip} == #{row['total_a_pagar'].to_s.strip}"
        puts "#{l.data_vencimento.text.strip} == #{row['data_vencimento'].to_s.strip}"
        puts "#{l.responsavel_atual.text.strip} == #{row['responsavel_atual'].to_s.strip}"
      end
    end
  end

end

When(/^O usuário acessa o site de Aprovação Fiscal$/) do
  require_relative "#{ROOT_PATH}/page_objects/aprovacao_fiscal_page"
  @aprovacao_fiscal = AprovacaoFiscalPage.new
  @aprovacao_fiscal.load
end
