# ui-automation-template
Exemplo de teste automatizado de interface

Requisitos:
- Ruby com DevKit (2.7 ou superior);
- Selenium Webdriver (Neste exemplo, utilizamos o Firefox)
- gem bundler (pelo terminal, digite: `gem install bundler`)
- Firefox

Executando o teste:
- Instale as gems, com o comando `bundle install` à partir da raiz deste projeto;
- Execute o comando `cucumber -t"@wip"`
- Pga gerar um relatório com prints, no terminal, execute o comando `ruby .\report_builder.rb`
- O relatório esta em results/report.html
