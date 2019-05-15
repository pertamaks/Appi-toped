require 'appium_lib'
require 'selenium-webdriver'
require 'pry'
# require 'rspec/expectation'

appium_txt = File.join(Dir.pwd, 'appium.txt')
caps = Appium.load_appium_txt file: appium_txt

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object


