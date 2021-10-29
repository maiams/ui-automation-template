require 'capybara/cucumber'
require 'selenium/webdriver'
require 'rspec'
require 'fileutils'

Capybara.register_driver :remote do |app|
  Capybara::Selenium::Driver.new(app,
                       browser: :remote,
                                 url:  "http://localhost:4444",
                                 capabilities: {
                                   "browserName": "chrome",
                                   "platformName": "linux",
                                   "se:recordVideo": "true",
                                   "se:timeZone": "America/Sao_Paulo",
                                   "se:screenResolution": "1920x1080"
                                 })
end

Capybara.register_driver :dev do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :remote
  config.default_max_wait_time = 10
end

begin
  $session_id = Capybara.current_session.driver.browser.session_id
rescue NoMethodError
  $session_id = nil
end

@scenario = nil
FileUtils.mkdir_p "./docker-grid-selenium4/assets/#{$session_id}/" unless $session_id.is_a? NilClass

#Maximize window.
Capybara.current_session.driver.browser.manage.window.maximize

# On LINUX/FIREFOX the "manage.window.maximize" option above does not expand browser window to max screen size. Resize as below:
#window = Capybara.current_session.driver.browser.manage.window
#window.resize_to(1920,1080) # width, height

'''EXTRA CONFIG FOR SUBTITLE'''
def set_subtitle_start
  exit if $session_id.is_a? NilClass
  $time_0 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  sleep 0.1
end

def set_subtitle_finish(text)
  exit if $session_id.is_a? NilClass
  sleep 0.1
  $subtitle_path = "./docker-grid-selenium4/assets/#{$session_id}/video.srt"

  $time_1 = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  s0 = Time.at($time_0 - $time_reference_begin).utc.strftime("%k:%M:%S,%L")
  s1 = Time.at($time_1 - $time_reference_begin).utc.strftime("%k:%M:%S,%L")
  content = "\n#{$subtitle_index.to_s}\n#{s0.strip} --> #{s1.strip}\n#{text}\n"
  File.open($subtitle_path, 'a') { |file| file.write(content) }
  $subtitle_index = $subtitle_index + 1
end
