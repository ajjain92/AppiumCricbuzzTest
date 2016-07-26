require 'selenium-webdriver'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'appium_capybara'

DEVICE_ID = "02157df23bc41912"
APPIUM_PORT = "4723"
HIVE_QUEUE_NAME = "Galaxy S6"
def appium_caps
    {
        'MY_DEVICE'=> { platformName: "Android", deviceName: "Galaxy S4", udid: "02157df23bc41912", browserName: "chrome" } #, browserName: "Browser", platformVersion: “4.3”, deviceName: "#{DEVICE_ID}"
    }
end


Capybara.register_driver :appium do |app|
    caps = appium_caps.fetch('MY_DEVICE')
    desired_caps = caps
    url = "http://127.0.0.1:#{APPIUM_PORT}/wd/hub/" # Url to your running appium server
    appium_lib_options = { server_url: url }
    all_options = { appium_lib:  appium_lib_options, caps: desired_caps }
    Capybara::Selenium::Driver.new(app, {:browser => :remote, :url => url, :desired_capabilities => caps})
    Appium::Capybara::Driver.new app, all_options
end

Capybara.default_driver = :appium