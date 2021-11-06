class ColunaSection < SitePrism::Section
  element :status_payments, :xpath, "td[2]"
  element :empresa, :xpath, "td[3]"
  element :obrigacao_fiscal, :xpath, "td[4]"
  element :valor_principal, :xpath, "td[5]"
  element :total_a_pagar, :xpath, "td[6]"
  element :data_vencimento, :xpath, "td[7]"
  element :responsavel_atual, :xpath, "td[9]"
end

class AprovacaoFiscalPage < SitePrism::Page
  set_url 'https://homologacao.gsw.com.br/Payments_Web/aprovacao-fiscal'

  sections :linha, ColunaSection, :xpath, '//tbody/tr'
end


