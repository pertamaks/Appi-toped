Before do
  $driver.start_driver
end

After do |scenario|
  if scenario.failed?
    FileUtils.mkdir_p('screenshot') unless File.directory?('screenshot')

    time_stamp = Time.now.strftime('%Y-%m-%d_%H.%M.%S')
    screenshot_name = time_stamp + '.png'
    screenshot_file = File.join('screenshot', screenshot_name)
    $driver.screenshot(screenshot_file)
    embed(screenshot_file.to_s, 'image/png')
    end

  $driver.driver_quit
end

AfterConfiguration do
  FileUtils.rm_r('screenshot') if File.directory?('screenshot')
end
