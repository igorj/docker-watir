require 'watir'
require 'webdrivers'

HEADLESS = ENV['headless'] == 'false' ? false : true
WIDTH = ENV['width'] || 1280
HEIGHT = ENV['height'] || 1280

args = ['--no-sandbox', "--width=#{WIDTH}", "--height=#{HEIGHT}"]
args << '--headless' if HEADLESS

#profile = Selenium::WebDriver::Firefox::Profile.new
#profile['browser.download.dir'] = '/tmp/webdriver-downloads'
#profile['browser.download.folderList'] = 2
#profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/pdf'

b = Watir::Browser.new :firefox, options: { args: args } #, profile: profile

b.goto 'http://a.testaddressbook.com'
b.link(text: "Sign in").click
b.text_field(id: 'session_email').set 'watir_example@example.com'
b.text_field(id: 'session_password').set 'password'
b.button(name: 'commit').click
puts b.h1.text
b.screenshot.save File.join(__dir__, 'screenshots', 'firefox.png')