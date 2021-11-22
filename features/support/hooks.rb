Before do |scenario|
  @scenario = scenario
  $subtitle_index = 1
  STDOUT.sync = true

  $time_reference_begin = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  $step_index = 0
  $stop_count = scenario.test_steps.count

  set_subtitle_start if $step_index < $stop_count
  sleep 2
  set_subtitle_finish scenario.name
  set_subtitle_start if $step_index < $stop_count
end

After do |scenario|
  sleep 2
  $time_reference_end = Process.clock_gettime(Process::CLOCK_MONOTONIC)
end

AfterStep do |step|
  attach page.save_screenshot
  text_step = nil
  if $step_index < $stop_count
    text_step = @scenario.test_steps[$step_index].text
    set_subtitle_finish text_step
  end
  $step_index += 2

  sleep 0.1
  set_subtitle_start if $step_index < $stop_count
end

# AfterConfiguration do |config|
#   config.on_event :test_step_finished do |event|
#     if event.result.failed?
#       text_step = nil
#       if $step_index < $stop_count and not @scenario.is_a? NilClass
#         text_step = @scenario.test_steps[$step_index].text
#         set_subtitle_finish text_step
#       end
#       $step_index += 2
#     end
#   end
# end
