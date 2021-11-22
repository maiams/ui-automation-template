require 'report_builder'
time = Time.now
ReportBuilder.configure do |config|
  config.json_path = 'results/report.json'
  config.report_path = 'results/report'
  config.report_types = [:html]
  config.report_title = 'TESTES AUTOMATIZADOS - GSW'
  config.compress_images = false
  config.additional_info = { 'PROJETO' => 'PROJETO XPTO', 'PLATAFORMA' => 'WINDOWS', 'GERADO EM ' => time }
end
ReportBuilder.build_report

